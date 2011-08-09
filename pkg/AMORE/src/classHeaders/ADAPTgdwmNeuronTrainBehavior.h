#pragma once
#include "AdaptNeuronTrainBehavior.h"

/// class ADAPTgdwmNeuronTrainBehavior - 
class ADAPTgdwmNeuronTrainBehavior : public AdaptNeuronTrainBehavior {
  // Attributes
protected:
  double d_delta;
  double d_learningRate;
  double d_momentum;
  double d_formerWeightChange;
  double formerBiasChange;
  // Operations
protected:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
  virtual std::string getName () = 0;
};

