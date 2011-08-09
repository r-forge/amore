#pragma once
#include "NeuronTrainBehavior.h"

/// class MLPNeuronTrainBehavior - 
class MLPNeuronTrainBehavior : public NeuronTrainBehavior {
  // Operations
protected:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

