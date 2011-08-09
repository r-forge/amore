#pragma once
#include "AdaptNeuronTrainBehavior.h"

/// class ADAPTgdNeuronTrainBehavior - 
class ADAPTgdNeuronTrainBehavior : public AdaptNeuronTrainBehavior {
  // Attributes
protected:
  double d_delta;
  double d_learningRate;
  // Operations
protected:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

