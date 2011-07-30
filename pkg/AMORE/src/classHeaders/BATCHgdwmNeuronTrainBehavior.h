#pragma once
#include "BatchNeuronTrainBehavior.h"

/// class BATCHgdwmNeuronTrainBehavior - 
class BATCHgdwmNeuronTrainBehavior : public BatchNeuronTrainBehavior {
  // Attributes
private:
  double delta;
  double learning.rate;
  std::vector<double> sum.delta.x;
  double sum.delta.bias;
  double momentum;
  std::vector<double> former.weight.change;
  double former.bias.change;
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
};

