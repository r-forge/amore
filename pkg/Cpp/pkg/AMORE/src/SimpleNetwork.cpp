/*
 * SimpleNetwork.cpp
 *
 *  Created on: 22/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/Container.h"
#include "classHeaders/Iterator.h"
#include "classHeaders/Neuron.h"

#include "classHeaders/NeuralNetwork.h"
#include "classHeaders/SimpleNetwork.h"

SimpleNetwork::SimpleNetwork(NeuralFactoryPtr neuralFactoryPtr) :
		NeuralNetwork(neuralFactoryPtr) {
}

SimpleNetwork::~SimpleNetwork() {
}

Rcpp::NumericMatrix SimpleNetwork::sim(Rcpp::NumericMatrix numericMatrix) {

	bool checkIncorrectNumberOfRows(
			inputSize() != static_cast<size_type>(numericMatrix.nrow()));
	if (checkIncorrectNumberOfRows) {
		throw std::runtime_error(
				"\nIncorrect number or rows. The number of input neurons must be equal to the number of rows of the input matrix.\n");
	}

	Rcpp::NumericMatrix outputMatrix(outputSize(), numericMatrix.ncol());
	std::vector<double>::iterator inputIterator(numericMatrix.begin());
	std::vector<double>::iterator outputIterator(outputMatrix.begin());

	// PREDICT LOOP
	{
		NeuronIteratorPtr inputNeuronIteratorPtr(d_inputLayer->createIterator());
		NeuronIteratorPtr outputNeuronIteratorPtr(d_outputLayer->createIterator());
		for (int i = 0; i < numericMatrix.ncol(); i++) {
			writeInput(inputIterator, inputNeuronIteratorPtr);
			singlePatternForwardAction();
			readOutput(outputIterator, outputNeuronIteratorPtr);
		}
		delete outputNeuronIteratorPtr;
		delete inputNeuronIteratorPtr;
	}
	return outputMatrix;

}

void SimpleNetwork::setNetworkTrainBehavior(
		NetworkTrainBehaviorPtr networkTrainBehaviorPtr) {
	d_networkTrainBehavior = networkTrainBehaviorPtr;
}

std::string SimpleNetwork::getNetworkTrainBehaviorName() {
	return d_networkTrainBehavior->getName();
}

void SimpleNetwork::setCostFunction(CostFunctionPtr costFunctionPtr) {
	d_costFunction = costFunctionPtr;
}

std::string SimpleNetwork::getCostFunctionName() {
	return d_costFunction->getName();
}

void SimpleNetwork::setNeuronTrainBehavior(NeuralFactory& neuralFactory) {
	// Hidden Layers
	{
		LayerIteratorPtr layerIteratorPtr(d_hiddenLayers->createIterator());
		for (layerIteratorPtr->first(); !layerIteratorPtr->isDone();
				layerIteratorPtr->next()) {
			NeuronIteratorPtr neuronIteratorPtr(
					layerIteratorPtr->currentItem()->createIterator());
			for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
					neuronIteratorPtr->next()) {
				NeuronTrainBehaviorPtr neuronTrainBehaviorPtr(
						neuralFactory.makeHiddenNeuronTrainBehavior(
								neuronIteratorPtr->currentItem()));
				neuronIteratorPtr->currentItem()->setNeuronTrainBehavior(
						neuronTrainBehaviorPtr);
			}
			delete neuronIteratorPtr;
		}
		delete layerIteratorPtr;
	}
	// Output Layers
	{
		NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
		for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone(); neuronIteratorPtr->next()) {
			NeuronTrainBehaviorPtr neuronTrainBehaviorPtr(neuralFactory.makeOutputNeuronTrainBehavior(neuronIteratorPtr->currentItem()));
			neuronIteratorPtr->currentItem()->setNeuronTrainBehavior(neuronTrainBehaviorPtr);
		}
		delete neuronIteratorPtr;
	}
}

void SimpleNetwork::writeInput(std::vector<double>::iterator& iterator, NeuronIteratorPtr neuronIteratorPtr) {
	for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
			neuronIteratorPtr->next()) {
		neuronIteratorPtr->currentItem()->setOutput(*iterator++);
	}
}

//void SimpleNetwork::writeTarget(std::vector<double>::iterator& iterator) {
//	NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
//	for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
//			neuronIteratorPtr->next()) {
//		neuronIteratorPtr->currentItem()->setTarget(*iterator++);
//	}
//	delete neuronIteratorPtr;
//}

void SimpleNetwork::writeTarget(std::vector<double>::iterator& iterator, NeuronIteratorPtr neuronIteratorPtr) {
	for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
			neuronIteratorPtr->next()) {
		neuronIteratorPtr->currentItem()->setTarget(*iterator++);
	}
}

void SimpleNetwork::singlePatternForwardAction() {
	// Hidden Layers
	{
		LayerIteratorPtr layerIteratorPtr(d_hiddenLayers->createIterator());
		for (layerIteratorPtr->first(); !layerIteratorPtr->isDone();	layerIteratorPtr->next()) {
			NeuronIteratorPtr neuronIteratorPtr(	layerIteratorPtr->currentItem()->createIterator());
			for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();	neuronIteratorPtr->next()) {
				neuronIteratorPtr->currentItem()->singlePatternForwardAction();
			}
			delete neuronIteratorPtr;
		}
		delete layerIteratorPtr;
	}

	// Output Layers
	{
		NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
		for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
				neuronIteratorPtr->next()) {
			neuronIteratorPtr->currentItem()->singlePatternForwardAction();
		}
		delete neuronIteratorPtr;
	}
}

void SimpleNetwork::singlePatternBackwardAction() {
	// Output Layers
	{
		NeuronIteratorPtr neuronIteratorPtr(
				d_outputLayer->createReverseIterator());
		for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
				neuronIteratorPtr->next()) {
			neuronIteratorPtr->currentItem()->singlePatternBackwardAction();
		}
		delete neuronIteratorPtr;
	}
	// Hidden Layers
	{
		LayerIteratorPtr layerIteratorPtr(
				d_hiddenLayers->createReverseIterator());
		for (layerIteratorPtr->first(); !layerIteratorPtr->isDone();
				layerIteratorPtr->next()) {
			NeuronIteratorPtr neuronIteratorPtr(
					layerIteratorPtr->currentItem()->createReverseIterator());
			for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
					neuronIteratorPtr->next()) {
				neuronIteratorPtr->currentItem()->singlePatternBackwardAction();
			}
			delete neuronIteratorPtr;
		}
		delete layerIteratorPtr;
	}
}

void SimpleNetwork::readOutput(std::vector<double>::iterator& iterator, NeuronIteratorPtr neuronIteratorPtr) {
	for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
			neuronIteratorPtr->next()) {
		*iterator++ = neuronIteratorPtr->currentItem()->d_output;
	}
}

Rcpp::List SimpleNetwork::train(Rcpp::List parameterList) {
	return d_networkTrainBehavior->train(parameterList);

}

size_type SimpleNetwork::inputSize() {
	return d_inputLayer->size();
}

size_type SimpleNetwork::outputSize() {
	return d_outputLayer->size();
}

double SimpleNetwork::costFunctionf0(double output, double target) {
	return d_costFunction->f0(output, target);
}

double SimpleNetwork::costFunctionf1(double output, double target) {
	return d_costFunction->f1(output, target);
}

void SimpleNetwork::setLearningRate(double learningRate) {

	// Hidden Layers
	{
		LayerIteratorPtr layerIteratorPtr(d_hiddenLayers->createIterator());
		for (layerIteratorPtr->first(); !layerIteratorPtr->isDone();
				layerIteratorPtr->next()) {
			NeuronIteratorPtr neuronIteratorPtr(
					layerIteratorPtr->currentItem()->createIterator());
			for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
					neuronIteratorPtr->next()) {
				neuronIteratorPtr->currentItem()->setLearningRate(learningRate);
			}
			delete neuronIteratorPtr;
		}
		delete layerIteratorPtr;
	}
	// Output Layers
	{
		NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
		for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
				neuronIteratorPtr->next()) {
			neuronIteratorPtr->currentItem()->setLearningRate(learningRate);
		}
		delete neuronIteratorPtr;
	}
}

void SimpleNetwork::show() {
	Rprintf("\n\n=========================================================\n");
	Rprintf("         Neural Network");
	Rprintf("\n=========================================================");

	Rprintf("\n Input size: %d\n", inputSize());
	Rprintf("\n Output size: %d\n", outputSize());
	Rprintf("\n Network Train Behavior: %s\n",
			getNetworkTrainBehaviorName().c_str()); // TODO revisar si esto es un memory-leak
	Rprintf("\n Cost Function: %s\n", getCostFunctionName().c_str()); // TODO revisar si esto es un memory-leak
	Rprintf("\n\n=========================================================\n");
	Rprintf("         Input Layer");
	Rprintf("\n=========================================================");
	d_inputLayer->show();

	Rprintf("\n\n=========================================================\n");
	Rprintf("         Hidden Layers");
	Rprintf("\n=========================================================");
	d_hiddenLayers->show();

	Rprintf("\n\n=========================================================\n");
	Rprintf("         Output Layer");
	Rprintf("\n=========================================================");
	d_outputLayer->show();
	Rprintf("\n=========================================================\n");

}

bool SimpleNetwork::validate() {
	d_inputLayer->validate();
	d_hiddenLayers->validate();
	d_outputLayer->validate();
	return true;
}
