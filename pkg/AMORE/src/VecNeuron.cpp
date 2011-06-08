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
  Container<Neuron> (collection)
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
VecNeuron::numOfCons()
{
  std::vector<int> nIds;
  foreach(NeuronPtr itrNeuron, *this)
    {
      nIds.push_back( itrNeuron->numOfCons() );
    }
  return nIds;
}

std::vector<int>
VecNeuron::getId()
{
  std::vector<int> nIds;
  foreach(NeuronPtr itrNeuron, *this)
    {
      nIds.push_back( itrNeuron->getId() );
    }
  return nIds;
}

void
VecNeuron::setId(std::vector<int> nIds)
{
  std::vector<int>::iterator itrId(nIds.begin());
foreach(NeuronPtr itrNeuron, *this)
  {
    itrNeuron->setId(*itrId);
  }
}

std::vector<std::vector<int> >
VecNeuron::getConId()
{
  std::vector < std::vector<int> > result;
  foreach(NeuronPtr itrNeuron, *this)
    {
      result.push_back( itrNeuron->getConId() );
    }
  return result;
}

std::vector<std::vector<double> > // Don't forget the blank space between "> >"
VecNeuron::getWeight()
{
  std::vector < std::vector<double> > result;
  foreach(NeuronPtr itrNeuron, *this)
    {
      result.push_back( itrNeuron->getWeight() );
    }
  return result;
}

std::vector<VecNeuron>
VecNeuron::getFrom()
{
  std::vector < VecNeuron > result;
  foreach(NeuronPtr itrNeuron, *this)
    {
      result.push_back( itrNeuron->getFrom() );
    }
  return result;
}

void
VecNeuron::setFrom(std::vector<VecNeuron> neuronArray)
{
  std::vector<VecNeuron>::iterator itrArray(neuronArray.begin());
foreach(NeuronPtr itrNeuron, *this)
  {
    itrNeuron->setFrom(*itrArray);
    itrArray++;
  }
}

void
VecNeuron::setWeight(std::vector<std::vector<double> > value)
{
  std::vector<std::vector<double> >::iterator itrValue(value.begin());
foreach(NeuronPtr itrNeuron, *this)
  {
    itrNeuron->setWeight(*itrValue);
    itrValue++;
  }
}

