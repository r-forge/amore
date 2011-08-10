#pragma once
#include "BATCHgdNeuronTrainBehavior.h"

/// class BATCHgdHiddenNeuronTrainBehavior - 
class BATCHgdHiddenNeuronTrainBehavior : public BATCHgdNeuronTrainBehavior {
  // Operations
public:
  BATCHgdHiddenNeuronTrainBehavior (NeuronPtr neuronPtr);
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

