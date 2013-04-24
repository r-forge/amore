#pragma once
#include "ADAPTgdwmNeuronTrainBehavior.h"

/// class ADAPTgdwmHiddenNeuronTrainBehavior - 
class ADAPTgdwmHiddenNeuronTrainBehavior : public ADAPTgdwmNeuronTrainBehavior {
  // Operations
public:
  ADAPTgdwmHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
  void singlePatternBackwardAction ();
private:
  void endOfEpochAction ();
  std::string getName ();
};

