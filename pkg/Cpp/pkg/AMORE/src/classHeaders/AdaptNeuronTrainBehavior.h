#pragma once
#include "MLPNeuronTrainBehavior.h"

/// class AdaptNeuronTrainBehavior - 
class AdaptNeuronTrainBehavior : public MLPNeuronTrainBehavior {
  // Operations
public:
  virtual void singlePatternBackwardAction () = 0;
protected:
  AdaptNeuronTrainBehavior (NeuronPtr neuronPtr);
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

