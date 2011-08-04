#pragma once
/// class ADAPTFactory - 
class ADAPTFactory {
  // Operations
protected:
  NetworkTrainBehaviorPtr makeNetworkTrainBehavior ();
  virtual NeuronTrainBehaviorPtr makeNeuronTrainBehavior (NeuronPtr neuronPtr) = 0;
};

