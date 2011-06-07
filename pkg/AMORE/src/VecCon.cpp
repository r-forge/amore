/*
 * VecCon.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

//! Size of the VecCon object
/*!
 * This function returns the size of the VecCon object, that is to say, the number of Con objects it contains.
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
 *				VecConPtr	ptShvCon( new VecCon() );
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
 *					result.push_back(ptShvCon->numOfCons());		// Append numOfCons to result, create new Con and push_back into MyVecCon
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
VecCon::numOfCons()
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
 *			VecCon MyVecCon;
 *			std::vector<int> result;
 *
 *			N1.setId(10);
 *			N2.setId(20);
 *			N3.setId(30);
 *
 *			ConPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
 *			MyVecCon.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N2, 2.22) );		// create new Con and assign to ptCon
 *			MyVecCon.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
 *			MyVecCon.push_back(ptCon);				// push_back
 *
 *	// Test
 *			MyVecCon.show() ;
 *			MyVecCon.validate();
 *			result=MyVecCon.getId();
 *
 *	// Now result is a vector that contains the values 10, 20 and 30.
 * \endcode
 *
 * \sa getWeight and the unit test files, e.g. runit.Cpp.VecCon.R, for further examples.
 */
std::vector<int>
VecCon::getId()
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
 * This function provides a convenient way of populating a VecCon object by building and apending Con objects to collection.
 * \param FROM  A vector of smart pointers to the neurons to be used in the Con::from fields
 * \param WEIGHT A vector of values to be set in the Con::weight fields
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<int> result;
 *		VecCon MyVecCon;
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
 *		MyVecCon.buildAndAppend(vNeuron, vWeight);
 *
 *		result=MyVecCon.getId();
 *
 *	// Now result is a vector that contains the values 11, 22 and 32.
 * \endcode
 *
 * \sa append and the unit test files, e.g. runit.Cpp.VecCon.R, for further examples.
 */
bool
VecCon::buildAndAppend(std::vector<NeuronPtr> vFrom,
    std::vector<double> vWeight)
{
  BEGIN_RCPP
  if (vFrom.empty())
    { throw std::range_error("[VecCon::append]: Error, vFrom is empty");}
  if (vFrom.size() != vWeight.size())
    {
      throw std::range_error(
          "[VecCon::buildAndAppend]: Error, vFrom.size() != vWeight.size()");
    }
  reserve(size() + vFrom.size());
  ConPtr ptCon;
  std::vector<double>::iterator itrWeight = vWeight.begin();

  foreach (NeuronPtr itrFrom, vFrom)
    {
      ptCon.reset( new Con( itrFrom, *itrWeight) );
      push_back(ptCon);
      itrWeight++;
    }
  return true;
END_RCPP}

//! Getter of the weight field of the Con objects related to VecCon
/*!
 * This function provides a convenient way of getting the values of
 * the weight field of those Con object pointed to by the smart pointer
 * stored in the VecCon object.
 * \return A numeric (double) vector with the weights
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<double> result;
 *		VecCon MyVecCon;
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
 *		MyVecCon.buildAndAppend(vNeuron, vWeight);
 *
 *		result=MyVecCon.getWeight();
 *
 *	// Now result is a vector that contains the values 12.3, 1.2 and 2.1 .
 * \endcode
 *
 * \sa getId and the unit test files, e.g. runit.Cpp.VecCon.R, for further examples.
 */
std::vector<double>
VecCon::getWeight()
{
  std::vector<double> result;
  result.reserve(numOfCons());
  foreach (ConPtr itr, *this)
    {
      result.push_back( itr->getWeight() );
    }

  return result;
}

