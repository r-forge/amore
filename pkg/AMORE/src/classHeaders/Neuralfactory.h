#pragma once
// Interface
/// class NeuralFactory - 
class NeuralFactory {
  // Operations
public:
  virtual ConPtr makeCon (Neuron& neuron, double weight) = 0;
  virtual ConContainerPtr makeConContainer () = 0;
  virtual PredictBehaviorPtr makePredictBehavior (NeuronPtr neuronPtr) = 0;
  virtual NeuronPtr makeNeuron (Handler Id) = 0;
  virtual NeuronPtr makeNeuron (Handler Id, NeuronIteratorPtr neuronIteratorPtr, double totalAmountOfParameters) = 0;
  virtual LayerPtr makeLayer () = 0;
  virtual LayerContainerPtr makeLayerContainer () = 0;
  virtual NeuralNetworkPtr makeNeuralNetwork (NeuralFactory& neuralFactory) = 0;
  virtual NeuralCreatorPtr makeNeuralCreator () = 0;
  virtual ActivationFunctionPtr makeActivationFunction (NeuronPtr neuronPtr, Rcpp::XPtr<CppFunctionPointer> f0, Rcpp::XPtr<CppFunctionPointer> f1) = 0;
  virtual Rcpp::List makeXPtrFunctionList (std::string functionName) = 0;
  virtual NetworkTrainBehaviorPtr makeNetworkTrainBehavior (NeuralNetworkPtr neuralNetworkPtr) = 0;
  virtual NeuronTrainBehaviorPtr makeOutputNeuronTrainBehavior (NeuronPtr neuronPtr) = 0;
  virtual NeuronTrainBehaviorPtr makeHiddenNeuronTrainBehavior (NeuronPtr neuronPtr) = 0;
  virtual CostFunctionPtr makeCostFunction (std::string functionName) = 0;
};

