#pragma once
// Interface
/// class NeuronTrainBehavior - 
class NeuronTrainBehavior {
  // Operations
public:
  virtual void singlePatternAction () = 0;
  virtual void endOfEpochAction () = 0;
};

