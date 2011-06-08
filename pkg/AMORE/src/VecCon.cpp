/*
 * ConContainer.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */


ConContainer::ConContainer()
{
}


ConContainer::ConContainer(std::vector<ConPtr> collection) :
  Container<Con> (collection)                   // Call to Base constructor
{
}

//! Size of the ConContainer object
/*!
 * This function returns the size of the ConContainer object, that is to say, the number of Con objects it contains.
 * \return The size of the vector
 *
 *  \code
 *  //================
 *  //Usage example:
 *  //================
 *	// Data set up
 *				std::vector<int> result;
 *				std::vector<ConPtr> vcA, vcB;
 *				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
 *				ConContainerPtr	ptShvCon( new ConContainer() );
 *				ConPtr	ptC;
 *				NeuronPtr ptN;
 *				int ids[]= {10, 20, 30};
 *				double weights[] = {1.13, 2.22, 3.33 };
 *				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
 *					ptN.reset( new Neuron( ids[i] ) );
 *					ptShvNeuron->push_back(ptN);
 *				}
 *	// Test
 *				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
 *					result.push_back(ptShvCon->numOfCons());		// Append numOfCons to result, create new Con and push_back into MyConContainer
 *					ptC.reset( new Con( ptShvNeuron->load().at(i), weights[i]) );
 *					ptShvCon->push_back(ptC);
 *				}
 *
 *	// Now, result contains a numeric vector with values 0, 1, 2, and 3.
 * \endcode
 *
 * \sa Container::size (alias)
 */
int
ConContainer::numOfCons()
{
  return size();
}

//! Getter of the Id values of the vector of Cons
/*!
 * This function returns the Id's of the neurons referred to by the vector of Cons.
 * \return An std::vector<int> that contains the Ids
 *
 * \code
 *  //================
 *  //Usage example:
 *  //================
 * 	// Data set up
 *			Neuron N1, N2, N3;
 *			ConContainer MyConContainer;
 *			std::vector<int> result;
 *
 *			N1.setId(10);
 *			N2.setId(20);
 *			N3.setId(30);
 *
 *			ConPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
 *			MyConContainer.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N2, 2.22) );		// create new Con and assign to ptCon
 *			MyConContainer.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
 *			MyConContainer.push_back(ptCon);				// push_back
 *
 *	// Test
 *			MyConContainer.show() ;
 *			MyConContainer.validate();
 *			result=MyConContainer.getId();
 *
 *	// Now result is a vector that contains the values 10, 20 and 30.
 * \endcode
 *
 * \sa getWeight and the unit test files, e.g. runit.Cpp.ConContainer.R, for further examples.
 */
std::vector<int>
ConContainer::getId()
{
  std::vector<int> result;
  result.reserve(numOfCons());
  foreach (ConPtr itr, *this)
    {
      result.push_back(itr->getId());
    }
  return result;
}


//! Builds Con objects and appends them to collection.
/*!
 * This function provides a convenient way of populating a ConContainer object by building and apending Con objects to collection.
 * \param FROM  A vector of smart pointers to the neurons to be used in the Con::from fields
 * \param WEIGHT A vector of values to be set in the Con::weight fields
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<int> result;
 *		ConContainer MyConContainer;
 *		std::vector<NeuronPtr> vNeuron;
 *		std::vector<double> vWeight;
 *
 *
 *	// Test
 *		NeuronPtr ptNeuron( new Neuron(11) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(22) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(33) );
 *		vNeuron.push_back(ptNeuron);
 *
 *		vWeight.push_back(12.3);
 *		vWeight.push_back(1.2);
 *		vWeight.push_back(2.1);
 *
 *		MyConContainer.buildAndAppend(vNeuron, vWeight);
 *
 *		result=MyConContainer.getId();
 *
 *	// Now result is a vector that contains the values 11, 22 and 32.
 * \endcode
 *
 * \sa append and the unit test files, e.g. runit.Cpp.ConContainer.R, for further examples.
 */
bool
ConContainer::buildAndAppend(NeuronContainer neuronContainer, std::vector<double> nWeights)
{
  BEGIN_RCPP
  if (neuronContainer.empty())
    { throw std::range_error("[ConContainer::BuildAndAppend]: Error, neuronContainer is empty");}
  if (neuronContainer.size() != nWeights.size())
    {
      throw std::range_error(
          "[ConContainer::buildAndAppend]: Error, neuronContainer.size() != nWeights.size()");
    }
  reserve(size() + neuronContainer.size());
  ConPtr ptCon;

  std::vector<double>::iterator itrWeight = nWeights.begin();
  foreach (NeuronPtr itrNeuron, neuronContainer)
    {
      ptCon.reset( new Con( itrNeuron, *itrWeight) );
      push_back(ptCon);
      itrWeight++;
    }
  return true;
END_RCPP}

