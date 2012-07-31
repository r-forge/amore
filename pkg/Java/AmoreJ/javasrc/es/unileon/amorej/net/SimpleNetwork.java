package es.unileon.amorej.net;

import es.unileon.amorej.AmoreJException;
import es.unileon.amorej.Container;
import es.unileon.amorej.Iterator;
import es.unileon.amorej.NeuralFactory;
import es.unileon.amorej.Neuron;

public class SimpleNetwork implements NeuralNetwork {
	protected NeuralFactory factory;
	protected Container<Neuron> inputLayer;
	protected Container<Container<Neuron>> hiddenLayers;
	protected Container<Neuron> outputLayer;

	// TODO costFunction;

	public SimpleNetwork(NeuralFactory neuralFactory) {
		this.factory = neuralFactory;
		this.inputLayer = neuralFactory.makeLayer();
		this.hiddenLayers = neuralFactory.makeLayerContainer();
		this.outputLayer = neuralFactory.makeLayer();
		// TODO costFunction = neuralFactory.makeCostFunction("LMS");
	}

	public NeuralFactory getFactory() {
		return this.factory;
	}

	public void setFactory(NeuralFactory neuralFactory) {
		this.factory = neuralFactory;
	}

	

	public int numberOfLayers() {
		return this.hiddenLayers.size() + 2;
	}

	//
	// TODO Rcpp::NumericMatrix
	// SimpleNetwork::sim(Rcpp::NumericMatrix numericMatrix)
	// {
	//
	// bool checkIncorrectNumberOfRows(
	// inputSize() != static_cast<size_type> (numericMatrix.nrow()));
	// if (checkIncorrectNumberOfRows)
	// {
	// throw std::runtime_error(
	// "\nIncorrect number or rows. The number of input neurons must be equal to the number of rows of the input matrix.\n");
	// }
	//
	// Rcpp::NumericMatrix outputMatrix(outputSize(), numericMatrix.ncol());
	// std::vector<double>::iterator inputIterator(numericMatrix.begin());
	// std::vector<double>::iterator outputIterator(outputMatrix.begin());
	//
	// // PREDICT LOOP
	// for (int i = 0; i < numericMatrix.ncol(); i++)
	// {
	// writeInput(inputIterator);
	// singlePatternForwardAction();
	// readOutput(outputIterator);
	// }
	// return outputMatrix;
	//
	// }
	//
	// TODO void
	// SimpleNetwork::setNetworkTrainBehavior(
	// NetworkTrainBehaviorPtr networkTrainBehaviorPtr)
	// {
	// d_networkTrainBehavior = networkTrainBehaviorPtr;
	// }
	//
	// TODO std::string
	// SimpleNetwork::getNetworkTrainBehaviorName()
	// {
	// return d_networkTrainBehavior->getName();
	// }
	//
	// TODO void
	// SimpleNetwork::setCostFunction(CostFunctionPtr costFunctionPtr)
	// {
	// d_costFunction = costFunctionPtr;
	// }
	//
	// TODO std::string
	// SimpleNetwork::getCostFunctionName()
	// {
	// return d_costFunction->getName();
	// }
	//
	// TODO void
	// SimpleNetwork::setNeuronTrainBehavior(NeuralFactory& neuralFactory)
	// {
	//
	// // Hidden Layers
	// LayerIteratorPtr layerIteratorPtr(d_hiddenLayers->createIterator());
	//
	// for (layerIteratorPtr->first(); !layerIteratorPtr->isDone();
	// layerIteratorPtr->next())
	// {
	// NeuronIteratorPtr neuronIteratorPtr(
	// layerIteratorPtr->currentItem()->createIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// NeuronTrainBehaviorPtr neuronTrainBehaviorPtr(
	// neuralFactory.makeHiddenNeuronTrainBehavior(
	// neuronIteratorPtr->currentItem()));
	// neuronIteratorPtr->currentItem()->setNeuronTrainBehavior(
	// neuronTrainBehaviorPtr);
	// }
	// }
	//
	// // Output Layers
	// NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// NeuronTrainBehaviorPtr neuronTrainBehaviorPtr(
	// neuralFactory.makeOutputNeuronTrainBehavior(
	// neuronIteratorPtr->currentItem()));
	// neuronIteratorPtr->currentItem()->setNeuronTrainBehavior(
	// neuronTrainBehaviorPtr);
	// }
	// }
	//
	// TODO void
	// SimpleNetwork::writeInput(std::vector<double>::iterator& iterator)
	// {
	// NeuronIteratorPtr neuronIteratorPtr(d_inputLayer->createIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// neuronIteratorPtr->currentItem()->setOutput(*iterator++);
	// }
	// }
	//
	// TODO void
	// SimpleNetwork::writeTarget(std::vector<double>::iterator& iterator)
	// {
	// NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// neuronIteratorPtr->currentItem()->setTarget(*iterator++);
	// }
	// }
	//
	// TODO void
	// SimpleNetwork::singlePatternForwardAction()
	// {
	//
	// // Hidden Layers
	// LayerIteratorPtr layerIteratorPtr(d_hiddenLayers->createIterator());
	//
	// for (layerIteratorPtr->first(); !layerIteratorPtr->isDone();
	// layerIteratorPtr->next())
	// {
	// NeuronIteratorPtr neuronIteratorPtr(
	// layerIteratorPtr->currentItem()->createIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// neuronIteratorPtr->currentItem()->singlePatternForwardAction();
	// }
	// }
	//
	// // Output Layers
	// NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// neuronIteratorPtr->currentItem()->singlePatternForwardAction();
	// }
	// }
	//
	// TODO void
	// SimpleNetwork::singlePatternBackwardAction()
	// {
	// // Output Layers
	// NeuronIteratorPtr
	// neuronIteratorPtr(d_outputLayer->createReverseIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// neuronIteratorPtr->currentItem()->singlePatternBackwardAction();
	// }
	//
	// // Hidden Layers
	// LayerIteratorPtr
	// layerIteratorPtr(d_hiddenLayers->createReverseIterator());
	// for (layerIteratorPtr->first(); !layerIteratorPtr->isDone();
	// layerIteratorPtr->next())
	// {
	// NeuronIteratorPtr neuronIteratorPtr(
	// layerIteratorPtr->currentItem()->createReverseIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// neuronIteratorPtr->currentItem()->singlePatternBackwardAction();
	// }
	// }
	// }
	//
	// TODO void
	// SimpleNetwork::readOutput(std::vector<double>::iterator& iterator)
	// {
	// NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// *iterator++ = neuronIteratorPtr->currentItem()->getOutput();
	// }
	// }
	//
	// TODO Rcpp::List
	// SimpleNetwork::train(Rcpp::List parameterList)
	// {
	// return d_networkTrainBehavior->train(parameterList);
	//
	// }

