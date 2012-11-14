#pragma once
#include "BATCHgdwmNeuronTrainBehavior.h"

/// class BATCHgdwmOutputNeuronTrainBehavior - 
class BATCHgdwmOutputNeuronTrainBehavior : public BATCHgdwmNeuronTrainBehavior {
  // Operations
public:
  BATCHgdwmOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

