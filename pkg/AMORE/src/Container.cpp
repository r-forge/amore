/*
 * Container.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */


//! Append a shared_ptr at the end of ldata
/*!
 * Implements push_back for the Container class
 * \param TsharedPtr A shared_ptr pointer to be inserted at the end of ldata
 *
 * \code
 *		//================
 *		//Usage example:
 *		//================
 *		// Data set up
 *			Neuron N1, N2, N3;
 *			Container<Con> MyVecCon;
 *			std::vector<ConPtr> vc;
 *			std::vector<int> result;
 *			N1.setId(10);
 *			N2.setId(20);
 *			N3.setId(30);
 *		// Test
 *			ConPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
 *			MyVecCon.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N2, 2.22) );		// create new Con and assign to ptCon
 *			MyVecCon.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
 *			MyVecCon.push_back(ptCon);				// push_back
 *
 *			vc = MyVecCon.getLdata();
 *
 *			result.push_back(vc.at(0)->getFromId());
 * 			result.push_back(vc.at(1)->getFromId());
 *			result.push_back(vc.at(2)->getFromId());
 *	// After execution of this code, result contains a numeric vector with values 10, 20 and 30.
 * \endcode
 *
 * \sa C++ documentation for std::vector::push_back and the unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template <typename T> void Container<T>::push_back( boost::shared_ptr<T> TsharedPtr) {
	ldata.push_back(TsharedPtr);
};



//! Pretty print of the Container<T>
/*! This method outputs in the R terminal the contents of Container::ldata.
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
 * 			ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
 *			ContainerConPtr	ptShvCon( new Container<Con>() );
 *			ConPtr	ptC;
 *			NeuronPtr ptN;
 *			int ids[]= {10, 20, 30};
 *			double weights[] = {1.13, 2.22, 3.33 };
 *
 *			for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
 *				ptN.reset( new Neuron( ids[i] ) );
 *				ptShvNeuron->push_back(ptN);
 *			}
 *
 *			for (int i=0; i<=2 ; i++) {				// and a vector with three connections
 *				ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );
 *				ptShvCon->push_back(ptC);
 *			}
 *
 *		// Test
 *			ptShvCon->show() ;
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
template <typename T> bool Container<T>::show() {

	// This is equivalent to:
	// for( auto x : ldata)	{ x.show(); }
	// Waiting for C++0x

	foreach (typename boost::shared_ptr<T> itr, ldata){
		itr->show();
	}
	return true;
};



//! Object validator
/*! This method checks the object for internal coherence.
 *  This method calls the validate method for each element in ldata,
 * \sa The unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template <typename T> bool Container<T>::validate() {
	foreach (typename boost::shared_ptr<T> itr, ldata){
		itr->validate();
	}
	return true;
};



//! Appends a Container<T> object
/*!
 * This method inserts the ldata field of a second object at the end of the ldata field of the calling object.
 * \param v The Container<T> object to be added to the current one
 * \sa The unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 *
 *
 * \code
 *	//================
 *	//Usage example:
 *	//================
 *	// Data set up
 *				std::vector<int> result;
 *				std::vector<ConPtr> vcA, vcB;
 *				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
 *				ContainerConPtr	ptShvConA( new Container<Con>() );
 *				ContainerConPtr	ptShvConB( new Container<Con>() );
 *				ConPtr	ptC;
 *				NeuronPtr ptN;
 *				int ids[]= {1, 2, 3, 4, 5, 6};
 *				double weights[] = {1.13, 2.22, 3.33, 5.6, 4.2, 3.6 };
 *				for (int i=0; i<=5 ; i++) {				// Let's create a vector with six neurons
 *					ptN.reset( new Neuron( ids[i] ) );
 *					ptShvNeuron->push_back(ptN);
 *				}
 *				for (int i=0; i<=2 ; i++) {				// A vector with three connections
 *					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );
 *					ptShvConA->push_back(ptC);
 *				}
 *				for (int i=3; i<=5 ; i++) {				// Another vector with three connections
 *					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );
 *					ptShvConB->push_back(ptC);
 *				}
 *	// Test
 *				ptShvConA->append(*ptShvConB);
 *				ptShvConA->validate();
 *				ptShvConA->show() ;
 *
 *	// After execution of the code above, the output at the R terminal would display:
 *	//
 *	//  From:	 1 	 Weight= 	 1.130000
 *	//	From:	 2 	 Weight= 	 2.220000
 *	//	From:	 3 	 Weight= 	 3.330000
 *	//	From:	 4 	 Weight= 	 5.600000
 *	//	From:	 5 	 Weight= 	 4.200000
 *	//	From:	 6 	 Weight= 	 3.600000
 *
 * \endcode
 *
 * \sa Container::setLdata , Container::push_back and the unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template <typename T> void Container<T>::append( Container<T> v) {
	ldata.reserve(ldata.size() + v.size());
	ldata.insert( ldata.end(), v.ldata.begin(), v.ldata.end() );
};



//! %ldata field accessor function
/*!
 *  This method allows access to the data stored in the \ref ldata field.
 * \return The ldata vector.
 *
 * \code
 * 	//================
 *	//Usage example:
 *	//================
 *		// Data set up
 *				std::vector<int> result;
 *				std::vector<ConPtr> vcA, vcB;
 *				ContainerNeuronPtr	ptShvNeuron( new Container<Neuron>() );
 *				ContainerConPtr	ptShvCon( new Container<Con>() );
 *				ConPtr	ptC;
 *				NeuronPtr ptN;
 *				int ids[]= {10, 20, 30};
 *				double weights[] = {1.13, 2.22, 3.33 };
 *				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
 *					ptN.reset( new Neuron( ids[i] ) );
 *					ptShvNeuron->push_back(ptN);
 *				}
 *				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
 *					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );
 *					vcA.push_back(ptC);
 *				}
 *		// Test
 *			ptShvCon->setLdata(vcA);
 *			vcB = ptShvCon->getLdata();
 *			for (int i=0; i<=2 ; i++) {					// get Ids. Container does not have getFromId defined
 *					result.push_back( vcB.at(i)->getFromId());
 *			}
 *
 * 		// Now, result is an integer vector with values 10, 20, 30.
 * \endcode
 *
 * \sa setLdata and the unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template <typename T> std::vector< boost::shared_ptr<T>  > Container<T>::getLdata() {
	return ldata;
};



//! %ldata field accessor function
/*!
 *  This method sets the value of the data stored in the \ref ldata field.
 * \param v The vector of smart pointers to be stored in the ldata field
 * \sa getLdata and the unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template <typename T> void Container<T>::setLdata(std::vector< boost::shared_ptr<T>  > v) {
	ldata=v;
};


//! Returns the size or length of the vector
/*!
 *  This method returns the size of the vector.
 *  In the classes derived from Container<T> this is aliased as numOfCons, numOfNeurons and numOfLayers.
 * 	The unit test files, e.g., runit.Cpp.Container.R, for usage examples.
 */
template <typename T> int Container<T>::size() {
	return ldata.size() ;
};


template <typename T> void Container<T>::reserve(int n) {
	 ldata.reserve(n) ;
};

