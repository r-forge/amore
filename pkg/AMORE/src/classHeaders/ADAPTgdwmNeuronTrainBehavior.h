#pragma once
#include "AdaptNeuronTrainBehavior.h"

/// class ADAPTgdwmNeuronTrainBehavior - 
class ADAPTgdwmNeuronTrainBehavior : public AdaptNeuronTrainBehavior {
  // Attributes
private:
  double delta;
  double learning.rate;
  double momentum;
  std::vector<double> former.weight.change;
  double former.bias.change;
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
};

