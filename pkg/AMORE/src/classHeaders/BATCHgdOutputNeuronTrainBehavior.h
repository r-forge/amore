#pragma once
#include "BATCHgdNeuronTrainBehavior.h"

/// class BATCHgdOutputNeuronTrainBehavior - 
class BATCHgdOutputNeuronTrainBehavior : public BATCHgdNeuronTrainBehavior {
  // Attributes
protected:
  CostFunctionWeakPtr d_costFunction;
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
};

