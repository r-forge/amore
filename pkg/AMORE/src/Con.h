#ifndef CON_H_
#define CON_H_
/// class Con -
class
Con  {

    // Attributes
  protected:

    Neuron& d_neuron;

    double d_weight;

    // Operations
  public:

    Con (Neuron& neuron);

    Con (Neuron& neuron, double weight);

    Neuron& neuron ();

    int Id ();

    double& weight ();

    void show ();

    bool validate ();
  };

#endif // CON_H_
