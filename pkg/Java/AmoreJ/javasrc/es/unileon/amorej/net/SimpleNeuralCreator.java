package es.unileon.amorej.net;

import java.util.Iterator;
import java.util.List;

import es.unileon.amorej.NeuralFactory;
import es.unileon.amorej.Neuron;

public class SimpleNeuralCreator implements NeuralCreator {

	public SimpleNeuralCreator() {
	}

	public NeuralNetwork createFeedForwardNetwork(NeuralFactory neuralFactory,
			List<Integer> numberOfNeurons) {
//	TODO     Rcpp::List hiddenLayersActivationFunction = neuralFactoryPtr->makeXPtrFunctionList(hiddenLayersActivationFunctionName);
//	TODO     Rcpp::List outputLayerActivationFunction  = neuralFactoryPtr->makeXPtrFunctionList(outputLayerActivationFunctionName);
//	TODO     return createCustomFeedForwardNetwork(neuralFactoryPtr, numberOfNeurons, hiddenLayersActivationFunction, outputLayerActivationFunction);
	    return createCustomFeedForwardNetwork(neuralFactoryPtr, numberOfNeurons);	
	}


	public NeuralNetwork createCustomFeedForwardNetwork(NeuralFactory neuralFactory, List<Integer> numberOfNeurons) {
		
		if (numberOfNeurons.size() <= 2) {
			throw AmoreJException("[Java CreateFeedForwardNetwork.validate]: Error, number of layers lower than 3.");
		}
		
		int totalAmountOfParameters = this.calculateNumberOfParameters(numberOfNeurons.iterator());
	
		NeuralNetwork neuralNetwork = new neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron;
		int neuronId = 1;


  //============================================================
  // Neuron insertion
  //============================================================

  //Input Layer
  for (int i = 0; i < numberOfNeurons.get(0); ++i) {
      neuron = neuralFactory.makeNeuron(Integer.toString(neuronId++));
      neuron.setNeuralNetwork(neuralNetwork);
// TODO      NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr) );
// TODO     neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
      neuralNetwork.addNeuronToLayer(neuron, 0);
  }

  // Hidden layers
// TODO  Rcpp::XPtr < CppFunctionPointer > f0XPtr      = hiddenLayersActivationFunction["f0"];
// TODO   Rcpp::XPtr < CppFunctionPointer > f1XPtr      = hiddenLayersActivationFunction["f1"];

  for (int i = 0; i < numberOfNeurons.get(1); ++i)
    {
      neuron = neuralFactory.makeNeuron(
                        neuronId++,
                        neuralNetwork.inputLayerCreateIterator(),
                        totalAmountOfParameters,
                        neuralNetwork
                     );
      
// TODO      ActivationFunctionPtr activationFunctionPtr (neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr) );
// TODO      neuronPtr->setActivationFunction( activationFunctionPtr );
// TODO      NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr) );
// TODO      neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
      neuralNetwork.addNeuronToLayer(neuron, 1);
    }

  unsigned int layerItr = 2;
  for (; layerItr < (-1 + numberOfNeurons.size()); ++layerItr)
    {
      neuralNetworkPtr->d_hiddenLayers->push_back(neuralFactoryPtr->makeLayer());
      for (int i = 0; i < numberOfNeurons.at(layerItr); ++i)
        {
          neuronPtr
              = neuralFactoryPtr->makeNeuron(
                      neuronId++,
                      neuralNetworkPtr->d_hiddenLayers->at(layerItr - 2)->createIterator(),
                      totalAmountOfParameters,
                      neuralNetworkPtr
                  );
// TODO          ActivationFunctionPtr activationFunctionPtr (neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr) );
// TODO          neuronPtr->setActivationFunction( activationFunctionPtr );
// TODO          NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr) );
// TODO          neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
           neuralNetwork.hiddenLayers.at(layerItr - 1)->push_back(neuronPtr);
        }
    }

  
  //Output Layer
// TODO  f0XPtr = outputLayerActivationFunction["f0"];
// TODO  f1XPtr = outputLayerActivationFunction["f1"];

  for (int i = 0; i < numberOfNeurons.back(); ++i)
    {
      neuronPtr = neuralFactoryPtr->makeNeuron(
                          neuronId++,
                          neuralNetworkPtr->d_hiddenLayers->at(layerItr - 2)->createIterator(),
                          totalAmountOfParameters,
                          neuralNetworkPtr
                      );
// TODO      ActivationFunctionPtr activationFunctionPtr (neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr) );
// TODO     neuronPtr->setActivationFunction( activationFunctionPtr );
// TODO     NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeOutputNeuronTrainBehavior(neuronPtr) );
// TODO     neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
      neuralNetwork.addNeuronToLayer(neuron, neuralNetwork.numberOfLayers()-1);
    }

  return neuralNetworkPtr;
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
