#pragma once
#include "TrainingBehavior.h"

/// class AdaptBehavior - 
class AdaptBehavior : public TrainingBehavior {
  // Operations
public:
  virtual void adjustParameters () = 0;
};

