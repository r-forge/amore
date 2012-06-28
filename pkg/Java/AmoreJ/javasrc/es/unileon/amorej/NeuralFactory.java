/**
 * 
 */
package es.unileon.amorej;

/**
 * @author mcasl
 *
 */
public interface NeuralFactory {

	  Connection makeConnection (Neuron neuron, double weight);
	  Container<Connection> makeConnectionContainer ();
	  Container<Connection> makeConnectionContainer (int initialCapacity);
//	  PredictBehavior makePredictBehavior (Neuron neuron);
	  Neuron makeNeuron (String Id);
//	  Neuron makeNeuron (String Id, NeuronIterator neuronIterator, int totalAmountOfParameters, NeuralNetwork neuralNetwork);
	  Container<Neuron> makeLayer ();
	  Container<Container<Neuron>> makeLayerContainer ();
	  NeuralNetwork makeNeuralNetwork (NeuralFactory neuralFactory);
//	  NeuralCreator makeNeuralCreator ();
//	  ActivationFunction makeActivationFunction (Neuron neuron, Rcpp::X<CppFunctionPointer> f0, Rcpp::X<CppFunctionPointer> f1);
//	  Rcpp::List makeXFunctionList (std::string functionName);
//	  NetworkTrainBehavior makeNetworkTrainBehavior (NeuralNetwork neuralNetwork);
//	  NeuronTrainBehavior makeOutputNeuronTrainBehavior (Neuron neuron);
//	  NeuronTrainBehavior makeHiddenNeuronTrainBehavior (Neuron neuron);
//	  CostFunction makeCostFunction (std::string functionName);

}
