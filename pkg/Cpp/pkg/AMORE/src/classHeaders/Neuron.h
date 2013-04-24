#pragma once
#include "MLPbehavior.h"
#include "SimpleNetwork.h"
#include "ADAPTgdOutputNeuronTrainBehavior.h"
#include "ADAPTgdHiddenNeuronTrainBehavior.h"
/// class Neuron -
class Neuron {
  // Attributes
protected:
  NeuralNetworkPtr d_neuralNetwork;
  PredictBehaviorPtr d_predictBehavior;
  ActivationFunctionPtr d_activationFunction;
  NeuronTrainBehaviorPtr d_neuronTrainBehavior;
  Handler d_Id;
  ConContainerPtr d_nCons;
  double d_inducedLocalField;
  double d_output;
  double d_outputDerivative;
  double d_target;
  ConIteratorPtr d_conIterator;
  // Operations
public:
friend class MLPfactory;
friend class NeuronTrainBehavior;
friend void MLPbehavior::singlePatternForwardAction();
friend void SimpleNetwork::readOutput (std::vector<double>::iterator& iterator, NeuronIteratorPtr outputNeuronIteratorPtr);
friend void ADAPTgdOutputNeuronTrainBehavior::singlePatternBackwardAction();
friend void ADAPTgdHiddenNeuronTrainBehavior::singlePatternBackwardAction();
  virtual ~Neuron ();
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
  virtual NeuralNetworkPtr getNeuralNetwork () = 0;
  virtual void setNeuralNetwork (NeuralNetworkPtr neuralNetworkPtr) = 0;
  virtual double useActivationFunctionf0 () = 0;
  virtual double useActivationFunctionf1 () = 0;
  virtual void singlePatternForwardAction () = 0;
  virtual void singlePatternBackwardAction () = 0;
  // virtual void adjustParameters () = 0;
  virtual void show () = 0;
  virtual bool validate () = 0;
  virtual int numberOfConnections () = 0;
  virtual double costFunctionf0 (double output, double target) = 0;
  virtual double costFunctionf1 (double output, double target) = 0;
  virtual void addToBias (double value) = 0;
  virtual void addToDelta (double value) = 0;
  virtual void setLearningRate (double learningRate) = 0;
protected:
  Neuron (NeuralFactory& neuralFactory);
};