//! Setter of the weight field of the Con objects related to VecCon
/*!
 * This function provides a convenient way of setting the values of the weight field of those Con objects pointed to by the smart pointer stored in the VecCon object.
 *
 * \param vWeight A numeric (double) vector with the weights to be set in the Con objects contained in the VecCon object.
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
 *			VecCon MyVecCon;
 *			std::vector<NeuronPtr> vNeuron;
 *			std::vector<double> vWeight;
 *			NeuronPtr ptNeuron;
 *
 *			for (int i=0; i<=2; i++) {
 *			ptNeuron.reset( new Neuron(ids[1]) );
 *	 		vNeuron.push_back(ptNeuron);
 *			vWeight.push_back(0);					// weights are set to 0
 *			}
 *			MyVecCon.buildAndAppend(vNeuron, vWeight);
 *			MyVecCon.show();
 *
 *			for (int i=0; i<=2; i++) {
 *				vWeight.at(i)=weights[i];
 *			}
 *	// Test
 *			MyVecCon.setWeight(vWeight);			// weights are set to 12.3, 1.2 and 2.1
 *			result=MyVecCon.getWeight();
 *
 *	// Now result is a vector that contains the values 12.3, 1.2 and 2.1 .
 *
 * \endcode
 *
 * \sa getWeight and the unit test files, e.g. runit.Cpp.VecCon.R, for further examples.
 */
bool
VecCon::setWeight(std::vector<double> vWeight)
{
  BEGIN_RCPP
  if (vWeight.empty())
    { throw std::range_error("[ C++ VecCon::setWeight]: Error, vWeight is empty");}
  if (vWeight.size() != size())
    {
      throw std::range_error(
          "[C++ VecCon::setWeight]: Error, vWeight.size() != collection.size()");
    }
  std::vector<double>::iterator itrWeight = vWeight.begin();
  foreach (ConPtr itr, *this)
    {
      itr->setWeight( *itrWeight );
      itrWeight++;
    }
  return true;
END_RCPP}

//! Getter of the from field of the Con objects related to VecCon
/*!
 * This function provides a convenient way of getting the values of the weight field of those Con object pointed to by the smart pointer stored in the VecCon object.
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
 *		VecCon MyVecCon;
 *		std::vector<NeuronPtr> vNeuron;
 *		std::vector<double> vWeight;
 *		NeuronPtr ptNeuron;
 *
 *			for (int i=0; i<=2; i++) {
 *				ptNeuron.reset( new Neuron(ids[i]) );
 *				vNeuron.push_back(ptNeuron);
 *				vWeight.push_back(weights[i]);
 *			}
 *			MyVecCon.buildAndAppend(vNeuron, vWeight);
 *		// Test
 *			vNeuron=MyVecCon.getFrom();
 *			for (int i=0; i<=2; i++) {
 *				result.push_back(vNeuron.at(i)->getId());
 *			}
 *
 *	// Now result is a vector that contains the values 1, 2 and 3 .
 *
 * \endcode
 *
 * \sa getId and the unit test files, e.g. runit.Cpp.VecCon.R, for further examples.
 */
std::vector<NeuronPtr>
VecCon::getFrom()
{
  std::vector < NeuronPtr > result;
  result.reserve(numOfCons());
  foreach(ConPtr itr, *this)
    {
      result.push_back( itr->getFrom() );
    }
  return result;
}

//! Setter of the from fields of the Con objects related to VecCon
/*!
 * This function provides a convenient way of getting the values of the weight field of those Con object pointed to by the smart pointer stored in the VecCon object.
 *
 * \param vFrom An std::vector<NeuronPtr> with the pointers to be set in the from fields of the VecCon object.
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
 *		VecConPtr	ptShvCon( new VecCon() );
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
 * \sa getFrom and the unit test files, e.g. runit.Cpp.VecCon.R, for further examples.
 */
