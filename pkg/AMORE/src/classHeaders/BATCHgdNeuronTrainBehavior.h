#pragma once
#include "BatchNeuronTrainBehavior.h"

/// class BATCHgdNeuronTrainBehavior - 
class BATCHgdNeuronTrainBehavior : public BatchNeuronTrainBehavior {
  // Operations
protected:
  BATCHgdNeuronTrainBehavior (NeuronPtr neuronPtr);
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

