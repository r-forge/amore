/*
 * Con.cpp
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */

#include "Con.h"


//=========================================================================================================


//! Default Constructor
/*
 * Default constructor, from=NULL, weight=0
 */
	Con::Con() : weight(0) {
		from.reset();
	};


//! Constructor
/*
 * Constructor, from=f, weight=w
 * \param f A pointer to the neuron that is to be inserted in the \ref from field.
 * \param w The new value (double) to be set in the \ref weight field.
 */
	Con::Con(NeuronSharedPtr f , double w ) : from(f), weight(w) {};


	//! Constructor
	/*
	 * Constructor, from=f, weight=0
	 * \param f A pointer to the neuron that is to be inserted in the \ref from field.
	 */
		Con::Con(NeuronSharedPtr f ) : from(f), weight(0) {};



//! Default Destructor
	Con::~Con() {};



//! %from field accessor.
/*! This method allows access to the address stored in the private \ref from field (a pointer to a Neuron object).*
 * \return A pointer to the Neuron object referred to by the \ref from field.
 *
 *  \code
 *	//================
 *	//Usage example:
 *	//================
 *	// Data set up
 *	 		NeuronSharedPtr ptShNeuron ( new Neuron(1) ); 	// Neuron Id is set 1
 *			ConSharedPtr ptShCon( new Con(ptShNeuron) );  	// from points to ptShNeuron and weight is set to 0
 *	// Test
 *	  		ptShNeuron = ptShCon->getFromNeuron() ;
 *			int result = ptShNeuron->getId();
 *
 *	// Now, result is equal to 1.
 * \endcode
 *
 * \sa getFromId and the unit test files, e.g., runit.Cpp.Con.R, for further examples.
 */
NeuronSharedPtr Con::getFromNeuron	()   			{
	return(from.lock());
}



//! %from field accessor.
/*! This method sets the value of the \ref from field with the address used as parameter.
 * \param f A pointer to the neuron that is to be inserted in the \ref from field.
 *
 *  \code
 *	//================
 *	//Usage example:
 *	//================
 *	// Data set up
 * 			NeuronSharedPtr ptShNeuron ( new Neuron(1) ); 	// Neuron Id is set to 1
 *			ConSharedPtr ptShCon( new Con() );
 *			ptShCon->setFromNeuron( ptShNeuron );
 *	// Test
 *			ptShNeuron = ptShCon->getFromNeuron() ;
 *			int result = ptShNeuron->getId();
 *
 * 	// Now, result is equal to 1
 * 	\endcode
 *
 * \sa getFromNeuron and getFromId contain usage examples. For further examples see the unit test files, e.g., runit.Cpp.Con.R
 */
void Con::setFromNeuron	(NeuronSharedPtr f)   	{
	from=f;
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
 *			NeuronSharedPtr ptShNeuron ( new Neuron(16) ); 	// Neuron Id is set to 16
 *			ConSharedPtr ptShCon( new Con(ptShNeuron) );  	// from points to ptShNeuron and weight is set to 0
 *	// Test
 *	  		int result = ptShCon->getFromId();
 *
 *	// Now, result is equal to 16.
 * \endcode
 *
 * \sa getFromNeuron, setFromNeuron and the unit test files, e.g., runit.Cpp.Con.R, for further examples.
 */
int Con::getFromId () {
	NeuronSharedPtr ptNeuron(from);
	return(  ptNeuron->getId() );
}




//! %weight field accessor.
/*! This method allows access to the value stored in the private field \ref weight
 * \return The value of \ref weight (double)
 *
 * \code
 *  //================
 *  //Usage example:
 *  //================
 *  // Data set up
 *			std::vector<double> result;
 *			NeuronSharedPtr ptShNeuron ( new Neuron(16) ); 		// Neuron Id is set to 16
 *			ConSharedPtr ptShCon( new Con(ptShNeuron, 12.4) );  // from points to ptShNeuron and weight is set to 12.4
 *	// Test
 *			result.push_back( ptShCon->getWeight() );
 *			ptShCon->setWeight(2.2);
 *			result.push_back( ptShCon->getWeight() );
 *
 *	// Now, result is a numeric vector that contains the values 12.4 and 2.2 .
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
 *			std::vector<double> result;
 *			NeuronSharedPtr ptShNeuron ( new Neuron(16) ); 		// Neuron Id is set to 16
 *			ConSharedPtr ptShCon( new Con(ptShNeuron, 12.4) );  // from points to ptShNeuron and weight is set to 12.4
 *			result.push_back(ptShCon->getWeight());
 *	// Test
 *			ptShCon->setWeight(2.2);
 *			result.push_back(ptShCon->getWeight());
 *
 *	// Now, result is a numeric vector that contains the values 12.4 and 2.2 .
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


