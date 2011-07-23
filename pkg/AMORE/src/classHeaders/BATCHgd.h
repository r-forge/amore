#pragma once
#include "BatchBehavior.h"

/// class BATCHgd - 
class BATCHgd : public BatchBehavior {
  // Attributes
private:
  double outputDerivative;
  // Operations
public:
  void adjustParameters ();
};

