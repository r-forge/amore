#pragma once
#include "ADAPTgdNeuronTrainBehavior.h"

/// class ADAPTgdOutputNeuronTrainBehavior - 
class ADAPTgdOutputNeuronTrainBehavior : public ADAPTgdNeuronTrainBehavior {
  // Operations
public:
  ADAPTgdOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