	/**
	 * @return
	 */
	public int inputSize() {
		return inputLayer.size();
	}

	/**
	 * @return
	 */
	public int outputSize() {
		return outputLayer.size();
	}

	// double
	// SimpleNetwork::costFunctionf0(double output, double target)
	// {
	// return d_costFunction->f0( output, target );
	// }
	//
	//
	// double
	// SimpleNetwork::costFunctionf1(double output, double target)
	// {
	// return d_costFunction->f1( output, target );
	// }
	//
	//
	// void
	// SimpleNetwork::setLearningRate(double learningRate)
	// {
	//
	//
	// // Hidden Layers
	// LayerIteratorPtr layerIteratorPtr(d_hiddenLayers->createIterator());
	//
	// for (layerIteratorPtr->first(); !layerIteratorPtr->isDone();
	// layerIteratorPtr->next())
	// {
	// NeuronIteratorPtr neuronIteratorPtr(
	// layerIteratorPtr->currentItem()->createIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// neuronIteratorPtr->currentItem()->setLearningRate(learningRate);
	// }
	// }
	//
	// // Output Layers
	// NeuronIteratorPtr neuronIteratorPtr(d_outputLayer->createIterator());
	// for (neuronIteratorPtr->first(); !neuronIteratorPtr->isDone();
	// neuronIteratorPtr->next())
	// {
	// neuronIteratorPtr->currentItem()->setLearningRate(learningRate);
	// }
	//
	//
	// }

	/**
	 * 
	 */
	public void show() {
		System.out
				.println("\n\n=========================================================");
		System.out.println("         Neural Network");
		System.out
				.println("\n=========================================================");

		System.out.println("\n Input size: " + inputSize());
		System.out.println("\n Output size: " + outputSize());
		// TODO System.out.println("\n Network Train Behavior: " +
		// getNetworkTrainBehaviorName());
		// TODO System.out.println("\n Cost Function: %s\n",
		// getCostFunctionName().c_str());
		System.out
				.println("\n\n=========================================================");
		System.out.println("         Input Layer");
		System.out
				.println("\n=========================================================");
		inputLayer.show();

		System.out
				.println("\n\n=========================================================");
		System.out.println("         Hidden Layers");
		System.out
				.println("\n=========================================================");
		hiddenLayers.show();

		System.out
				.println("\n\n=========================================================");
		System.out.println("         Output Layer");
		System.out
				.println("\n=========================================================");
		outputLayer.show();
		System.out
				.println("\n=========================================================");

	}

	/**
	 * @return
	 * @throws AmoreJException
	 */
	public boolean validate() throws AmoreJException {
		this.inputLayer.validate();
		this.hiddenLayers.validate();
		this.outputLayer.validate();
		return true;
	}

		
}
