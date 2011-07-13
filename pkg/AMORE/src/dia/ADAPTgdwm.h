#pragma once
#include "AdaptBehavior.h"

/// class ADAPTgdwm - 
class ADAPTgdwm : public AdaptBehavior {
  // Attributes
private:
  double outputDerivative;
  // Operations
public:
  void adjustParameters ();
};

