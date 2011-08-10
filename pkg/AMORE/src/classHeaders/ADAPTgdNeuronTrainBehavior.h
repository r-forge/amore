#pragma once
#include "AdaptNeuronTrainBehavior.h"

/// class ADAPTgdNeuronTrainBehavior - 
class ADAPTgdNeuronTrainBehavior : public AdaptNeuronTrainBehavior {
  // Operations
protected:
  ADAPTgdNeuronTrainBehavior (NeuronPtr neuronPtr);
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

