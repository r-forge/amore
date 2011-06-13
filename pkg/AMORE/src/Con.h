#ifndef CON_H_
#define CON_H_
class Con
{
  // Attributes
protected:
  NeuronWeakPtr from;
  double weight;
  // Operations
public:
  Con();

  Con(NeuronPtr neuronPtr);

  Con(NeuronPtr neuronPtr, double weight);

  NeuronPtr
  getFrom();

  int
  getId();

  double
  getWeight();

  void
  setFrom(NeuronPtr neuronPtr);

  void
  setWeight(double weight);

  void
  show();

  bool
  validate();
};

#endif // CON_H_
