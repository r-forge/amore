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
 * Default constructor, from.use_count==0L, weight=0
 */
Con::Con() :
  weight(0), from()
{
}
;

//! Constructor
/*
 * Constructor, from=f, weight=w
 * \param f A pointer to the neuron that is to be inserted in the \ref from field.
 * \param w The new value (double) to be set in the \ref weight field.
 */
Con::Con(NeuronPtr neuronPtr, double value) :
  from(neuronPtr), weight(value)
{
}


//! Constructor
/*
 * Constructor, from=f, weight=0
 * \param f A pointer to the neuron that is to be inserted in the \ref from field.
 */
Con::Con(NeuronPtr neuronPtr) :
  from(neuronPtr), weight(0)
{
}
;

//! Default Destructor
Con::~Con()
{
}
;

//! %from field accessor.
/*! This method allows access to the address stored in the private \ref from field (a pointer to a Neuron object).*
 * \return A pointer to the Neuron object referred to by the \ref from field.
 *
 *  \code
 *	//================
 *	//Usage example:
 *	//================
 *	// Data set up
 *	 		NeuronPtr ptShNeuron ( new Neuron(1) ); 	// Neuron Id is set 1
 *			ConPtr ptShCon( new Con(ptShNeuron) );  	// from points to ptShNeuron and weight is set to 0
 *	// Test
 *	  		ptShNeuron = ptShCon->getFrom() ;
 *			int result = ptShNeuron->getId();
 *
 *	// Now, result is equal to 1.
 * \endcode
 *
 * \sa getId and the unit test files, e.g., runit.Cpp.Con.R, for further examples.
 */
NeuronPtr
Con::getFrom()
{
  return (from.lock());
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
 * 			NeuronPtr ptShNeuron ( new Neuron(1) ); 	// Neuron Id is set to 1
 *			ConPtr ptShCon( new Con() );
 *			ptShCon->setFrom( ptShNeuron );
 *	// Test
 *			ptShNeuron = ptShCon->getFrom() ;
 *			int result = ptShNeuron->getId();
 *
 * 	// Now, result is equal to 1
 * 	\endcode
 *
 * \sa getFrom and getId contain usage examples. For further examples see the unit test files, e.g., runit.Cpp.Con.R
 */
void
Con::setFrom(NeuronPtr neuronPtr)
{
  from = neuronPtr;
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
 *			NeuronPtr ptShNeuron ( new Neuron(16) ); 	// Neuron Id is set to 16
 *			ConPtr ptShCon( new Con(ptShNeuron) );  	// from points to ptShNeuron and weight is set to 0
 *	// Test
 *	  		int result = ptShCon->getId();
 *
 *	// Now, result is equal to 16.
 * \endcode
 *
 * \sa getFrom, setFrom and the unit test files, e.g., runit.Cpp.Con.R, for further examples.
 */
int
Con::getId()
{
  if (from.use_count() > 0)
    {
      NeuronPtr neuronPtr(from);
      return (neuronPtr->getId());
    }
  else
    {
      return (NA_INTEGER);
    }
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
 *			NeuronPtr ptShNeuron ( new Neuron(16) ); 		// Neuron Id is set to 16
 *			ConPtr ptShCon( new Con(ptShNeuron, 12.4) );  // from points to ptShNeuron and weight is set to 12.4
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
double
Con::getWeight()
{
  return (weight);
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
 *			NeuronPtr ptShNeuron ( new Neuron(16) ); 		// Neuron Id is set to 16
 *			ConPtr ptShCon( new Con(ptShNeuron, 12.4) );  // from points to ptShNeuron and weight is set to 12.4
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
void
Con::setWeight(double value)
{
  weight = value;
}

//! Pretty print of the Con information
/*! This method outputs in the R terminal the contents of the Con fields.
 * \return true in case everything works without throwing an exception
 * \sa setWeight and the unit test files, e.g., runit.Cpp.Con.R, for usage examples.
 */
bool
Con::show()
{
  int id = getId();
  if (id == NA_INTEGER)
    {
      Rprintf("From: NA\t Invalid Connection \n");
    }
  else
    {
      Rprintf("From:\t %d \t Weight= \t %lf \n", id, getWeight());
    }
  return (true);
}

//! Object validator
/*! This method checks the object for internal coherence.
 *  A try / catch mechanism exits normal execution and returns control to the R terminal in case the contents of the Con object are identified as corrupted.
 * \return true in case the checks are Ok.
 * \throw An std::range error if weight or from are not finite.
 */
bool
Con::validate()
{
  BEGIN_RCPP
  if (! R_FINITE(getWeight()) ) throw std::range_error("weight is not finite.");
  if (getId() == NA_INTEGER)
    throw std::range_error("fromId is not finite.");
  return (true);
END_RCPP};

