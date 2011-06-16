#include "SimulationVariables.h"

/// class Neuron - 
class Neuron {
  // Attributes
protected:
  int Id;
  Container<Con> nCons;
  SimulationVariables simulationVariables;
  TrainingVariables trainingVariables;
  // Operations
public:
  Neuron ();
  Neuron (int Id);
  Neuron (int Id, Container<Con>::const_iterator firstCon, Container<Con>::const_iterator lastCon);
  int getId ();
  void setId (int Id);
  void iterators (Container<Con>::iterator & first, Container<Con>::iterator & last);
  void const_iterators (Container<Con>::iterator & first, Container<Con>::iterator & last);
  void show ();
  bool validate ();
};

