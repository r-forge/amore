#pragma once
#include "MLPbehavior.h"
#include "ADAPTgdOutputNeuronTrainBehavior.h"
#include "ADAPTgdHiddenNeuronTrainBehavior.h" 
/// class Con - 
class Con {
  // Attributes
private:
  NeuronPtr d_neuron;
  double d_weight;
  // Operations
public:
friend void MLPbehavior::singlePatternForwardAction(); 
friend void ADAPTgdOutputNeuronTrainBehavior::singlePatternBackwardAction();
friend void ADAPTgdHiddenNeuronTrainBehavior::singlePatternBackwardAction();
  Con (NeuronPtr neuron);
  Con (NeuronPtr neuron, double weight);
  ~Con ();
  Handler Id ();
  NeuronPtr getNeuron ();
  void setNeuron (NeuronPtr neuron);
  double getWeight ();
  void setWeight (double weight);
  void addToWeight (double value);
  double getInputValue ();
  void addToDelta (double value);
  void show ();
  bool validate ();
};

