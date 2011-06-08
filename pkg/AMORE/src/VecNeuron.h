/*
 *  VecNeuron.h
 *
 *  Created on: 03/06/2011
 *  Author: mcasl
 *
 */

#ifndef VECNEURON_H_
#define VECNEURON_H_

//!  A vector of neurons
/*!
 *   The vecNeuron class provides a simple class for a vector of neurons. It's named after the R equivalent Reference Class.
 */

class VecNeuron : public Container<Neuron>
{
public:
  VecNeuron();

  VecNeuron(std::vector<NeuronPtr> vNeuron);

  ~VecNeuron();

  int
  numOfNeurons();

  std::vector<int>
  numOfCons();

  std::vector<int>
  getId();

  void
  setId(std::vector<int> nIds);

  std::vector<std::vector<int> > // Don't forget the blank space between "> >"
  getConId();

  std::vector<std::vector<double> > // Don't forget the blank space between "> >"
  getWeight();

  std::vector<VecNeuron>
  getFrom();

  void
  setFrom(std::vector<VecNeuron> neuronArray);


  void
  setWeight(std::vector<std::vector<double> > value);

#if 0
  bool
  is.regular ( );

  std::vector<double>
  getWeight(std::vector<int> FROM);

  void
  setWeight(std::vector<double> value, std::vector<int> FROM);


  void
  erase(std::vector<int> FROM); // Move it to Container

  VecCon
  select(std::vector<int> FROM); // Move it to Container

  bool
  validate();

#endif /* 0 */
};

#endif /* VECNEURON_H_ */

