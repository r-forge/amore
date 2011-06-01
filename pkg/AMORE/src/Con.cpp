/*
 * Con.cpp
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */
#ifndef INLINE_R

#include "Con.h"

#endif /* INLINE_R */


//=========================================================================================================

//! %from field accessor.
/*! This method allows access to the address stored in the private \ref from field (a pointer to a Neuron object).*
 * \return A pointer to the Neuron object referred to by the \ref from field.
 *
 *  \code
 *	//================
 *	//Usage example:
 *	//================
 *	// Data set up
 *		Con myCon;
 *		Neuron MyNeuron;
 *		Neuron * ptNeuron;
 *		MyNeuron.setId(1);
 *		myCon.setFromNeuron(&MyNeuron);
 *
 *	//Test
 *		ptNeuron = myCon.getFromNeuron();
 *		int result= ptNeuron->getId();
 *	// Now, ptNeuron is pointing at MyNeuron and, thus, result is equal to 1.
 * \endcode
 *
 * \sa getFromId and the unit test files, e.g., runit.Cpp.Con.R, for further examples.
 */
Neuron * Con::getFromNeuron	()   			{
	return(from);
}



//! %from field accessor.
/*! This method sets the value of the \ref from field with the address used as parameter.
 * \param f A pointer to the neuron that is to be inserted in the \ref from field.
 * \sa getFromNeuron and getFromId contain usage examples. For further examples see the unit test files, e.g., runit.Cpp.Con.R
 */
void Con::setFromNeuron	(Neuron * f)   	{
	from = f;
}



//! A getter of the Id of the Neuron pointed by the from field.
/*! This method gets the Id of the Neuron referred to by the \ref from field
 * \return The value of the Id (an integer).
 *
 *  \code
 *	//================
 *	//Usage example:
 *	//================
 *	// Data set up
 *		Con myCon;
 *		Neuron MyNeuron;
 *		MyNeuron.setId(16);
 *		myCon.setFromNeuron(&MyNeuron);
 *
 *	// Test
 * 		int result= myCon.getFromId();
 *	// After execution of the code shown above, MyNeuron::Id is set to the integer value 16 and, thus, result is equal to 16.
 * \endcode
 *
 * \sa getFromNeuron, setFromNeuron and the unit test files, e.g., runit.Cpp.Con.R, for further examples.
 */
int Con::getFromId () {
	return(from->getId() );
}




//! %weight field accessor.
/*! This method allows access to the value stored in the private field \ref weight
 * \return The value of \ref weight (double)
 *
 *  \code
 *	//================
 *	//Usage example:
 *	//================
 *	// Data set up
 *		Con myCon;
 *		Neuron MyNeuron;
 *		MyNeuron.setId(16);
 *		myCon.setFromNeuron(&MyNeuron);
 *		myCon.setWeight(12.4);
 *		double result1= myCon.getWeight();
 *	// Test
 *		myCon.setWeight(2.2);
 *		double result2= myCon.getWeight();
 *	// Now, result1 is equal to 12.4 and result2 is equal to 2.2.
 * \endcode
 *
 * \sa setWeight and the unit test files, e.g., runit.Cpp.Con.R, for further examples.
 */
double Con::getWeight () {
	return(weight);
}




//! %weight field accessor.
/*! This method sets the value of the \ref weight field.
 * \param w The new value (double) to be set in the \ref weight field.
 *
 * \code
 *  //================
 *  //Usage example:
 *  //================
 *  // Data set up
 *		Con myCon;
 *		Neuron n;
 *		n.setId(16);
 *		myCon.setFromNeuron(&n);
 *
 *	// Test
 *		myCon.setWeight(12.4);
 *		myCon.show();
 *	// Now, the output at the R terminal would show:
 *	//
 *	//  FROM=16		WEIGHT=12.4
 *	//
 * \endcode
 *
 * \sa getWeight and the unit test files (e.g. runit.Cpp.Con.R)
 */
void Con::setWeight	(double w) {
	weight = w;
}




//! Pretty print of the Con information
/*! This method outputs in the R terminal the contents of the Con fields.
 * \return true in case everything works without throwing an exception
 * \sa setWeight and the unit test files, e.g., runit.Cpp.Con.R, for usage examples.
 */
bool Con::show () {
	Rprintf("From:\t %d \t Weight= \t %lf \n", getFromId() , getWeight());
	return(true);
}




//! Object validator
/*! This method checks the object for internal coherence.
 *  A try / catch mechanism exits normal execution and returns control to the R terminal in case the contents of the Con object are identified as corrupted.
 * \return true in case the checks are Ok.
 * \throw An std::range error if weight or from are not finite.
 */
bool Con::validate () {
	BEGIN_RCPP
	if (! R_FINITE(getWeight()) )  		throw std::range_error("weight is not finite.");
	if (getFromId() == NA_INTEGER )		throw std::range_error("fromId is not finite.");
	return(true);
	END_RCPP
};


