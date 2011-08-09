#pragma once
#include "BATCHgdwmNeuronTrainBehavior.h"

/// class BATCHgdwmHiddenNeuronTrainBehavior - 
class BATCHgdwmHiddenNeuronTrainBehavior : public BATCHgdwmNeuronTrainBehavior {
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

