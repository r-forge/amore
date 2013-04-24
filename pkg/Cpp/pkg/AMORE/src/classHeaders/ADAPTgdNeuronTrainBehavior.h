#pragma once
#include "AdaptNeuronTrainBehavior.h"

/// class ADAPTgdNeuronTrainBehavior - 
class ADAPTgdNeuronTrainBehavior : public AdaptNeuronTrainBehavior {
  // Operations
public:
  virtual void singlePatternBackwardAction () = 0;
protected:
  ADAPTgdNeuronTrainBehavior (NeuronPtr neuronPtr);
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

