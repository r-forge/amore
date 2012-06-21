#pragma once
#include "BATCHgdNeuronTrainBehavior.h"

/// class BATCHgdOutputNeuronTrainBehavior - 
class BATCHgdOutputNeuronTrainBehavior : public BATCHgdNeuronTrainBehavior {
  // Operations
public:
  BATCHgdOutputNeuronTrainBehavior (NeuronPtr neuronPtr);
private:
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

