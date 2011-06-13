#include "NeuralNet.h"

/// class MLPneuralNet - 
class MLPneuralNet : public NeuralNet {
  // Attributes
public:
  Container<Layer> nLayers;
  // Operations
public:
  void show ();
  bool validate ();
};

