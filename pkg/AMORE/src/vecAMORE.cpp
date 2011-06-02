/*
 * vecAMORE.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */


//! Append a shared_ptr at the end of ldata
/*!
 * Implements push_back for the vecAMORE class
 * \param TsharedPtr A shared_ptr pointer to be inserted at the end of ldata
 *
 * \code
 *		//================
 *		//Usage example:
 *		//================
 *		// Data set up
 *			Neuron N1, N2, N3;
 *			vecAMORE<Con> MyvecCon;
 *			std::vector<ConSharedPtr> vc;
 *			std::vector<int> result;
 *			N1.setId(10);
 *			N2.setId(20);
 *			N3.setId(30);
 *		// Test
 *			ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
 *			MyvecCon.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N2, 2.22) );		// create new Con and assign to ptCon
 *			MyvecCon.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
 *			MyvecCon.push_back(ptCon);				// push_back
 *
 *			vc = MyvecCon.getLdata();
 *
 *			result.push_back(vc.at(0)->getFromId());
 * 			result.push_back(vc.at(1)->getFromId());
 *			result.push_back(vc.at(2)->getFromId());
 * \endcode
 *
 * After execution of this code, result contains a numeric vector with values 10, 20 and 30.
 *
 * \sa C++ documentation for std::vector::push_back and the unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */
template <typename T> void vecAMORE<T>::push_back( boost::shared_ptr<T> TsharedPtr) {
	this->ldata.push_back(TsharedPtr);
};



//! Pretty print of the vecAMORE<T>
/*! This method outputs in the R terminal the contents of vecAMORE::ldata.
 * \return true in case everything works without throwing an exception
 * \sa The unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */
template <typename T> bool vecAMORE<T>::show() {
	// This is equivalent to:
	// for( auto x : ldata)	{ x.show(); }
	// Waiting for C++0x
	for(typename std::vector< boost::shared_ptr<T>  >::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{ (*itr)->show(); }
	return true;
};



//! Object validator
/*! This method checks the object for internal coherence.
 *  This method calls the validate method for each element in ldata,
 * \sa The unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */
template <typename T> bool vecAMORE<T>::validate() {
	for(typename std::vector< boost::shared_ptr<T>  >::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{ (*itr)->validate(); }
	return true;
};



//! Appends a vecAMORE<T> object
/*!
 * This method inserts the ldata field of a second object at the end of the ldata field of the calling object.
 * \param v The vecAMORE<T> object to be added to the current one
 * \sa The unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 *
 *
 * \code
 *	//================
 *	//Usage example:
 *	//================
 *
 * 	// Data set up
 *		Neuron N1, N2, N3, N4, N5, N6;
 *		vecAMORE<Con> vcA, vcB;
 *		std::vector<int> result;
 *
 *		N1.setId(10);
 *		N2.setId(20);
 *		N3.setId(30);
 *		N4.setId(40);
 *		N5.setId(50);
 *		N6.setId(60);
 *
 *	// Test
 *		ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// Create and store in vcA three Cons
 *		vcA.push_back(ptCon);
 *		ptCon.reset( new Con(&N2, 2.22) );
 *		vcA.push_back(ptCon);
 *		ptCon.reset(  new Con(&N3, 3.33) );
 *		vcA.push_back(ptCon);
 *
 *		ptCon.reset( new Con(&N4, 1.13) );  	// Create and store in vcB three more Cons
 *		vcB.push_back(ptCon);
 *		ptCon.reset( new Con(&N5, 2.22) );
 *		vcB.push_back(ptCon);
 *		ptCon.reset(  new Con(&N6, 3.33) );
 *		vcB.push_back(ptCon);
 *
 *	// Append test
 *		vcA.append(vcB);
 *		vcA.validate();
 *		vcA.show() ;
 *
 *	// After execution of the code above, the output at the R terminal would display:
 *	// From:	 10 	 Weight= 	 1.130000
 *	// From:	 20 	 Weight= 	 2.220000
 *	// From:	 30 	 Weight= 	 3.330000
 *	// From:	 40 	 Weight= 	 1.130000
 *	// From:	 50 	 Weight= 	 2.220000
 *	// From:	 60 	 Weight= 	 3.330000
 * \endcode
 *
 * \sa vecAMORE::setLdata , vecAMORE::push_back and the unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */
template <typename T> void vecAMORE<T>::append( vecAMORE<T> v) {
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
 *			Neuron N1, N2, N3;
 *			vecAMORE<Con> MyvecCon;
 *			std::vector<int> result;
 *			std::vector<ConSharedPtr> vcA, vcB;
 *
 *			N1.setId(10);
 *			N2.setId(20);
 *			N3.setId(30);
 *
 *		// Test
 *			ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
 *			vcA.push_back(ptCon);						// push_back
 *			ptCon.reset( new Con(&N2, 2.22) );			// create new Con and assign to ptCon
 *			vcA.push_back(ptCon);						// push_back
 *			ptCon.reset(  new Con(&N3, 3.33) );			// create new Con and assign to ptCon
 *			vcA.push_back(ptCon);						// push_back
 *
 *			MyvecCon.setLdata(vcA);
 *			vcB = MyvecCon.getLdata();
 *
 *			result.push_back(vcB.at(0)->getFromId());
 *			result.push_back(vcB.at(1)->getFromId());
 *			result.push_back(vcB.at(2)->getFromId());
 * 		// After execution of the code shown above, result is an integer vector with values 10, 20, 30.
 * \endcode
 *
 * \sa setLdata and the unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */
template <typename T> std::vector< boost::shared_ptr<T>  > vecAMORE<T>::getLdata() {
	return ldata;
};



//! %ldata field accessor function
/*!
 *  This method sets the value of the data stored in the \ref ldata field.
 * \param v The vector of smart pointers to be stored in the ldata field
 * \sa getLdata and the unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */
template <typename T> void vecAMORE<T>::setLdata(std::vector< boost::shared_ptr<T>  > v) {
	ldata=v;
};


//! Returns the size or length of the vector
/*!
 *  This method returns the size of the vector.
 *  In the classes derived from vecAMORE<T> this is aliased as numOfCons, numOfNeurons and numOfLayers.
 * 	The unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */
template <typename T> int vecAMORE<T>::size() {
	return ldata.size() ;
};


