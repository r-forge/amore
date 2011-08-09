#pragma once
#include "NeuronTrainBehavior.h"

/// class BatchNeuronTrainBehavior - 
class BatchNeuronTrainBehavior : public NeuronTrainBehavior {
  // Operations
public:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

