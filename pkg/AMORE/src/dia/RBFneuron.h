#pragma once
#include "Neuron.h"

/// class RBFneuron - 
class RBFneuron : public Neuron {
  // Attributes
protected:
  double width;
  double altitude;
  // Operations
public:
  /// 	
  void show ();
  bool validate ();
};

