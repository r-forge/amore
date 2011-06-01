/*
 * vecAMORE.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */


//! A method to append one element at the end of ldata
/*!
 * This function implements the std:vector member push_back for the vecAMORE<T> class
 * \param T element The element to be inserted at the end of ldata
 *
 * \code
		//================
		//Usage example:
		//================
		Con Con1, Con2, Con3, Con4, Con5, Con6;
		Neuron N1, N2, N3, N4, N5, N6;
		vecAMORE<Con> vc1, vc2;
		std::vector<int> result;

		N1.setId(10);
		N2.setId(20);
		N3.setId(30);
		N4.setId(40);
		N5.setId(50);
		N6.setId(60);

		Con1.setFromNeuron(&N1);
		Con2.setFromNeuron(&N2);
		Con3.setFromNeuron(&N3);
		Con4.setFromNeuron(&N4);
		Con5.setFromNeuron(&N5);
		Con6.setFromNeuron(&N6);

		Con1.setWeight(1.01);
		Con2.setWeight(22.02);
		Con3.setWeight(333.03);
		Con4.setWeight(5.4);
		Con5.setWeight(2.22);
		Con6.setWeight(33.03);

		vc1.push_back(Con1);
		vc1.push_back(Con2);
		vc1.push_back(Con3);
		vc2.push_back(Con4);
		vc2.push_back(Con5);
		vc2.push_back(Con6);

		Rprintf("vc1 contents:");
		vc1.show() ;
		Rprintf("vc2 contents:");
		vc2.show() ;

		vc1.join(vc2);
		Rprintf("vc2 contents:");
		vc1.show() ;
		vc1.validate();

		for(std::vector<Con>::iterator itr = (vc1.getLdata()).begin();   itr != (vc1.getLdata()).end();   itr++)	{ result.push_back(itr->getFromId()); }
		return wrap(result);
 * \endcode
 *
 * After execution of this code, return contains a numeric vector with values 10, 20, 30, 40, 50 and 60.
 *
 * \sa C++ documentation for std::vector::push_back and the unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */
template <typename T> void vecAMORE<T>::push_back( boost::shared_ptr<T> element) {
	this->ldata.push_back(element);
};



//! Pretty print of the vecAMORE<T>
/*! This method outputs in the R terminal the contents of the vecAMORE<T> fields.
 * \return true in case everything works without throwing an exception
 * \sa The unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */
template <typename T> bool vecAMORE<T>::show() {
	//
	// This is equivalent to:
	// for( auto x : ldata)	{ x.show(); }
	// Waiting for C++0x
	//
	for(typename std::vector< boost::shared_ptr<T>  >::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{ (*itr)->show(); }


	return true;
};




//! Object validator
/*! This method checks the object for internal coherence.
 *  This method calls the validate method for each element of the ldata std::vector<T>,
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
 */


template <typename T> void vecAMORE<T>::append( vecAMORE<T> v) {
	ldata.reserve(ldata.size() + v.size());
	ldata.insert( ldata.end(), v.ldata.begin(), v.ldata.end() );
};


//! %ldata field accessor function
/*!
 *  This method allows access to the data stored in the \ref ldata field (an std::vector<T> object).
 * \return The ldata vector.
 * \code
 * 	//================
 *	//Usage example:
 *	//================
 *
 * 	// Data set up
 *		Con Con1, Con2, Con3;
 *		Neuron N1, N2, N3;
 *		vecAMORE<Con> MyvecCon;
 *		std::vector<int> result;
 *		std::vector<Con> vc;
 *
 *		N1.setId(10);
 *		N2.setId(20);
 *		N3.setId(30);
 *
 *		Con1.setFromNeuron(&N1);
 *		Con2.setFromNeuron(&N2);
 *		Con3.setFromNeuron(&N3);
 *
 *		Con1.setWeight(1.01);
 *		Con2.setWeight(22.02);
 *		Con3.setWeight(333.03);
 *
 *	// Test
 *
 *		MyvecCon.push_back(Con1);
 *		MyvecCon.push_back(Con2);
 *		MyvecCon.push_back(Con3);
 *		MyvecCon.show();
 *		MyvecCon.validate();
 *
 *		vc = MyvecCon.getLdata();
 *
 *		result.push_back(vc.at(0).getFromId());
 *		result.push_back(vc.at(1).getFromId());
 *		result.push_back(vc.at(2).getFromId());
 *		return wrap(result);
 * \endcode
 *
 * After execution of the code shown above, vc is a vector containing Con1, Con2 and Con3 and, thus, result is an integer vector with values 10, 20, 30.
 *
 * \sa setLdata and the unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */


template <typename T> std::vector< boost::shared_ptr<T>  > vecAMORE<T>::getLdata() {
	return ldata;
};



//! %ldata field accessor function
/*!
 *  This method sets the value of the data stored in the \ref ldata field (an std::vector<T> object).
 * \param v The std::vector<T> object to be stored in the ldata field
 * \sa getLdata and the unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */

template <typename T> void vecAMORE<T>::setLdata(std::vector< boost::shared_ptr<T>  > v) {
	ldata=v;
};


//! Returns the size or length of the vector
/*!
 *  This method returns the size of the vector.
 *  In the vecAMORE<T> derived classes this is aliased as numOfCons, numOfNeurons and numOfLayers.
 * 	The unit test files, e.g., runit.Cpp.vecAMORE.R, for usage examples.
 */

template <typename T> int vecAMORE<T>::size() {
	return ldata.size() ;
};


