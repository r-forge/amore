#pragma once
#include "NeuronTrainBehavior.h"

/// class NoNeuronTrainBehavior - 
class NoNeuronTrainBehavior : public NeuronTrainBehavior {
  // Operations
public:
  NoNeuronTrainBehavior (NeuronPtr neuronPtr);
private:
  void addToNeuronBias (double value);
  void addToDelta (double value);
  void singlePatternBackwardAction ();
  void endOfEpochAction ();
  std::string getName ();
};

