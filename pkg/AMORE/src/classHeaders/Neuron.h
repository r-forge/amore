#pragma once
/// class Neuron - 
class Neuron {
  // Attributes
protected:
  PredictBehaviorPtr d_predictBehavior;
  ActivationFunctionPtr d_activationFunction;
  NeuronTrainBehaviorPtr d_neuronTrainBehavior;
  Handler d_Id;
  ConContainerPtr d_nCons;
  double d_inducedLocalField;
  double d_output;
  double d_outputDerivative;
  double d_target;
  // Operations
public:
friend class MLPfactory; 
  virtual double getInducedLocalField () = 0;
  virtual void setInducedLocalField (double inducedLocalField) = 0;
  virtual double getOutput () = 0;
  virtual void setOutput (double output) = 0;
  virtual double getTarget () = 0;
  virtual void setTarget (double target) = 0;
  virtual double getOutputDerivative () = 0;
  virtual void setOutputDerivative (double outputDerivative) = 0;
  virtual Handler getId () = 0;
  virtual void setId (Handler Id) = 0;
  virtual ConIteratorPtr getConIterator () = 0;
  virtual void addCon (ConPtr conPtr) = 0;
  virtual void setActivationFunction (ActivationFunctionPtr activationFunctionPtr) = 0;
  virtual void setPredictBehavior (PredictBehaviorPtr predictBehaviorPtr) = 0;
  virtual void setNeuronTrainBehavior (NeuronTrainBehaviorPtr neuronTrainBehaviorPtr) = 0;
  virtual std::string getNeuronTrainBehaviorName () = 0;
  virtual double useActivationFunctionf0 () = 0;
  virtual double useActivationFunctionf1 () = 0;
  virtual void singlePatternForwardAction () = 0;
  virtual void singlePatternBackwardAction () = 0;
  // virtual void adjustParameters () = 0;
  virtual void show () = 0;
  virtual bool validate () = 0;
protected:
  Neuron (NeuralFactory& neuralFactory);
};

