#pragma once
#include "ADAPTgdNeuronTrainBehavior.h"

/// class ADAPTgdOutputNeuronTrainBehavior - 
class ADAPTgdOutputNeuronTrainBehavior : public ADAPTgdNeuronTrainBehavior {
  // Attributes
private:
  CostFunctionWeakPtr d_costFunction;
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
};