//! Getter of the weight field of the Con objects related to ConContainer
/*!
 * This function provides a convenient way of getting the values of
 * the weight field of those Con object pointed to by the smart pointer
 * stored in the ConContainer object.
 * \return A numeric (double) vector with the weights
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<double> result;
 *		ConContainer MyConContainer;
 *		std::vector<NeuronPtr> vNeuron;
 *		std::vector<double> vWeight;
 *
 *
 *	// Test
 *		NeuronPtr ptNeuron( new Neuron(11) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(22) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(33) );
 *		vNeuron.push_back(ptNeuron);
 *
 *		vWeight.push_back(12.3);
 *		vWeight.push_back(1.2);
 *		vWeight.push_back(2.1);
 *
 *		MyConContainer.buildAndAppend(vNeuron, vWeight);
 *
 *		result=MyConContainer.getWeight();
 *
 *	// Now result is a vector that contains the values 12.3, 1.2 and 2.1 .
 * \endcode
 *
 * \sa getId and the unit test files, e.g. runit.Cpp.ConContainer.R, for further examples.
 */
std::vector<double>
ConContainer::getWeight()
{
  std::vector<double> result;
  result.reserve(numOfCons());
  foreach (ConPtr itr, *this)
    {
      result.push_back( itr->getWeight() );
    }

  return result;
}

//! Setter of the weight field of the Con objects related to ConContainer
/*!
 * This function provides a convenient way of setting the values of the weight field of those Con objects pointed to by the smart pointer stored in the ConContainer object.
 *
 * \param vWeight A numeric (double) vector with the weights to be set in the Con objects contained in the ConContainer object.
 *
 * \return true in case no exception is thrown
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<double> result;
 *			int ids[]= {1, 2, 3};
 *			double weights[] = {12.3, 1.2, 2.1 };
 *			ConContainer MyConContainer;
 *			std::vector<NeuronPtr> vNeuron;
 *			std::vector<double> vWeight;
 *			NeuronPtr ptNeuron;
 *
 *			for (int i=0; i<=2; i++) {
 *			ptNeuron.reset( new Neuron(ids[1]) );
 *	 		vNeuron.push_back(ptNeuron);
 *			vWeight.push_back(0);					// weights are set to 0
 *			}
 *			MyConContainer.buildAndAppend(vNeuron, vWeight);
 *			MyConContainer.show();
 *
 *			for (int i=0; i<=2; i++) {
 *				vWeight.at(i)=weights[i];
 *			}
 *	// Test
 *			MyConContainer.setWeight(vWeight);			// weights are set to 12.3, 1.2 and 2.1
 *			result=MyConContainer.getWeight();
 *
 *	// Now result is a vector that contains the values 12.3, 1.2 and 2.1 .
 *
 * \endcode
 *
 * \sa getWeight and the unit test files, e.g. runit.Cpp.ConContainer.R, for further examples.
 */
bool
ConContainer::setWeight(std::vector<double> nWeights)
{
  BEGIN_RCPP
  if (nWeights.empty())
    { throw std::range_error("[ C++ ConContainer::setWeight]: Error, vWeight is empty");}
  if (nWeights.size() != size())
    {
      throw std::range_error(
          "[C++ ConContainer::setWeight]: Error, vWeight.size() != collection.size()");
    }
  std::vector<double>::iterator itrWeight = nWeights.begin();
  foreach (ConPtr itr, *this)
    {
      itr->setWeight( *itrWeight );
      itrWeight++;
    }
  return true;
END_RCPP}

