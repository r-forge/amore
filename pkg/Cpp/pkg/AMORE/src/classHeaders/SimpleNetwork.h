#pragma once
#include "NeuralNetwork.h"

/// class SimpleNetwork - 
class SimpleNetwork : public NeuralNetwork {
  // Operations
public:
  SimpleNetwork (NeuralFactoryPtr neuralFactoryPtr);
  ~SimpleNetwork ();
  Rcpp::NumericMatrix sim (Rcpp::NumericMatrix sim);
  void setNetworkTrainBehavior (NetworkTrainBehaviorPtr networkTrainBehaviorPtr);
  std::string getNetworkTrainBehaviorName ();
  void setNeuronTrainBehavior (NeuralFactory& neuralFactory);
  void setCostFunction (CostFunctionPtr costFunctionPtr);
  std::string getCostFunctionName ();
  Rcpp::List train (Rcpp::List parameterList);
  void writeInput (std::vector<double>::iterator& iterator, NeuronIteratorPtr inputNeuronIteratorPtr);
  void writeTarget (std::vector<double>::iterator& iterator, NeuronIteratorPtr outputNeuronIteratorPtr);
  void singlePatternForwardAction ();
  void singlePatternBackwardAction ();
  void readOutput (std::vector<double>::iterator& iterator, NeuronIteratorPtr outputNeuronIteratorPtr);
  size_type inputSize ();
  size_type outputSize ();
  double costFunctionf0 (double output, double target);
  double costFunctionf1 (double output, double target);
  void setLearningRate (double learningRate);
  void show ();
  bool validate ();
};

