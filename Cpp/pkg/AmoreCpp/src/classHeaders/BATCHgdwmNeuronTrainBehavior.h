#pragma once
#include "BatchNeuronTrainBehavior.h"

/// class BATCHgdwmNeuronTrainBehavior - 
class BATCHgdwmNeuronTrainBehavior : public BatchNeuronTrainBehavior {
  // Operations
protected:
  BATCHgdwmNeuronTrainBehavior (NeuronPtr neuronPtr);
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

