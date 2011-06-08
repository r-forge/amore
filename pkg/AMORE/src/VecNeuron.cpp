/*
 *  NeuronContainer.cpp
 *
 *  Created on: 03/06/2011
 *
 */

NeuronContainer::NeuronContainer()
{
}

NeuronContainer::NeuronContainer(std::vector<NeuronPtr> collection) :
  Container<Neuron> (collection)
{
}

NeuronContainer::~NeuronContainer()
{
}

int
NeuronContainer::numOfNeurons()
{
  size();
}

std::vector<int>
NeuronContainer::numOfCons()
{
  std::vector<int> nIds;
  foreach(NeuronPtr itrNeuron, *this)
    {
      nIds.push_back( itrNeuron->numOfCons() );
    }
  return nIds;
}

std::vector<int>
NeuronContainer::getId()
{
  std::vector<int> nIds;
  foreach(NeuronPtr itrNeuron, *this)
    {
      nIds.push_back( itrNeuron->getId() );
    }
  return nIds;
}

void
NeuronContainer::setId(std::vector<int> nIds)
{
  std::vector<int>::iterator itrId(nIds.begin());
foreach(NeuronPtr itrNeuron, *this)
  {
    itrNeuron->setId(*itrId);
  }
}

std::vector<std::vector<int> >
NeuronContainer::getConId()
{
  std::vector < std::vector<int> > result;
  foreach(NeuronPtr itrNeuron, *this)
    {
      result.push_back( itrNeuron->getConId() );
    }
  return result;
}

std::vector<std::vector<double> > // Don't forget the blank space between "> >"
NeuronContainer::getWeight()
{
  std::vector < std::vector<double> > result;
  foreach(NeuronPtr itrNeuron, *this)
    {
      result.push_back( itrNeuron->getWeight() );
    }
  return result;
}

std::vector<NeuronContainer>
NeuronContainer::getFrom()
{
  std::vector < NeuronContainer > result;
  foreach(NeuronPtr itrNeuron, *this)
    {
      result.push_back( itrNeuron->getFrom() );
    }
  return result;
}

void
NeuronContainer::setFrom(std::vector<NeuronContainer> neuronArray)
{
  std::vector<NeuronContainer>::iterator itrArray(neuronArray.begin());
foreach(NeuronPtr itrNeuron, *this)
  {
    itrNeuron->setFrom(*itrArray);
    itrArray++;
  }
}

void
NeuronContainer::setWeight(std::vector<std::vector<double> > value)
{
  std::vector<std::vector<double> >::iterator itrValue(value.begin());
foreach(NeuronPtr itrNeuron, *this)
  {
    itrNeuron->setWeight(*itrValue);
    itrValue++;
  }
}

