/**
 * 
 */
package es.unileon.amorej;

import es.unileon.amorej.net.NeuralCreator;
import es.unileon.amorej.net.NeuralNetwork;

/**
 * @author mcasl
 *
 */
public interface NeuralFactory {

	  Connection makeConnection (Neuron neuron, double weight);
	  Container<Connection> makeConnectionContainer ();
	  Container<Connection> makeConnectionContainer (int initialCapacity);
// TODO	  PredictBehavior makePredictBehavior (Neuron neuron);
	  Neuron makeNeuron (String Id, NeuralNetwork neuralNetwork);
      Neuron makeNeuron(String Id, Iterator<Neuron> neuronIterator, int totalAmountOfParameters, NeuralNetwork neuralNetwork) throws AmoreJException;
	  Container<Neuron> makeLayer ();
	  Container<Container<Neuron>> makeLayerContainer ();
	  NeuralNetwork makeNeuralNetwork (NeuralFactory neuralFactory);
	  NeuralCreator makeNeuralCreator ();
// TODO		  ActivationFunction makeActivationFunction (Neuron neuron, Rcpp::X<CppFunctionPointer> f0, Rcpp::X<CppFunctionPointer> f1);
// TODO		  Rcpp::List makeXFunctionList (std::string functionName);
// TODO		  NetworkTrainBehavior makeNetworkTrainBehavior (NeuralNetwork neuralNetwork);
// TODO		  NeuronTrainBehavior makeOutputNeuronTrainBehavior (Neuron neuron);
// TODO		  NeuronTrainBehavior makeHiddenNeuronTrainBehavior (Neuron neuron);
// TODO		  CostFunction makeCostFunction (std::string functionName);

}
