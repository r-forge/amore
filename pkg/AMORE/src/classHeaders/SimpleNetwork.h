#pragma once
#include "NeuralNetwork.h"

/// class SimpleNetwork - 
class SimpleNetwork : public NeuralNetwork {
  // Operations
public:
  SimpleNetwork (NeuralFactory& neuralFactory);
  void show ();
  bool validate ();
};

