/*
 *  VecNeuron.cpp
 *
 *  Created on: 03/06/2011
 *
 */

VecNeuron::VecNeuron()
{
}

VecNeuron::VecNeuron(std::vector<NeuronPtr> collection) :
  Container<Neuron>(collection)
{
}

VecNeuron::~VecNeuron()
{
}

int
VecNeuron::numOfNeurons()
{
  size();
}

std::vector<int>
VecNeuron::getId(){
  std::vector<int> nIds;
  foreach(NeuronPtr itrNeuron, *this){
    nIds.push_back( itrNeuron->getId() );
  }
  return nIds;
}
