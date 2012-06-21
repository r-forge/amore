#pragma once
#include "BATCHgdwmNeuronTrainBehavior.h"

/// class BATCHgdwmHiddenNeuronTrainBehavior - 
class BATCHgdwmHiddenNeuronTrainBehavior : public BATCHgdwmNeuronTrainBehavior {
  // Operations
public:
  BATCHgdwmHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

