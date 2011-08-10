#pragma once
#include "AdaptNeuronTrainBehavior.h"

/// class ADAPTgdwmNeuronTrainBehavior - 
class ADAPTgdwmNeuronTrainBehavior : public AdaptNeuronTrainBehavior {
  // Operations
protected:
  ADAPTgdwmNeuronTrainBehavior (NeuronPtr neuronPtr);
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

