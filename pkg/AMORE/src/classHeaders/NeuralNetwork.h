#pragma once
/// class NeuralNetwork - 
class NeuralNetwork {
  // Attributes
protected:
  LayerPtr d_inputLayer;
  LayerContainerPtr d_hiddenLayers;
  LayerPtr d_outputLayer;
  NetworkTrainBehaviorPtr d_networkTrainBehavior;
  // Operations
public:
friend class SimpleNeuralCreator; 
  virtual void writeInput (std::vector<double>::iterator& iterator) = 0;
  virtual void singlePatternForwardAction () = 0;
  virtual void singlePatternBackwardAction () = 0;
  virtual void readOutput (std::vector<double>::iterator& iterator) = 0;
  virtual Rcpp::List train (Rcpp::List parameterList) = 0;
  virtual size_type inputSize () = 0;
  virtual size_type outputSize () = 0;
  virtual void show () = 0;
  virtual bool validate () = 0;
protected:
  NeuralNetwork (NeuralFactory& neuralFactory);
};