//! Getter of the from field of the Con objects related to ConContainer
/*!
 * This function provides a convenient way of getting the values of the weight field of those Con object pointed to by the smart pointer stored in the ConContainer object.
 *
 * \return An std::vector<NeuronPtr> with the pointer to the incoming neurons.
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<double> result;
 *		int ids[]= {1, 2, 3};
 *		double weights[] = {12.3, 1.2, 2.1 };
 *		ConContainer MyConContainer;
 *		std::vector<NeuronPtr> vNeuron;
 *		std::vector<double> vWeight;
 *		NeuronPtr ptNeuron;
 *
 *			for (int i=0; i<=2; i++) {
 *				ptNeuron.reset( new Neuron(ids[i]) );
 *				vNeuron.push_back(ptNeuron);
 *				vWeight.push_back(weights[i]);
 *			}
 *			MyConContainer.buildAndAppend(vNeuron, vWeight);
 *		// Test
 *			vNeuron=MyConContainer.getFrom();
 *			for (int i=0; i<=2; i++) {
 *				result.push_back(vNeuron.at(i)->getId());
 *			}
 *
 *	// Now result is a vector that contains the values 1, 2 and 3 .
 *
 * \endcode
 *
 * \sa getId and the unit test files, e.g. runit.Cpp.ConContainer.R, for further examples.
 */
NeuronContainer
ConContainer::getFrom()
{
  NeuronContainer result;
  result.reserve(numOfCons());
  foreach(ConPtr itr, *this)
    {
      result.push_back( itr->getFrom() );
    }
  return result;
}

//! Setter of the from fields of the Con objects related to ConContainer
/*!
 * This function provides a convenient way of getting the values of the weight field of those Con object pointed to by the smart pointer stored in the ConContainer object.
 *
 * \param vFrom An std::vector<NeuronPtr> with the pointers to be set in the from fields of the ConContainer object.
 *
 * \return true if not exception is thrown
 *
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *
 *	// Data set up
 *		std::vector<int> result;
 *		ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
 *		ConContainerPtr	ptShvCon( new ConContainer() );
 *		ConPtr	ptC;
 *		NeuronPtr ptN;
 *
 *		int ids[]= {10, 20, 30};
 *		double weights[] = {1.13, 2.22, 3.33 };
 *
 *		for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
 *			ptN.reset( new Neuron( ids[i] ) );
 *			ptShvNeuron->push_back(ptN);
 *		}
 *		for (int i=0; i<=2 ; i++) {				// and a vector with three connections
 *			ptC.reset( new Con() );
 *			ptShvCon->push_back(ptC);
 *		}
 *	// Test
 *		ptShvCon->setFrom(ptShvNeuron->load()) ;
 *		ptShvCon->show();
 *		result=ptShvCon->getId();
 *
 *	// Now result is a vector that contains the values 10, 20 and 30.
 *
 * \endcode
 *
 * \sa getFrom and the unit test files, e.g. runit.Cpp.ConContainer.R, for further examples.
 */
bool
ConContainer::setFrom(NeuronContainer neuronContainer)
{
  BEGIN_RCPP
  if (neuronContainer.empty())
    { throw std::range_error("[ C++ ConContainer::setFrom]: Error, w is empty");}
  if (neuronContainer.size() != size())
    {
      throw std::range_error(
          "[C++ ConContainer::setFrom]: Error, neuronContainer.size() != collection.size()");
    }
  std::vector<NeuronPtr>::iterator itrNeuron = neuronContainer.begin();
  foreach(ConPtr itr , *this)
    {
      itr->setFrom( *itrNeuron );
      itrNeuron++;
    }
  return true;
END_RCPP}

struct CompareId
{

  bool
  operator()(const ConPtr a, const ConPtr b)
  {
    return a->getId() < b->getId();
  }
  ;

  bool
  operator()(const ConPtr a, const int b)
  {
    return a->getId() < b;
  }
  ;

  bool
  operator()(const int a, const ConPtr b)
  {
    return a < b->getId();
  }
  ;

  bool
  operator()(const int a, const int b)
  {
    return a < b;
  }
  ;
};

