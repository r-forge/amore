#pragma once
/// class NeuralNetwork - 
class NeuralNetwork {
  // Attributes
protected:
  LayerPtr d_inputLayer;
  LayerContainerPtr d_hiddenLayers;
  LayerPtr d_outputLayer;
  NetworkTrainBehaviorPtr d_networkTrainBehavior;
  CostFunctionPtr d_costFunction;
  // Operations
public:
friend class SimpleNeuralCreator; 
  virtual Rcpp::NumericMatrix sim (Rcpp::NumericMatrix numericMatrix) = 0;
  virtual void setNetworkTrainBehavior (NetworkTrainBehaviorPtr networkTrainBehaviorPtr) = 0;
  virtual std::string getNetworkTrainBehaviorName () = 0;
  virtual void setNeuronTrainBehavior (NeuralFactory& neuralFactory) = 0;
  virtual void setCostFunction (CostFunctionPtr costFunctionPtr) = 0;
  virtual std::string getCostFunctionName () = 0;
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
  virtual void writeInput (std::vector<double>::iterator& iterator) = 0;
  virtual void writeTarget (std::vector<double>::iterator& iterator) = 0;
  virtual void singlePatternForwardAction () = 0;
  virtual void singlePatternBackwardAction () = 0;
  virtual void readOutput (std::vector<double>::iterator& iterator) = 0;
  virtual size_type inputSize () = 0;
  virtual size_type outputSize () = 0;
  virtual double costFunctionf0 (double output, double target) = 0;
  virtual double costFunctionf1 (double output, double target) = 0;
  virtual void setLearningRate (double learningRate) = 0;
  virtual void show () = 0;
  virtual bool validate () = 0;
protected:
  NeuralNetwork (NeuralFactory& neuralFactory);
};

