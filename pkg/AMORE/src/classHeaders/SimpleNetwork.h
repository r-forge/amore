#pragma once
#include "NeuralNetwork.h"

/// class SimpleNetwork - 
class SimpleNetwork : public NeuralNetwork {
  // Operations
public:
  SimpleNetwork (NeuralFactory& neuralFactory);
private:
  void writeInput (std::vector<double>::iterator& iterator);
  void predict ();
  void readOutput (std::vector<double>::iterator& iterator);
  size_type inputSize ();
  size_type outputSize ();
  void show ();
  bool validate ();
};

