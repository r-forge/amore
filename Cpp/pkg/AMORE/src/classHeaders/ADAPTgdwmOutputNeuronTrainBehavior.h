#pragma once
#include "ADAPTgdwmNeuronTrainBehavior.h"

/// class ADAPTgdwmOutputNeuronTrainBehavior - 
class ADAPTgdwmOutputNeuronTrainBehavior : public ADAPTgdwmNeuronTrainBehavior {
  // Operations
public:
  ADAPTgdwmOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

