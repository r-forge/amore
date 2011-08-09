#pragma once
#include "ADAPTgdwmNeuronTrainBehavior.h"

/// class ADAPTgdwmHiddenNeuronTrainBehavior - 
class ADAPTgdwmHiddenNeuronTrainBehavior : public ADAPTgdwmNeuronTrainBehavior {
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

