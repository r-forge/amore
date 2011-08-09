#pragma once
#include "ADAPTgdwmNeuronTrainBehavior.h"

/// class ADAPTgdwmOutputNeuronTrainBehavior - 
class ADAPTgdwmOutputNeuronTrainBehavior : public ADAPTgdwmNeuronTrainBehavior {
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

