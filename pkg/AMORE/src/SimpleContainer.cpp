/*
 * Container.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#include "dia/Container.h"

template<typename T>
  SimpleContainer<T>::SimpleContainer()
  {

  }

template<typename T>
  SimpleContainer<T>::~SimpleContainer()
  {

  }
template<typename T>
  boost::shared_ptr<Iterator<T> >
  SimpleContainer<T>::createIterator()
  {
    boost::shared_ptr < SimpleContainerIterator<T> > iteratorPtr(  new SimpleContainerIterator<T> ());
    iteratorPtr->d_container = this;
    iteratorPtr->d_current= 0;
    return iteratorPtr;
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
  T
  SimpleContainer<T>::at(size_type element)
  {
  return d_collection.at(element);
  }


template<typename T>
  void
  SimpleContainer<T>::push_back(T const & reference)
  {
  d_collection.push_back(reference);
  }

//! Pretty print of the SimpleContainer<T>
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
  SimpleContainer<T>::show()
  {
      boost::shared_ptr< Iterator <T> >  itr = createIterator();
      for ( itr->first(); !itr->isDone(); itr->next() ) {
         itr->currentItem()->show();
      }
  }

//! Object validator
/*! This method checks the object for internal coherence.
 *  This method calls the validate method for each element in collection,
 * \sa The unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template<typename T>
  bool
  SimpleContainer<T>::validate()
  {
     boost::shared_ptr< Iterator <T> >  itr = createIterator();
     for ( itr->first(); !itr->isDone(); itr->next() ) {
        itr->currentItem()->validate();
     }
  return true;
  }
;

//! Returns the size or length of the vector
/*!
 *  This method returns the size of the vector.
 *  In the classes derived from SimpleContainer<T> this is aliased as numOfCons, numOfNeurons and numOfLayers.
 * 	The unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template<typename T>
  size_type
  SimpleContainer<T>::size()
  {
    return d_collection.size();
  }
;

template<typename T>
  bool
  SimpleContainer<T>::empty()
  {
    return (d_collection.empty());
  }

template<typename T>
  void
  SimpleContainer<T>::reserve(int n)
  {
  d_collection.reserve(n);
  }

template<typename T>
  void
  SimpleContainer<T>::clear()
  {
  d_collection.clear();
  }