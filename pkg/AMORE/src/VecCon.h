/*
 *  VecCon.h
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#ifndef VECCON_H_
#define VECCON_H_

//!  A vector of connections
/*!
 *   The VecCon class provides a simple class for a vector of connections. It's named after the R equivalent Reference Class.
 */

class VecCon : public Container<Con>
{

public:

  VecCon();

  VecCon(std::vector<ConPtr> collection);

  int
  numOfCons();

  std::vector<int>
  getId();

  bool
  buildAndAppend(VecNeuron neuronContainer, std::vector<double> nWeights);

  std::vector<double>
  getWeight();

  std::vector<double>
  getWeight(std::vector<int> nIds);

  VecNeuron
  getFrom();

  bool
  setWeight(std::vector<double> nWeights);

  bool
  setWeight(std::vector<double> nWeights, std::vector<int> nIds);

  bool
  setFrom(VecNeuron neuronContainer);

  void
  erase(std::vector<int> nIds);

  VecConPtr
  select(std::vector<int> nIds);

  bool
  validate();
};

#endif /* VECCON_H_ */

