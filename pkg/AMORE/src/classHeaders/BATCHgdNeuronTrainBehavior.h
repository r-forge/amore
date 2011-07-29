#pragma once
#include "BatchNeuronTrainBehavior.h"

/// class BATCHgdNeuronTrainBehavior - 
class BATCHgdNeuronTrainBehavior : public BatchNeuronTrainBehavior {
  // Attributes
private:
  double delta;
  double learning.rate;
  std::vector<double> sum.delta.x;
  double sum.delta.bias;
  // Operations
private:
  void singlePatternAction ();
  void endOfEpochAction ();
};

