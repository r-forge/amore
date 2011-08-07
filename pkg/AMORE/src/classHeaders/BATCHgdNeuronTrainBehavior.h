#pragma once
#include "BatchNeuronTrainBehavior.h"

/// class BATCHgdNeuronTrainBehavior - 
class BATCHgdNeuronTrainBehavior : public BatchNeuronTrainBehavior {
  // Attributes
protected:
  double d_delta;
  double d_learningRate;
  std::vector<double> d_sum_delta_x;
  double d_sum_delta_bias;
  // Operations
protected:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
};

