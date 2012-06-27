package es.unileon.amorej;

import java.util.Iterator;
import java.util.List;

public class SimpleNeuralCreator implements NeuralCreator {

	public SimpleNeuralCreator() {
	}

	public NeuralNetwork createFeedForwardNetwork(NeuralFactory neuralFactory,
			List<Integer> numberOfNeurons) {
//	    Rcpp::List hiddenLayersActivationFunction = neuralFactoryPtr->makeXPtrFunctionList(hiddenLayersActivationFunctionName);
//	    Rcpp::List outputLayerActivationFunction  = neuralFactoryPtr->makeXPtrFunctionList(outputLayerActivationFunctionName);
//	    return createCustomFeedForwardNetwork(neuralFactoryPtr, numberOfNeurons, hiddenLayersActivationFunction, outputLayerActivationFunction);
	    return createCustomFeedForwardNetwork(neuralFactoryPtr, numberOfNeurons);	
	}


	public NeuralNetwork createCustomFeedForwardNetwork(NeuralFactory neuralFactory, List<Integer> numberOfNeurons) {
		NeuralNetwork neuralNetwork = new neuralFactory.makeNeuralNetwork(neuralFactory);
		Neuron neuron;
	
		if (numberOfNeurons.size() <= 2) {
			throw AmoreJException("[Java CreateFeedForwardNetwork.validate]: Error, number of layers lower than 3.");
		}
		String neuronId = "1";

		//============================================================
		// Calculation of the total amount of parameters
		//============================================================
		int totalAmountOfParameters = 0;
		int totalNumberOfNeurons =0;
		
  Iterator<Integer> itr1 =  numberOfNeurons.iterator();
  Iterator<Integer> itr2 =  numberOfNeurons.iterator();
  itr2.next();
  
  for (  ; itr2.hasNext(); itr1.next(), itr2.next()){
      totalNumberOfNeurons += itr2;
      totalAmountOfParameters += itr2 * itr1; //integer multiplication
  }
  totalAmountOfParameters += totalNumberOfNeurons;

  //============================================================
  // Neuron insertion
  //============================================================

  //Input Layer
  for (int i = 0; i < numberOfNeurons.at(0); ++i)
    {
      neuronPtr = neuralFactory.makeNeuron(neuronId++);
      neuronPtr->setNeuralNetwork(neuralNetworkPtr);
      NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr) );
      neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
      neuralNetworkPtr->d_inputLayer->push_back(neuronPtr);
    }

  // Hidden layers
  Rcpp::XPtr < CppFunctionPointer > f0XPtr      = hiddenLayersActivationFunction["f0"];
  Rcpp::XPtr < CppFunctionPointer > f1XPtr      = hiddenLayersActivationFunction["f1"];

  for (int i = 0; i < numberOfNeurons.at(1); ++i)
    {
      neuronPtr = neuralFactoryPtr->makeNeuron(
                        neuronId++,
                        neuralNetworkPtr->d_inputLayer->createIterator(),
                        totalAmountOfParameters,
                        neuralNetworkPtr
                     );
      ActivationFunctionPtr activationFunctionPtr (neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr) );
      neuronPtr->setActivationFunction( activationFunctionPtr );
      NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr) );
      neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
      neuralNetworkPtr->d_hiddenLayers->at(0)->push_back(neuronPtr);
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
          ActivationFunctionPtr activationFunctionPtr (neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr) );
          neuronPtr->setActivationFunction( activationFunctionPtr );
          NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeHiddenNeuronTrainBehavior(neuronPtr) );
          neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
          neuralNetworkPtr->d_hiddenLayers->at(layerItr - 1)->push_back(neuronPtr);
        }
    }

  //Output Layer
  f0XPtr = outputLayerActivationFunction["f0"];
  f1XPtr = outputLayerActivationFunction["f1"];

  for (int i = 0; i < numberOfNeurons.back(); ++i)
    {
      neuronPtr = neuralFactoryPtr->makeNeuron(
                          neuronId++,
                          neuralNetworkPtr->d_hiddenLayers->at(layerItr - 2)->createIterator(),
                          totalAmountOfParameters,
                          neuralNetworkPtr
                      );
      ActivationFunctionPtr activationFunctionPtr (neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr) );
      neuronPtr->setActivationFunction( activationFunctionPtr );
      NeuronTrainBehaviorPtr neuronTrainBehaviorPtr (neuralFactoryPtr->makeOutputNeuronTrainBehavior(neuronPtr) );
      neuronPtr->setNeuronTrainBehavior( neuronTrainBehaviorPtr );
      neuralNetworkPtr->d_outputLayer->push_back(neuronPtr);
    }

  return neuralNetworkPtr;
}

}

}
