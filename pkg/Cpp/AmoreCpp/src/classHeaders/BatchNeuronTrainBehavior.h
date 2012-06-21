#pragma once
#include "MLPNeuronTrainBehavior.h"

/// class BatchNeuronTrainBehavior - 
class BatchNeuronTrainBehavior : public MLPNeuronTrainBehavior {
  // Operations
protected:
  BatchNeuronTrainBehavior (NeuronPtr neuronPtr);
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