bool
VecCon::setFrom(std::vector<NeuronPtr> vFrom)
{
  BEGIN_RCPP
  if (vFrom.empty())
    { throw std::range_error("[ C++ VecCon::setFrom]: Error, w is empty");}
  if (vFrom.size() != size())
    {
      throw std::range_error(
          "[C++ VecCon::setFrom]: Error, w.size() != collection.size()");
    }
  std::vector<NeuronPtr>::iterator itrFrom = vFrom.begin();
  foreach(ConPtr itr , *this)
    {
      itr->setFrom( *itrFrom );
      itrFrom++;
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
 * Provides a convenient way of removing some Con objects from the collection field of the VecCon object.
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
 *			VecConPtr	ptShvCon( new VecCon() );
 *			VecConPtr vErased;
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
 * \sa select and the unit test files, e.g. runit.Cpp.VecCon.R, for further examples.
 *
 */
void
VecCon::erase(std::vector<int> vFrom)
{
  std::vector<ConPtr>::iterator itr;
  sort(begin(), end(), CompareId());
  sort(vFrom.begin(), vFrom.end());
  itr = set_difference(begin(), end(), vFrom.begin(), vFrom.end(), begin(),
      CompareId());
  resize(itr - begin());
}

//! Selects the specified elements from the vecCom object.
/*!
 * Provides a convenient way of selecting some Con objects from the collection field of the VecCon object.
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
 *		VecConPtr	ptShvCon( new VecCon() );
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
 *		VecConPtr  vSelect (  ptShvCon->select(toSelect)  );
 *		result=vSelect->getId();
 *
 *		// Now, result is a numeric vector with the values 1, 3, 5 and 7.
 *
 *		\endcode
 *
 *		\sa erase and the unit test files, e.g. runit.Cpp.VecCon.R, for further examples.
 */
VecConPtr
VecCon::select(std::vector<int> vFrom)
{
  VecConPtr result(new VecCon);
  result->reserve(size());
  sort(begin(), end(), CompareId());
  sort(vFrom.begin(), vFrom.end());
  set_intersection(begin(), end(), vFrom.begin(), vFrom.end(),
      back_inserter(result->collection), CompareId());

  return result;
}

//! Getter of the weights of the specified elements from the vecCom object.
/*!
 * Provides a convenient way of getting the weights of some Con objects from the collection field of the VecCon object.
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
 *		VecConPtr	ptShvCon( new VecCon() );
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
 *	\sa setWeigth and the unit test files, e.g. runit.Cpp.VecCon.R, for further examples.
 *
 */
std::vector<double>
VecCon::getWeight(std::vector<int> vFrom)
{
  return select(vFrom)->getWeight();
}

//! Setter of the weights of the specified elements from the VecCon object.
/*!
 * Provides a convenient way of setting the weights of some Con objects from the collection field of the VecCon object.
 *
 * \param vWeight A numeric (double) vector with the weights to be set in the Con objects contained in the VecCon object.
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
 *			VecConPtr	ptShvCon( new VecCon() );
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
 *	\sa getWeigth and the unit test files, e.g. runit.Cpp.VecCon.R, for further examples.
 *
 */
bool
VecCon::setWeight(std::vector<double> vWeight, std::vector<int> vFrom)
{
BEGIN_RCPP return select(vFrom)->setWeight(vWeight);
END_RCPP
}

//! Object validator
/*! This method checks the object for internal coherence.
 *  A try / catch mechanism exits normal execution and returns control to the R terminal in case the contents of the VecCon object are identified as corrupted.
 *
 * \return true in case the checks are Ok.
 *
 * \throw An std::range error if weight or from are not finite.
 *
 * \sa The unit test files, e.g., runit.Cpp.VecCon.R, for usage examples.
 */

bool
VecCon::validate()
{
  BEGIN_RCPP

  std::vector<int>::iterator itr;

  std::vector<int> vIds = getId();
  sort(vIds.begin(), vIds.end());
  itr = adjacent_find(vIds.begin(), vIds.end());
  if (itr != vIds.end())
    throw std::range_error("[C++ VecCon::validate]: Error, duplicated Id.");
  Container<Con>::validate();
  return (true);
END_RCPP};

