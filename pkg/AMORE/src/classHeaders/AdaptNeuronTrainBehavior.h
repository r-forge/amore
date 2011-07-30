#pragma once
#include "NeuronTrainBehavior.h"

/// class AdaptNeuronTrainBehavior - 
class AdaptNeuronTrainBehavior : public NeuronTrainBehavior {
  // Operations
public:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
};

