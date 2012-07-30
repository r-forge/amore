package es.unileon.amorej;

import es.unileon.amorej.net.NeuralNetwork;

public class SimpleNeuron implements Neuron {

	private String id;
	private double inducedLocalField;
	private double output;
	private double outputDerivative;
	private double target;
	private Container<Connection> connectionContainer;

	private NeuralNetwork neuralNetwork;

	// TODO PredictBehavior predictBehavior;
	// TODO ActivationFunction activationFunction;
	// TODO NeuronTrainBehavior neuronTrainBehavior;

	public SimpleNeuron(NeuralNetwork neuralNetwork) {
		this.neuralNetwork = neuralNetwork;
		this.id = "NA";
		this.inducedLocalField = 0.0;
		this.output = 0.0;
		this.outputDerivative = 0.0;
		this.target = 0.0;
		this.connectionContainer = neuralNetwork.getFactory().makeConnectionContainer();
	}

	public double getInducedLocalField() {
		return this.inducedLocalField;
	}

	public void setInducedLocalField(double inducedLocalField) {
		this.inducedLocalField = inducedLocalField;
	}

	public double getOutput() {
		return this.output;
	}

	public void setOutput(double output) {
		this.output = output;
	}

	public double getTarget() {
		return this.target;
	}

	public void setTarget(double target) {
		this.target = target;
	}

	public double getOutputDerivative() {
		return this.outputDerivative;
	}

	public void setOutputDerivative(double outputDerivative) {
		this.outputDerivative = outputDerivative;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String Id) {
		this.id = Id;
	}

	public boolean validate() throws AmoreJException {
		if (this.id.equals("NA"))
			throw new AmoreJException(
					"[Java SimpleNeuron.validate]: Error, Id is NA.");
		if (this.id.equals(""))
			throw new AmoreJException(
					"[Java SimpleNeuron.validate]: Error, Id is empty string.");

		// Iterator<Connection> connectionItr =
		// connectionContainer.createIterator();
		// for (connectionItr.first(); !connectionItr.isDone();
		// connectionItr.next()) {
		//
		// }

		for (Connection connection : connectionContainer) {
			connection.validate();
		}
		return true;
	}

	public void addConnection(Connection connection) {
		connectionContainer.add(connection);
	}

	// TODO public void
	// setActivationFunction(ActivationFunction activationFunction)
	// {
	// this.activationFunction = activationFunction;
	// }
	//

	// TODO public void
	// setPredictBehavior(PredictBehavior predictBehavior)
	// {
	// this.predictBehavior = predictBehavior;
	// }
	//
	//
	//
	// TODO public void
	// setNeuronTrainBehavior(NeuronTrainBehavior neuronTrainBehavior)
	// {
	// this.neuronTrainBehavior = neuronTrainBehavior;
	// }
	//
	//
	//
	// TODO public String
	// getNeuronTrainBehaviorName()
	// {
	// return this.neuronTrainBehavior.getName();
	// }
	//
	//
	public NeuralNetwork getNeuralNetwork() {
		return this.neuralNetwork;
	}

	public void setNeuralNetwork(NeuralNetwork neuralNetwork) {
		this.neuralNetwork = neuralNetwork;
	}

	//
	//
	//
	// TODO public double
	// useActivationFunctionf0()
	// {
	// return this.activationFunction.f0();
	// }
	//
	//
	// TODO public double
	// useActivationFunctionf1()
	// {
	// return this.activationFunction.f1();
	// }
	//
	//
	//
	// TODO public void
	// singlePatternForwardAction()
	// {
	// this.predictBehavior.singlePatternForwardAction();
	// }
	//
	//
	// TODO public void
	// singlePatternBackwardAction()
	// {
	// this.neuronTrainBehavior.singlePatternBackwardAction();
	// }
	//

	public int numberOfConnections() {
		return connectionContainer.size();
	}

	public void show() {
		System.out.println("-----------------------------------");
		System.out.println(" id: " + this.id);
		System.out.println("-----------------------------------");
		// predictBehavior.show();
		System.out.println(" output: " + this.output);
		System.out.println(" target: " + this.target);
		System.out.print("-----------------------------------");
		for (Connection connection : this.connectionContainer) {
			connection.show();
		}
		System.out.println("\n-----------------------------------");
		// System.out.println(" Neuron Train Behavior: %s",
		// getNeuronTrainBehaviorName().c_str() );
		System.out.println("\n-----------------------------------");
	}
	// TODO public double costFunctionf0(double output, double target)
	// {
	// return this.neuralNetwork.costFunctionf0( output, target );
	// }
	//
	//
	// TODO public double costFunctionf1(double output, double target)
	// {
	// return this.neuralNetwork.costFunctionf1( output, target );
	// }
	//
	//
	// TODO public void addToBias(double value)
	// {
	// this.predictBehavior.addToBias(value);
	// }
	//
	//
	// TODO public void addToDelta(double value)
	// {
	// this.neuronTrainBehavior.addToDelta(value);
	// }
	//
	// TODO public void
	// setLearningRate(double learningRate)
	// {
	// this.neuronTrainBehavior.setLearningRate(learningRate);
	// }

}