//! Erase the specified elements from the vecCom object.
/*!
 * Provides a convenient way of removing some Con objects from the collection field of the ConContainer object.
 *
 * \param vFrom An std::vector<int> with the Ids of the connections to remove.
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *
 *	// Data set up
 *			std::vector<int> result;
 *			std::vector<NeuronPtr> vNeuron;
 *			ConContainerPtr	ptShvCon( new ConContainer() );
 *			ConContainerPtr vErased;
 *			ConPtr	ptC;
 *			NeuronPtr ptN;
 *			int ids[]= {11, 10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
 *			std::vector<double> vWeight;
 *			vWeight.push_back(11.32);
 *			vWeight.push_back(1.26);
 *			vWeight.push_back(2.14);
 *			vWeight.push_back(3.16);
 *			vWeight.push_back(4.14);
 *			vWeight.push_back(5.19);
 *			vWeight.push_back(6.18);
 *			vWeight.push_back(7.16);
 *			vWeight.push_back(8.14);
 *			vWeight.push_back(9.12);
 *			vWeight.push_back(10.31);
 *
 *			for (int i=0; i<vWeight.size() ; i++) {				// Let's create a vector with three neurons
 *				ptN.reset( new Neuron( ids[i] ) );
 *				vNeuron.push_back(ptN);
 *			}
 *			ptShvCon->buildAndAppend(vNeuron, vWeight);
 *
 *			// Test
 *
 *			std::vector<int> toRemove;
 *	 		toRemove.push_back(1);
 *			toRemove.push_back(3);
 *			toRemove.push_back(5);
 *	 		toRemove.push_back(7);
 *
 *			ptShvCon->erase(toRemove);
 *			ptShvCon->show();
 *			result=ptShvCon->getId();
 *
 *		// The output at the R terminal would display :
 *		//
 *		// From:	 2 	 Weight= 	 9.120000
 *		// From:	 4 	 Weight= 	 4.140000
 *		// From:	 6 	 Weight= 	 6.180000
 *		// From:	 8 	 Weight= 	 8.140000
 *		// From:	 9 	 Weight= 	 2.140000
 *		// From:	 10  Weight= 	 1.260000
 *		// From:	 11  Weight= 	 11.320000
 *
 * \endcode
 *
 * \sa select and the unit test files, e.g. runit.Cpp.ConContainer.R, for further examples.
 *
 */
void
ConContainer::erase(std::vector<int> nIds)
{
  std::vector<ConPtr>::iterator itr;
  sort(begin(), end(), CompareId());
  sort(nIds.begin(), nIds.end());
  itr = set_difference(begin(), end(), nIds.begin(), nIds.end(), begin(),
      CompareId());
  resize(itr - begin());
}

//! Selects the specified elements from the vecCom object.
/*!
 * Provides a convenient way of selecting some Con objects from the collection field of the ConContainer object.
 *
 * \param vFrom An std::vector<int> with the Ids of the connections to select.
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *
 *	// Data set up
 *		std::vector<int> result;
 *		std::vector<NeuronPtr> vNeuron;
 *		ConContainerPtr	ptShvCon( new ConContainer() );
 *		ConPtr	ptC;
 *		NeuronPtr ptN;
 *		int ids[]= {11, 10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
 *		double weights[]={11.32, 1.26, 2.14, 3.16, 4.14, 5.19, 6.18, 7.16, 8.14, 9.12, 10.31};
 *		std::vector<double> vWeight;
 *		for (int i=0; i<11; i++) {
 *			vWeight.push_back(weights[i]);
 *		}
 *		for (int i=0; i<vWeight.size() ; i++) {				// Let's create a vector with three neurons
 *			ptN.reset( new Neuron( ids[i] ) );
 *			vNeuron.push_back(ptN);
 *		}
 *		ptShvCon->buildAndAppend(vNeuron, vWeight);
 *		// Test
 *		std::vector<int> toSelect;
 *		toSelect.push_back(1);
 *		toSelect.push_back(3);
 *		toSelect.push_back(5);
 *		toSelect.push_back(7);
 *
 *		ConContainerPtr  vSelect (  ptShvCon->select(toSelect)  );
 *		result=vSelect->getId();
 *
 *		// Now, result is a numeric vector with the values 1, 3, 5 and 7.
 *
 *		\endcode
 *
 *		\sa erase and the unit test files, e.g. runit.Cpp.ConContainer.R, for further examples.
 */
ConContainerPtr
ConContainer::select(std::vector<int> nIds)
{
  ConContainerPtr result(new ConContainer);
  result->reserve(size());
  sort(begin(), end(), CompareId());
  sort(nIds.begin(), nIds.end());
  set_intersection(begin(), end(), nIds.begin(), nIds.end(),
      back_inserter(result->collection), CompareId());

  return result;
}

