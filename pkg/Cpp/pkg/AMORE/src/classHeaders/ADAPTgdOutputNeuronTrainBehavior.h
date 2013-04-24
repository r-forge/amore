#pragma once
#include "ADAPTgdNeuronTrainBehavior.h"

/// class ADAPTgdOutputNeuronTrainBehavior - 
class ADAPTgdOutputNeuronTrainBehavior : public ADAPTgdNeuronTrainBehavior {
  // Operations
public:
  ADAPTgdOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
  void singlePatternBackwardAction ();
private:
  void endOfEpochAction ();
  std::string getName ();
};

