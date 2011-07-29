#pragma once
#include "AdaptNeuronTrainBehavior.h"

/// class ADAPTgdNeuronTrainBehavior - 
class ADAPTgdNeuronTrainBehavior : public AdaptNeuronTrainBehavior {
  // Attributes
private:
  double delta;
  double learning.rate;
  // Operations
private:
  void singlePatternAction ();
  void endOfEpochAction ();
};

