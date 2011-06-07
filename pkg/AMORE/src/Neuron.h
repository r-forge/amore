/*
 * Neuron.h
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */

#ifndef NEURON_H_
#define NEURON_H_

//!  A class to handle the information contained in a general Neuron.
/*!
 *   A general class for neurons. The MLPneuron and RBFneuron classes will specialize this general class
 */

class Neuron
{
  //! An integer variable with the Neuron Id
  /*!
   * The Neuron Id provides a name to the neuron. This value is not expected to be used neither during simulation nor training but it provides an easy reference for human readers.
   */
  int Id;

  //! A vector of input connections
  /*!
   *
   */

  VecCon con;
  double outputValue;

public:
  Neuron();

  Neuron(int Id);

  Neuron(int Id, VecCon con);

  ~Neuron();

  int
  getId();

  void
  setId(int value);

  VecNeuron
  getFrom();

  std::vector<int>
  getConId();

  std::vector<double>
  getWeight();

  bool
  setFrom(VecNeuron neuronContainer);

  bool
  setWeight(std::vector<double> nWeights);

  int
  numOfCons();

  bool
  show();

  bool
  validate();

};

#endif /* NEURON_H_ */

