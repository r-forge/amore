#pragma once
#include "Neuron.h"

/// class MLPneuron - 
class MLPneuron : public Neuron {
  // Attributes
protected:
  double bias;
  // Operations
public:
  void show ();
  bool validate ();
};

