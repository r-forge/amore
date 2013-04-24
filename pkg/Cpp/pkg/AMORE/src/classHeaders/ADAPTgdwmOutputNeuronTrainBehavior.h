#pragma once
#include "ADAPTgdwmNeuronTrainBehavior.h"

/// class ADAPTgdwmOutputNeuronTrainBehavior - 
class ADAPTgdwmOutputNeuronTrainBehavior : public ADAPTgdwmNeuronTrainBehavior {
  // Operations
public:
  ADAPTgdwmOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  void singlePatternBackwardAction ();
private:
  void endOfEpochAction ();
  std::string getName ();
};

