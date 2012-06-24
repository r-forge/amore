package es.unileon.amorej;

public interface Neuron {

	String getId();

	void setId(String newId);

	
	
	

//	  virtual double getInducedLocalField () = 0;
//	  virtual void setInducedLocalField (double inducedLocalField) = 0;
//	  virtual double getOutput () = 0;
//	  virtual void setOutput (double output) = 0;
//	  virtual double getTarget () = 0;
//	  virtual void setTarget (double target) = 0;
//	  virtual double getOutputDerivative () = 0;
//	  virtual void setOutputDerivative (double outputDerivative) = 0;

//	  virtual ConIteratorPtr& getConIterator () = 0;
//	  virtual void addCon (ConPtr& conPtr) = 0;
//	  virtual void setActivationFunction (ActivationFunctionPtr& activationFunctionPtr) = 0;
//	  virtual void setPredictBehavior (PredictBehaviorPtr& predictBehaviorPtr) = 0;
//	  virtual void setNeuronTrainBehavior (NeuronTrainBehaviorPtr& neuronTrainBehaviorPtr) = 0;
//	  virtual std::string getNeuronTrainBehaviorName () = 0;
//	  virtual NeuralNetwork* getNeuralNetwork () = 0;
//	  virtual void setNeuralNetwork (NeuralNetworkPtr& neuralNetworkPtr) = 0;
//	  virtual double useActivationFunctionf0 () = 0;
//	  virtual double useActivationFunctionf1 () = 0;
//	  virtual void singlePatternForwardAction () = 0;
//	  virtual void singlePatternBackwardAction () = 0;
//	  virtual void show () = 0;
//	  virtual bool validate () = 0;
//	  virtual int numberOfConnections () = 0;
//	  virtual double costFunctionf0 (double output, double target) = 0;
//	  virtual double costFunctionf1 (double output, double target) = 0;
//	  virtual void addToBias (double value) = 0;
//	  virtual void addToDelta (double value) = 0;
//	  virtual void setLearningRate (double learningRate) = 0;
//	protected:
//	  Neuron (NeuralFactory* ptNeuralFactory);

}
