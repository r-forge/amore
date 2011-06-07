/*
 *  VecNeuron.cpp
 *
 *  Created on: 03/06/2011
 *
 */

VecNeuron::VecNeuron()
{
}

VecNeuron::VecNeuron(std::vector<NeuronPtr> vNeuron) :
  collection(vNeuron)
{
}

VecNeuron::~VecNeuron()
{
}

int
VecNeuron::numOfNeurons()Ê
{
  size();
}

