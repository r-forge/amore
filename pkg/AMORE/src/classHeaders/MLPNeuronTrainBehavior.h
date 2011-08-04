#pragma once
/// class MLPNeuronTrainBehavior - 
class MLPNeuronTrainBehavior {
  // Operations
protected:
  virtual void singlePatternBackwardAction () = 0;
  virtual void endOfEpochAction () = 0;
};

