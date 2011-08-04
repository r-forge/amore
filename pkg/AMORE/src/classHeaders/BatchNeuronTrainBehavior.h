#pragma once
#include "MLPNeuronTrainBehavior.h"

/// class BatchNeuronTrainBehavior - 
class BatchNeuronTrainBehavior : public MLPNeuronTrainBehavior {
  // Operations
public:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
};

