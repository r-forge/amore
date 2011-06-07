/*
 * Con.h
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */

#ifndef CON_H_
#define CON_H_

//!  A class to handle the information needed to describe an input connection.
/*!
 *   The Con class provides a simple class for a connection described by a pair of values: a pointer to a Neuron object used as the \ref from field and the \ref weight used to propagate the value of that Neuron object.
 */

class Con
{
  //! A smart pointer to the Neuron used as input during simulation or training.
  /*!
   * The \ref from field contains the address of the Neuron whose output will be used as input by the Neuron containing the Con object.
   */
  NeuronWeakPtr from;
  //! A double variable that contains the weight of the connection
  /*!
   * The \ref weight field contains the factor by which the output value of the Neuron addressed by the from field is multiplied during simulation or training.
   */
  double weight;

public:

  Con();
  Con(NeuronPtr from);
  Con(NeuronPtr from, double weight);
  ~Con();
  NeuronPtr
  getFrom();
  void
  setFrom(NeuronPtr from);
  int
  getId();
  double
  getWeight();
  void
  setWeight(double weight);
  bool
  show();
  bool
  validate();
};
#endif /* CON_H_ */

