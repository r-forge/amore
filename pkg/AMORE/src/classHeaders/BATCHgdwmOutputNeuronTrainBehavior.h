#pragma once
#include "BATCHgdwmNeuronTrainBehavior.h"

/// class BATCHgdwmOutputNeuronTrainBehavior - 
class BATCHgdwmOutputNeuronTrainBehavior : public BATCHgdwmNeuronTrainBehavior {
  // Attributes
protected:
  CostFunctionWeakPtr d_costFunction;
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
};

