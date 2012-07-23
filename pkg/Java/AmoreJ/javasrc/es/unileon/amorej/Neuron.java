package es.unileon.amorej;

public interface Neuron extends Visible, Checkable {

	String getId();

	void setId(String newId);

	int numberOfConnections();

	boolean validate() throws AmoreJException;

	void addConnection(Connection connection);

	double getInducedLocalField();

	void setInducedLocalField(double inducedLocalField);

	double getOutput();

	void setOutput(double output);

	double getTarget();

	void setTarget(double target);

	double getOutputDerivative();

	void setOutputDerivative(double outputDerivative);

	// TODO void setActivationFunction (ActivationFunction activationFunction);
	// TODO void setPredictBehavior (PredictBehavior predictBehavior);
	// TODO void setNeuronTrainBehavior (NeuronTrainBehavior neuronTrainBehavior);
	// TODO String getNeuronTrainBehaviorName();
	// TODO NeuralNetwork getNeuralNetwork();
	// TODO void setNeuralNetwork (NeuralNetwork neuralNetwork);
	// TODO double useActivationFunctionf0();
	// TODO double useActivationFunctionf1();
	// TODO void singlePatternForwardAction();
	// TODO void singlePatternBackwardAction ;
	void show();

// TODO 	double costFunctionf0(double output, double target);
//
//	TODO double costFunctionf1(double output, double target);
//
//	TODO  void addToBias(double value);
//
// TODO 	void addToDelta(double value);
//
//	TODO  void setLearningRate(double learningRate);

}
