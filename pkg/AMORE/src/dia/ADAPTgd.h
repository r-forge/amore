#pragma once
#include "AdaptBehavior.h"

/// class ADAPTgd - 
class ADAPTgd : public AdaptBehavior {
  // Attributes
private:
  double outputDerivative;
  // Operations
public:
  void adjustParameters ();
};

