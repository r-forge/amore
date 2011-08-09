#pragma once
#include "BATCHgdwmNeuronTrainBehavior.h"

/// class BATCHgdwmOutputNeuronTrainBehavior - 
class BATCHgdwmOutputNeuronTrainBehavior : public BATCHgdwmNeuronTrainBehavior {
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

