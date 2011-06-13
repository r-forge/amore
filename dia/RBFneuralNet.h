#include "NeuralNet.h"

/// class RBFneuralNet - 
class RBFneuralNet : public NeuralNet {
  // Attributes
protected:
  Container<Layer> nLayers;
  // Operations
public:
  void show ();
  bool validate ();
};

