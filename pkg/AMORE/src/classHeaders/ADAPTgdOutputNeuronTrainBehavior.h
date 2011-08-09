#pragma once
#include "ADAPTgdNeuronTrainBehavior.h"

/// class ADAPTgdOutputNeuronTrainBehavior - 
class ADAPTgdOutputNeuronTrainBehavior : public ADAPTgdNeuronTrainBehavior {
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

