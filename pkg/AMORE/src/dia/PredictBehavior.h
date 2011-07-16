#pragma once
// Interface
/// class PredictBehavior - 
class PredictBehavior {
  // Operations
public:
  virtual void predict () = 0;
  virtual void show () = 0;
  virtual double getOutput () = 0;
  virtual void setOutput (double output) = 0;
};

