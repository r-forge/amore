/*
 *  ConContainer.h
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#ifndef VECCON_H_
#define VECCON_H_

//!  A vector of connections
/*!
 *   The ConContainer class provides a simple class for a vector of connections. It's named after the R equivalent Reference Class.
 */

class ConContainer : public Container<Con>
{

public:

  ConContainer();

  ConContainer(std::vector<ConPtr> collection);

  int
  numOfCons();

  std::vector<int>
  getId();

  bool
  buildAndAppend(NeuronContainer neuronContainer, std::vector<double> nWeights);

  std::vector<double>
  getWeight();

  std::vector<double>
  getWeight(std::vector<int> nIds);

  NeuronContainer
  getFrom();

  bool
  setWeight(std::vector<double> nWeights);

  bool
  setWeight(std::vector<double> nWeights, std::vector<int> nIds);

  bool
  setFrom(NeuronContainer neuronContainer);

  void
  erase(std::vector<int> nIds);

  ConContainerPtr
  select(std::vector<int> nIds);

  bool
  validate();
};

#endif /* VECCON_H_ */

