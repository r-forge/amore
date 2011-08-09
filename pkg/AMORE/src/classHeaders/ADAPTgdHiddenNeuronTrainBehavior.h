#pragma once
#include "ADAPTgdNeuronTrainBehavior.h"

/// class ADAPTgdHiddenNeuronTrainBehavior - 
class ADAPTgdHiddenNeuronTrainBehavior : public ADAPTgdNeuronTrainBehavior {
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

