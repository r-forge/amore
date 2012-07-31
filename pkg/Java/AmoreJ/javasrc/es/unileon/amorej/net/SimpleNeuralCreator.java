package es.unileon.amorej.net;

import java.util.Iterator;
import java.util.List;

import es.unileon.amorej.AmoreJException;
import es.unileon.amorej.NeuralFactory;
import es.unileon.amorej.Neuron;

public class SimpleNeuralCreator implements NeuralCreator {

	public SimpleNeuralCreator() {
	}

	public NeuralNetwork createFeedForwardNetwork(NeuralFactory neuralFactory, List<Integer> numberOfNeurons) throws AmoreJException {
		// TODO Rcpp::List hiddenLayersActivationFunction = neuralFactoryPtr->makeXPtrFunctionList(hiddenLayersActivationFunctionName);
		// TODO Rcpp::List outputLayerActivationFunction = neuralFactoryPtr->makeXPtrFunctionList(outputLayerActivationFunctionName);
		// TODO return createCustomFeedForwardNetwork(neuralFactoryPtr, numberOfNeurons, hiddenLayersActivationFunction, outputLayerActivationFunction);
		return createCustomFeedForwardNetwork(neuralFactory, numberOfNeurons);
	}

	public NeuralNetwork createCustomFeedForwardNetwork(NeuralFactory neuralFactory, List<Integer> numberOfNeurons) throws AmoreJException {

		if (numberOfNeurons.size() < 3) {
			throw new AmoreJException("[Java CreateFeedForwardNetwork.validate]: Error, number of layers  smaller than 3.");
		}

		int totalAmountOfParameters = this.calculateNumberOfParameters(numberOfNeurons.iterator());

		SimpleNetwork simpleNetwork = (SimpleNetwork) neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron;
		int neuronId = 1;

		// ============================================================
		// Neuron insertion
		// ============================================================

		// Input Layer
		for (int i = 0; i < numberOfNeurons.get(0); ++i) {
			neuron = neuralFactory.makeNeuron(Integer.toString(neuronId++), simpleNetwork);

			// TODO NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr) );
			// TODO neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
			simpleNetwork.inputLayer.add(neuron);
		}

		// Hidden layers
		// TODO Rcpp::XPtr < CppFunctionPointer > f0XPtr = hiddenLayersActivationFunction["f0"];
		// TODO Rcpp::XPtr < CppFunctionPointer > f1XPtr = hiddenLayersActivationFunction["f1"];

		for (int i = 0; i < numberOfNeurons.get(1); ++i, ++neuronId) {
			neuron = neuralFactory.makeNeuron(Integer.toString(neuronId), simpleNetwork.inputLayer.createIterator(),
					totalAmountOfParameters, simpleNetwork);

			// TODO ActivationFunctionPtr activationFunctionPtr (neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr) );
			// TODO neuronPtr->setActivationFunction( activationFunctionPtr );
			// TODO NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr) );
			// TODO neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
			simpleNetwork.hiddenLayers.get(0).add(neuron);
		}


		for (int layerItr=2; layerItr <  (-1+numberOfNeurons.size()); ++layerItr) {
			simpleNetwork.hiddenLayers.add(neuralFactory.makeLayer());
			for (int i = 0; i < numberOfNeurons.get(layerItr); ++i, ++neuronId) {
				neuron = neuralFactory.makeNeuron(Integer.toString(neuronId), simpleNetwork.hiddenLayers.get(layerItr - 2)
						.createIterator(), totalAmountOfParameters, simpleNetwork);
				// TODO ActivationFunctionPtr activationFunctionPtr (neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr) );
				// TODO neuronPtr->setActivationFunction( activationFunctionPtr );
				// TODO NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr) );
				// TODO neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
				simpleNetwork.hiddenLayers.get(layerItr - 1).add(neuron);
			}
		}

		// Output Layer
		// TODO f0XPtr = outputLayerActivationFunction["f0"];
		// TODO f1XPtr = outputLayerActivationFunction["f1"];

		for (int i = 0; i < numberOfNeurons.get(numberOfNeurons.size() - 1); ++i, ++neuronId) {
			neuron = neuralFactory.makeNeuron(Integer.toString(neuronId), simpleNetwork.hiddenLayers.get(numberOfNeurons.size()-3)
					.createIterator(), totalAmountOfParameters, simpleNetwork);
			// TODO ActivationFunctionPtr activationFunctionPtr (neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr) );
			// TODO neuronPtr->setActivationFunction( activationFunctionPtr );
			// TODO NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeOutputNeuronTrainBehavior(neuronPtr) );
			// TODO neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
			simpleNetwork.outputLayer.add(neuron);
		}

		return (NeuralNetwork) simpleNetwork;
	}

	public int calculateNumberOfParameters(Iterator<Integer> sizeIterator) {
		int parameters = 0;
		int neurons = sizeIterator.next();
		int previousSize = neurons;
		while (sizeIterator.hasNext()) {
			int size = sizeIterator.next();
			neurons += size;
			parameters += size * previousSize;
			previousSize = size;
		}
		parameters += neurons;
		return parameters;
	}

}
