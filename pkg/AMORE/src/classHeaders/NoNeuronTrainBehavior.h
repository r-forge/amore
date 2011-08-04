#pragma once
#include "NeuronTrainBehavior.h"

/// class NoNeuronTrainBehavior - 
class NoNeuronTrainBehavior : public NeuronTrainBehavior {
  // Operations
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
};

