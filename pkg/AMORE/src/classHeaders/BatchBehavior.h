#pragma once
#include "TrainingBehavior.h"

/// class BatchBehavior - 
class BatchBehavior : public TrainingBehavior {
  // Operations
public:
  virtual void adjustParameters () = 0;
};

