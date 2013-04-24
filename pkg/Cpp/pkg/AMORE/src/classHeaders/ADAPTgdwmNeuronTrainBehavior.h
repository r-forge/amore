#pragma once
#include "AdaptNeuronTrainBehavior.h"

/// class ADAPTgdwmNeuronTrainBehavior - 
class ADAPTgdwmNeuronTrainBehavior : public AdaptNeuronTrainBehavior {
  // Operations
public:
  virtual void singlePatternBackwardAction () = 0;
protected:
  ADAPTgdwmNeuronTrainBehavior (NeuronPtr neuronPtr);
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

