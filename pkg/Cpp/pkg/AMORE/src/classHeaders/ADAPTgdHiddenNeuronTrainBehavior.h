#pragma once
#include "ADAPTgdNeuronTrainBehavior.h"

/// class ADAPTgdHiddenNeuronTrainBehavior - 
class ADAPTgdHiddenNeuronTrainBehavior : public ADAPTgdNeuronTrainBehavior {
  // Operations
public:
  ADAPTgdHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
  void singlePatternBackwardAction ();
private:
  void endOfEpochAction ();
  std::string getName ();
};

