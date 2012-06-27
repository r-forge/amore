package es.unileon.amorej;

import java.util.ArrayList;
import java.util.List;

public class SimpleNeuron implements Neuron {

	private String id;
	private double inducedLocalField;
	private double output;
	private double outputDerivative;
	private double target;
	private List<Connection> nConnections;

	// NeuralNetwork neuralNetwork;
	// PredictBehavior predictBehavior;
	// ActivationFunction activationFunction;
	// NeuronTrainBehavior neuronTrainBehavior;

	public SimpleNeuron(NeuralFactory neuralFactory) {
		this.id = "NA";
		this.inducedLocalField = 0.0;
		this.output = 0.0;
		this.outputDerivative = 0.0;
		this.target = 0.0;
		this.nConnections = new ArrayList<Connection>();
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
		for (Connection connection : nConnections) {
			connection.validate();
		}
		return true;
	}

	public void addConnection(Connection connection) {
		nConnections.add(connection);
	}

	// public void
	// setActivationFunction(ActivationFunction activationFunction)
	// {
	// this.activationFunction = activationFunction;
	// }
	//

	// public void
	// setPredictBehavior(PredictBehavior predictBehavior)
	// {
	// this.predictBehavior = predictBehavior;
	// }
	//
	//
	//
	// public void
	// setNeuronTrainBehavior(NeuronTrainBehavior neuronTrainBehavior)
	// {
	// this.neuronTrainBehavior = neuronTrainBehavior;
	// }
	//
	//
	//
	// public String
	// getNeuronTrainBehaviorName()
	// {
	// return this.neuronTrainBehavior.getName();
	// }
	//
	//
	// public NeuralNetwork
	// getNeuralNetwork( )
	// {
	// return this.neuralNetwork;
	// }
	//
	//
	// public void
	// setNeuralNetwork( NeuralNetworkPtr& neuralNetworkPtr)
	// {
	// this.neuralNetwork = neuralNetwork;
	// }
	//
	//
	//
	// public double
	// useActivationFunctionf0()
	// {
	// return this.activationFunction.f0();
	// }
	//
	//
	// public double
	// useActivationFunctionf1()
	// {
	// return this.activationFunction.f1();
	// }
	//
	//
	//
	// public void
	// singlePatternForwardAction()
	// {
	// this.predictBehavior.singlePatternForwardAction();
	// }
	//
	//
	// public void
	// singlePatternBackwardAction()
	// {
	// this.neuronTrainBehavior.singlePatternBackwardAction();
	// }
	//

	public int numberOfConnections() {
		return nConnections.size();
	}

	public void show() {
		System.out.println("-----------------------------------");
		System.out.println(" id: " + this.id);
		System.out.println("-----------------------------------");
		// predictBehavior.show();
		System.out.println(" output: " + this.output);
		System.out.println(" target: " + this.target);
		System.out.print("-----------------------------------");
		for (Connection connection : this.nConnections) {
			connection.show();
		}
		System.out.println("\n-----------------------------------");
		// System.out.println(" Neuron Train Behavior: %s",
		// getNeuronTrainBehaviorName().c_str() );
		System.out.println("\n-----------------------------------");
	}
	// public double costFunctionf0(double output, double target)
	// {
	// return this.neuralNetwork.costFunctionf0( output, target );
	// }
	//
	//
	// public double costFunctionf1(double output, double target)
	// {
	// return this.neuralNetwork.costFunctionf1( output, target );
	// }
	//
	//
	// public void addToBias(double value)
	// {
	// this.predictBehavior.addToBias(value);
	// }
	//
	//
	// public void addToDelta(double value)
	// {
	// this.neuronTrainBehavior.addToDelta(value);
	// }
	//
	// public void
	// setLearningRate(double learningRate)
	// {
	// this.neuronTrainBehavior.setLearningRate(learningRate);
	// }

}
