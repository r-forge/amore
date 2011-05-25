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


Neuron * Con::getFromNeuron	()   			{
	return(from);
}

void Con::setFromNeuron	(Neuron * f)   	{
	from = f;
}

int Con::getFromId () {
	return(from->getId() );
}

double Con::getWeight () {
	return(weight);
}

void Con::setWeight	(double w) {
	weight = w;
}

bool Con::show () {
	Rprintf("From:\t %d \t Weight= \t %lf \n", getFromId() , getWeight());
	return(true);
}

bool Con::validate () {
	BEGIN_RCPP
	if (! R_FINITE(weight) )  			throw std::range_error("weight is not finite.");
	if (from->getId() == NA_INTEGER )	throw std::range_error("fromId is not finite.");
	return(true);

	END_RCPP
};