//! Getter of the weights of the specified elements from the vecCom object.
/*!
 * Provides a convenient way of getting the weights of some Con objects from the collection field of the ConContainer object.
 *
 * \param vFrom An std::vector<int> with the Ids of the connections to select
 *
 * \return An std::vector<double> with the weights of the selected connections
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *
 *	// Data set up
 *
 *		std::vector<double> result;
 *		std::vector<NeuronPtr> vNeuron;
 *		ConContainerPtr	ptShvCon( new ConContainer() );
 *		ConPtr	ptC;
 *		NeuronPtr ptN;
 *		int ids[]= {11, 10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
 *		double weights[]={11.32, 1.26, 2.14, 3.16, 4.14, 5.19, 6.18, 7.16, 8.14, 9.12, 10.31};
 *		std::vector<double> vWeight;
 *		for (int i=0; i<11; i++) {
 *			vWeight.push_back(weights[i]);
 *		}
 *		for (int i=0; i<vWeight.size() ; i++) {				// Let's create a vector with three neurons
 *			ptN.reset( new Neuron( ids[i] ) );
 *			vNeuron.push_back(ptN);
 *		}
 *		ptShvCon->buildAndAppend(vNeuron, vWeight);
 *
 *	// Test
 *		std::vector<int> toSelect;
 *		toSelect.push_back(1);
 *		toSelect.push_back(3);
 *		toSelect.push_back(5);
 *		toSelect.push_back(7);
 *
 *		result=ptShvCon->getWeight(toSelect);
 *
 *	// Now, result is a numeric vector with the values  10.31, 3.16,  5.19 and 7.16.
 *
 * \endcode
 *
 *	\sa setWeigth and the unit test files, e.g. runit.Cpp.ConContainer.R, for further examples.
 *
 */
std::vector<double>
ConContainer::getWeight(std::vector<int> nIds)
{
  return select(nIds)->getWeight();
}

//! Setter of the weights of the specified elements from the ConContainer object.
/*!
 * Provides a convenient way of setting the weights of some Con objects from the collection field of the ConContainer object.
 *
 * \param vWeight A numeric (double) vector with the weights to be set in the Con objects contained in the ConContainer object.
 * \param vFrom An std::vector<int> with the Ids of the connections to select
 *
 * \return true in case no exception is thrown
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *
 *	// Data set up
 *		std::vector<double> result;
 *			std::vector<NeuronPtr> vNeuron;
 *			ConContainerPtr	ptShvCon( new ConContainer() );
 *			ConPtr	ptC;
 *			NeuronPtr ptN;
 *			int ids[]= {11, 10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
 *			double weights[]={11.32, 1.26, 2.14, 3.16, 4.14, 5.19, 6.18, 7.16, 8.14, 9.12, 10.31};
 *			std::vector<double> vWeight;
 *			for (int i=0; i<11; i++) {
 *			vWeight.push_back(weights[i]);
 *			}
 *			for (int i=0; i<vWeight.size() ; i++) {				// Let's create a vector with three neurons
 *			ptN.reset( new Neuron( ids[i] ) );
 *			vNeuron.push_back(ptN);
 *			}
 *			ptShvCon->buildAndAppend(vNeuron, vWeight);
 *
 *			std::vector<int> toSelect;
 *			std::vector<double> vNewWeights;
 *			toSelect.push_back(1);
 *			toSelect.push_back(3);
 *			toSelect.push_back(5);
 *			toSelect.push_back(7);
 *			vNewWeights.push_back(1000.1);
 *			vNewWeights.push_back(3000.3);
 *			vNewWeights.push_back(5000.5);
 *			vNewWeights.push_back(7000.7);
 *			ptShvCon->setWeight(vNewWeights, toSelect);
 *
 *	// Test
 *			result = ptShvCon->getWeight();
 *			return wrap(result);
 *
 *	// Now, result is a numeric vector with the values  1000.10, 9.12, 3000.30, 4.14, 5000.50, 6.18, 7000.70, 8.14, 2.14, 1.26 and 11.32 .
 *
 * \endcode
 *
 *	\sa getWeigth and the unit test files, e.g. runit.Cpp.ConContainer.R, for further examples.
 *
 */
bool
ConContainer::setWeight(std::vector<double> nWeights, std::vector<int> nIds)
{
BEGIN_RCPP
return select(nIds)->setWeight(nWeights);
END_RCPP
}

//! Object validator
/*! This method checks the object for internal coherence.
 *  A try / catch mechanism exits normal execution and returns control to the R terminal in case the contents of the ConContainer object are identified as corrupted.
 *
 * \return true in case the checks are Ok.
 *
 * \throw An std::range error if weight or from are not finite.
 *
 * \sa The unit test files, e.g., runit.Cpp.ConContainer.R, for usage examples.
 */

bool
ConContainer::validate()
{
  BEGIN_RCPP

  std::vector<int>::iterator itr;
  std::vector<int> vIds = getId();
  sort(vIds.begin(), vIds.end());
  itr = adjacent_find(vIds.begin(), vIds.end());
  if (itr != vIds.end())
    throw std::range_error("[C++ ConContainer::validate]: Error, duplicated Id.");
  Container<Con>::validate();
  return (true);
END_RCPP};

