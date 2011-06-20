/*
 * Container.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#include "dia/Container.h"

template<typename T>
  Container<T>::Container()
  {

  }

template<typename T>
  Container<T>::~Container()
  {
  }

template<typename T>
  boost::shared_ptr<IteratorInterface<T> >
  Container<T>::createIterator()
  {
    boost::shared_ptr< ContainerIterator<T> > containerIteratorPtr( new ContainerIterator<T> ());
    containerIteratorPtr->d_container = this;
    containerIteratorPtr->d_iterator = collection.begin();
    return containerIteratorPtr;
  }

//! Append a shared_ptr at the end of collection
/*!
 * Implements push_back for the Container class
 * \param TsharedPtr A shared_ptr pointer to be inserted at the end of collection
 *
 * \code
 *		//================
 *		//Usage example:
 *		//================
 *		// Data set up
 *			Neuron N1, N2, N3;
 *			Container<Con> conContainer;
 *			std::vector<ConPtr> vc;
 *			std::vector<int> result;
 *			N1.setId(10);
 *			N2.setId(20);
 *			N3.setId(30);
 *		// Test
 *			ConPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
 *			conContainer.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N2, 2.22) );		// create new Con and assign to ptCon
 *			conContainer.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
 *			conContainer.push_back(ptCon);				// push_back
 *
 *			vc = conContainer.load();
 *
 *			result.push_back(vc.at(0)->getId());
 * 			result.push_back(vc.at(1)->getId());
 *			result.push_back(vc.at(2)->getId());
 *	// After execution of this code, result contains a numeric vector with values 10, 20 and 30.
 * \endcode
 *
 * \sa C++ documentation for std::vector::push_back and the unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template<typename T>
  void
  Container<T>::push_back(T const & reference)
  {
    collection.push_back(reference);
  }

//! Pretty print of the Container<T>
/*! This method outputs in the R terminal the contents of Container::collection.
 * \return true in case everything works without throwing an exception
 *
 *
 *
 *
 *  * \code
 *		//================
 *		//Usage example:
 *		//================
 *		// Data set up
 * 			ContainerNeuronPtr	neuronContainerPtr( new Container<Neuron>() );
 *			ContainerConPtr	conContainerPtr( new Container<Con>() );
 *			ConPtr	ptC;
 *			NeuronPtr ptN;
 *			int ids[]= {10, 20, 30};
 *			double weights[] = {1.13, 2.22, 3.33 };
 *
 *			for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
 *				ptN.reset( new Neuron( ids[i] ) );
 *				neuronContainerPtr->push_back(ptN);
 *			}
 *
 *			for (int i=0; i<=2 ; i++) {				// and a vector with three connections
 *				ptC.reset( new Con( neuronContainerPtr->load().at(i), weights[i]) );
 *				conContainerPtr->push_back(ptC);
 *			}
 *
 *		// Test
 *			conContainerPtr->show() ;
 *
 *		// The output at the R terminal would display:
 *		//
 *		//	# From:	 10 	 Weight= 	 1.130000
 *		//	# From:	 20 	 Weight= 	 2.220000
 *		//	# From:	 30 	 Weight= 	 3.330000
 *		//
 *
 * \endcode
 *
 * \sa The unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template<typename T>
  void
  Container<T>::show()
  {

    for (typename std::vector<T>::iterator itr(collection.begin()); itr
        != collection.end(); ++itr)
      {
        itr->show();
      }

  }

//! Object validator
/*! This method checks the object for internal coherence.
 *  This method calls the validate method for each element in collection,
 * \sa The unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template<typename T>
  bool
  Container<T>::validate()
  {
    for (typename std::vector<T>::iterator itr(collection.begin()); itr
        != collection.end(); ++itr)
      {
        itr->validate();
      }
    return true;
  }
;

//! Returns the size or length of the vector
/*!
 *  This method returns the size of the vector.
 *  In the classes derived from Container<T> this is aliased as numOfCons, numOfNeurons and numOfLayers.
 * 	The unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template<typename T>
  size_type
  Container<T>::size()
  {
    return collection.size();
  }
;

template<typename T>
  bool
  Container<T>::empty()
  {
    return (collection.empty());
  }

template<typename T>
  void
  Container<T>::reserve(int n)
  {
    collection.reserve(n);
  }

template<typename T>
  void
  Container<T>::clear()
  {
    collection.clear();
  }

#if 0

template<typename T>
bool
Container<T>::buildAndAppend(std::vector<int>::iterator firstId,
    std::vector<int>::iterator lastId, ConContainer_iterator firstCon,
    ConContainer_iterator lastCon)

  {
    BEGIN_RCPP

    bool emptyIdContainer = (firstId==lastId);
    if (emptyIdContainer)
      {
        throw std::range_error(
            "[NeuronContainer::BuildAndAppend]: Error, Id container is empty");
      }

    reserve(size() + (lastId - firstId));
    NeuronPtr neuronPtr;
    while (firstId != lastId)
      {
        neuronPtr.reset(new Neuron(*firstId, firstCon, lastCon));
        push_back(neuronPtr);
        ++firstId;
      }
    return true;
    END_RCPP}

template<typename T>
bool
Container<T>::buildAndAppend(NeuronContainer_iterator firstNeuron,
    NeuronContainer_iterator lastNeuron)

  {
    BEGIN_RCPP

    bool emptyNeuronContainer = (firstNeuron==lastNeuron);
    if (emptyNeuronContainer)
      {
        throw std::range_error(
            "[ConContainer::BuildAndAppend]: Error, neuronContainer is empty");
      }

    reserve(size() + (lastNeuron - firstNeuron));
    ConPtr conPtr;
    while (firstNeuron != lastNeuron)
      {
        conPtr.reset(new Con(*firstNeuron++, 0.0 ));
        push_back(conPtr);
      }
    return true;
    END_RCPP}

template<typename T>
bool
Container<T>::buildAndAppend(NeuronContainer_iterator firstNeuron,
    NeuronContainer_iterator lastNeuron,
    std::vector<double>::iterator firstWeight,
    std::vector<double>::iterator lastWeight)

  {
    BEGIN_RCPP

    bool emptyNeuronContainer = (firstNeuron==lastNeuron);
    if (emptyNeuronContainer)
      {
        throw std::range_error(
            "[ConContainer::BuildAndAppend]: Error, neuronContainer is empty");
      }

    bool differentSize = (lastNeuron - firstNeuron) != (lastWeight
        - firstWeight);
    if (differentSize)
      {
        throw std::range_error(
            "[ConContainer::buildAndAppend]: Error, neuronContainer.size() != nWeights.size()");
      }

    reserve(size() + (lastNeuron - firstNeuron));
    ConPtr ptCon;
    while (firstNeuron != lastNeuron)
      {
        ptCon.reset(new Con(*firstNeuron++, *firstWeight++));
        push_back(ptCon);
      }
    return true;
    END_RCPP}

#endif
