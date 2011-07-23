#pragma once
#include "BatchBehavior.h"

/// class BATCHgdwm - 
class BATCHgdwm : public BatchBehavior {
  // Attributes
private:
  double outputDerivative;
  // Operations
public:
  void adjustParameters ();
};

