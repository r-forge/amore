#pragma once
#include "AdaptNeuronTrainBehavior.h"

/// class ADAPTgdwmNeuronTrainBehavior - 
class ADAPTgdwmNeuronTrainBehavior : public AdaptNeuronTrainBehavior {
  // Attributes
protected:
  double d_delta;
  double d_learningRate;
  double d_momentum;
  std::vector<double> d_formerWeightChange;
  double d_formerBiasChange;
  // Operations
protected:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
};

