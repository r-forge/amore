#pragma once
#include "NeuronTrainBehavior.h"

/// class BatchNeuronTrainBehavior - 
class BatchNeuronTrainBehavior : public NeuronTrainBehavior {
  // Operations
public:
  virtual void singlePatternAction () = 0;
  virtual void endOfEpochAction () = 0;
};

