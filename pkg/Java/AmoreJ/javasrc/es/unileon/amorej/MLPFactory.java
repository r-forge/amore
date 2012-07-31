/**
 * 
 */
package es.unileon.amorej;

import es.unileon.amorej.net.NeuralCreator;
import es.unileon.amorej.net.NeuralNetwork;
import es.unileon.amorej.net.SimpleNetwork;
import es.unileon.amorej.net.SimpleNeuralCreator;

/**
 * @author mcasl
 * 
 */
public class MLPFactory implements NeuralFactory {

	/*
	 * (non-Javadoc)
	 * 
	 * @see es.unileon.amorej.NeuralFactory#makeCon(es.unileon.amorej.Neuron,
	 * double)
	 */
	@Override
	public Connection makeConnection(Neuron neuron, double weight) {
		Connection connection = new Connection(neuron, weight);
		return connection;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see es.unileon.amorej.NeuralFactory#makeNeuron(java.lang.String)
	 */
	@Override
	public Neuron makeNeuron(String id, NeuralNetwork neuralNetwork) {
		Neuron neuron = new SimpleNeuron(neuralNetwork);
		neuron.setId(id);
		// TODO PredictBehaviorPtr
		// TODO predictBehaviorPtr(makePredictBehavior(neuronPtr));
		// TODO neuronPtr->setPredictBehavior(predictBehaviorPtr);
		// TODO ActivationFunctionPtr activationFunctionPtr(
		// TODO makeActivationFunction(neuronPtr,
		// TODO  Rcpp::XPtr<CppFunctionPointer>(new CppFunctionPointer(&default_f0)),
		// TODO  Rcpp::XPtr<CppFunctionPointer>(new CppFunctionPointer(&default_f1))));
		// TODO  neuronPtr->setActivationFunction(activationFunctionPtr);
		// TODO  NeuronTrainBehaviorPtr neuronTrainBehaviorPtr(
		// TODO makeHiddenNeuronTrainBehavior(neuronPtr));
		// TODO neuronPtr->setNeuronTrainBehavior(neuronTrainBehaviorPtr);
		return neuron;
	}

	public Container<Connection> makeConnectionContainer() {
		Container<Connection> connectionContainer = new SimpleContainer<Connection>();
		return connectionContainer;
	}

	public Container<Connection> makeConnectionContainer(int initialCapacity) {
		Container<Connection> connectionContainer = new SimpleContainer<Connection>(
				initialCapacity);
		return connectionContainer;
	}

	//TODO  PredictBehaviorPtr
	// MLPfactory::makePredictBehavior(NeuronPtr& neuronPtr)
	// {
	// PredictBehaviorPtr predictBehaviorPtr(new MLPbehavior(neuronPtr));
	// return predictBehaviorPtr;
	// }
	//

public 	Neuron makeNeuron(String Id, Iterator<Neuron> neuronIterator,
	 int totalAmountOfParameters, NeuralNetwork neuralNetwork) throws AmoreJException
	 {
	
	 Neuron neuron= this.makeNeuron(Id, neuralNetwork);	
	 double extreme = Math.sqrt(3.0 / totalAmountOfParameters);
	 double weight;
	 for (neuronIterator.first(); !neuronIterator.isDone(); neuronIterator.next()) {
		 weight = (Math.random()-0.5)*2*extreme;
		 Connection connection = this.makeConnection(neuronIterator.currentItem(), weight);
		 neuron.addConnection(connection);
	 }
// TODO	 MLPbehavior* mlpBehavior =	 dynamic_cast<MLPbehavior*> (neuronPtr->d_predictBehavior.get());
// TODO  mlpBehavior->d_bias = as<double> (runif(1, -extreme, extreme));
	 return neuron;
	 }
	

	public Container<Neuron> makeLayer() {
		Container<Neuron> layer = new SimpleContainer<Neuron>();
		return layer;
	}

	public Container<Container<Neuron>> makeLayerContainer()	 {
		Container<Container<Neuron>> layerContainer = new SimpleContainer<Container<Neuron>> ();
	 layerContainer.add( this.makeLayer() );
	 return layerContainer;
	 }

	public NeuralNetwork makeNeuralNetwork(NeuralFactory neuralFactory) {
		NeuralNetwork neuralNetwork = new SimpleNetwork(neuralFactory);
		// TODO NetworkTrainBehavior networkTrainBehavior(
		// TODO neuralFactory.makeNetworkTrainBehavior(neuralNetwork));
		// TODO  neuralNetwork.setNetworkTrainBehavior(networkTrainBehavior);
		// TODO  Remove comments above
		return neuralNetwork;
	}

	public NeuralCreator makeNeuralCreator() {
		NeuralCreator neuralCreator = new SimpleNeuralCreator();
		return neuralCreator;
	}

	//
	//TODO  ActivationFunctionPtr MLPfactory::makeActivationFunction(NeuronPtr& neuronPtr, Rcpp::XPtr<CppFunctionPointer> f0, Rcpp::XPtr<CppFunctionPointer> f1)
	// {
	// ActivationFunctionPtr activationFunctionPtr(
	// new ActivationFunction(neuronPtr, f0, f1));
	// return activationFunctionPtr;
	// }
	//
	//TODO  Rcpp::List
	// MLPfactory::makeXPtrFunctionList(std::string functionName)
	// {
	//
	// if (functionName == "Tanh")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (new CppFunctionPointer(&Tanh_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (new CppFunctionPointer(&Tanh_f1)));
	// }
	// else if (functionName == "Identity")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Identity_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Identity_f1)));
	// }
	// else if (functionName == "Threshold")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Threshold_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Threshold_f1)));
	// }
	// else if (functionName == "Logistic")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Logistic_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Logistic_f1)));
	// }
	// else if (functionName == "Exponential")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Exponential_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Exponential_f1)));
	// }
	// else if (functionName == "Reciprocal")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Reciprocal_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Reciprocal_f1)));
	// }
	// else if (functionName == "Square")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Square_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Square_f1)));
	// }
	// else if (functionName == "Gauss")
	// {
	// return List::create(
	// _["f0"]
	// = XPtr<CppFunctionPointer> (new CppFunctionPointer(&Gauss_f0)),
	// _["f1"]
	// = XPtr<CppFunctionPointer> (new CppFunctionPointer(&Gauss_f1)));
	// }
	// else if (functionName == "Sine")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (new CppFunctionPointer(&Sine_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (new CppFunctionPointer(&Sine_f1)));
	// }
	// else if (functionName == "Cosine")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Cosine_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Cosine_f1)));
	// }
	// else if (functionName == "Elliot")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Elliot_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Elliot_f1)));
	// }
	// else if (functionName == "Arctan")
	// {
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Arctan_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&Arctan_f1)));
	// }
	// else
	// {
	// Rprintf(
	// "\nWarning: default function applied. Unknown function name entered.\n");
	// return List::create(
	// _["f0"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&default_f0)),
	// _["f1"] = XPtr<CppFunctionPointer> (
	// new CppFunctionPointer(&default_f1)));
	// }
	//
	// }
	//
	// TODO CostFunctionPtr
	// MLPfactory::makeCostFunction(std::string functionName)
	// {
	//
	// if (functionName == "LMS")
	// {
	// CostFunctionPtr costFunctionPtr(new LMS);
	// return costFunctionPtr;
	// }
	// else if (functionName == "LMLS")
	// {
	// CostFunctionPtr costFunctionPtr(new LMLS);
	// return costFunctionPtr;
	// }
	// else if (functionName == "TAO")
	// {
	// CostFunctionPtr costFunctionPtr(new Tao);
	// return costFunctionPtr;
	// }
	// else
	// {
	// throw std::invalid_argument(
	// "[SimpleNetwork::train Error]: Unknown cost function.");
	// }

	// }

}
