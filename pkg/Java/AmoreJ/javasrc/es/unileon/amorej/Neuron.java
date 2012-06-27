package es.unileon.amorej;

public interface Neuron {

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

	// void setActivationFunction (ActivationFunction activationFunction);
	// void setPredictBehavior (PredictBehavior predictBehavior);
	// void setNeuronTrainBehavior (NeuronTrainBehavior neuronTrainBehavior);
	// String getNeuronTrainBehaviorName();
	// NeuralNetwork getNeuralNetwork();
	// void setNeuralNetwork (NeuralNetwork neuralNetwork);
	// double useActivationFunctionf0();
	// double useActivationFunctionf1();
	// void singlePatternForwardAction();
	// void singlePatternBackwardAction ;
	void show();

//	double costFunctionf0(double output, double target);
//
//	double costFunctionf1(double output, double target);
//
//	void addToBias(double value);
//
//	void addToDelta(double value);
//
//	void setLearningRate(double learningRate);

}
