#pragma once
#include "ADAPTgdwmNeuronTrainBehavior.h"

/// class ADAPTgdwmHiddenNeuronTrainBehavior - 
class ADAPTgdwmHiddenNeuronTrainBehavior : public ADAPTgdwmNeuronTrainBehavior {
  // Operations
public:
  ADAPTgdwmHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

