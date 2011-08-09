#pragma once
#include "BATCHgdNeuronTrainBehavior.h"

/// class BATCHgdHiddenNeuronTrainBehavior - 
class BATCHgdHiddenNeuronTrainBehavior : public BATCHgdNeuronTrainBehavior {
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

