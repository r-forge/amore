#pragma once
/// class BATCHFactory - 
class BATCHFactory {
  // Operations
protected:
  NetworkTrainBehaviorPtr makeNetworkTrainBehavior ();
  virtual NeuronTrainBehaviorPtr makeNeuronTrainBehavior (NeuronPtr neuronPtr) = 0;
};

