#pragma once
#include "ADAPTgdwmNeuronTrainBehavior.h"

/// class ADAPTgdwmOutputNeuronTrainBehavior - 
class ADAPTgdwmOutputNeuronTrainBehavior : public ADAPTgdwmNeuronTrainBehavior {
  // Attributes
private:
  CostFuntionWeakPtr d_costFunction;
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
};

