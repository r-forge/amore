#pragma once
#include "MLPNeuronTrainBehavior.h"

/// class AdaptNeuronTrainBehavior - 
class AdaptNeuronTrainBehavior : public MLPNeuronTrainBehavior {
  // Operations
protected:
  AdaptNeuronTrainBehavior (NeuronPtr neuronPtr);
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

