#pragma once
#include "BatchNeuronTrainBehavior.h"

/// class BATCHgdwmNeuronTrainBehavior - 
class BATCHgdwmNeuronTrainBehavior : public BatchNeuronTrainBehavior {
  // Attributes
protected:
  double delta;
  double learning.rate;
  std::vector<double> sum.delta.x;
  double sum.delta.bias;
  double momentum;
  std::vector<double> former.weight.change;
  double former.bias.change;
  // Operations
protected:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
};

