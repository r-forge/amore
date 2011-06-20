#pragma once
#include "TrainingVariablesSet.h"

/// class ADAPTgdTrainingVariables - 
class ADAPTgdTrainingVariables : public TrainingVariablesSet {
  // Attributes
protected:
  double output;
  double outputDerivative;
};

