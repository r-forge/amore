#pragma once
#include "ADAPTgdNeuronTrainBehavior.h"

/// class ADAPTgdHiddenNeuronTrainBehavior - 
class ADAPTgdHiddenNeuronTrainBehavior : public ADAPTgdNeuronTrainBehavior {
  // Operations
public:
  ADAPTgdHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

