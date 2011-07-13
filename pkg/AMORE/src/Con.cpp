/*
 * Con.cpp
 *
 *  Created on: 12/06/2011
 *      Author: mcasl
 */

#include "dia/Con.h"
#include "dia/Neuron.h"
//=========================================================================================================

//! Constructor
/*
 * Constructor, from=neuronPtr, weight=0
 * \param neuronPtr A pointer to the neuron that is to be inserted in the \ref from field.
 */
Con::Con(Neuron& neuron) :
  d_neuron( boost::ref(neuron) ), d_weight(0)
{
}

//! Constructor
/*
 * Constructor, from=neuronPtr, weight=weight
 * \param neuronPtr A pointer to the neuron that is to be inserted in the \ref from field.
 * \param weight The new value (double) to be set in the \ref weight field.
 */
Con::Con(Neuron& neuron, double weight) :
  d_neuron(boost::ref(neuron)), d_weight(weight)
{
}

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
Neuron&
Con::getNeuron()
{
  return d_neuron;
}


void
Con::setNeuron(Neuron& neuron)
{
  d_neuron=boost::ref(neuron);
}

//! A getter of the Id of the Neuron pointed by the from field.
/*! This method gets the Id of the Neuron referred to by the \ref from field
 * \return The value of the Id (an integer).
 *
 *  \code
 *      //================
 *      //Usage example:
 *      //================
 *      // Data set up
 *                      NeuronPtr ptShNeuron ( new Neuron(16) );        // Neuron Id is set to 16
 *                      ConPtr ptShCon( new Con(ptShNeuron) );          // from points to ptShNeuron and weight is set to 0
 *      // Test
 *                      int result = ptShCon->getId();
 *
 *      // Now, result is equal to 16.
 * \endcode
 *
 * \sa getFrom, setFrom and the unit test files, e.g., runit.Cpp.Con.R, for further examples.
 */
int
Con::Id()
{
  return d_neuron.get().Id();
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
double&
Con::getWeight()
{
  return d_weight;
}


void
Con::setWeight(double weight)
{
  d_weight=weight;
}


//! Pretty print of the Con information
/*! This method outputs in the R terminal the contents of the Con fields.
 * \return true in case everything works without throwing an exception
 * \sa setWeight and the unit test files, e.g., runit.Cpp.Con.R, for usage examples.
 */
void
Con::show()
{
  int id = Id();
  if (id == NA_INTEGER)
    {
      Rprintf("From: NA\t Invalid Connection \n");
    }
  else
    {
      Rprintf("From:\t %d \t Weight= \t %lf \n", id, d_weight);
    }
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
  if (! R_FINITE(weight()) ) throw std::range_error("weight is not finite.");
  if (Id() == NA_INTEGER)
    throw std::range_error("fromId is not finite.");
  return (true);
END_RCPP}

