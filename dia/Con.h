/// class Con - 
class Con {
  // Attributes
protected:
  Neuron& d_neuron;
  double d_weight;
  // Operations
public:
  Con ();
  Con (Neuron& neuron);
  Con (Neuron& neuron, double weight);
  Neuron& neuron ();
  int Id ();
  double& weight ();
  void show ();
  bool validate ();
};

