/*
 * Neuron.cpp
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */


#include "Neuron.h"


	Neuron::Neuron() {};
	Neuron::Neuron(int Id) : Id(Id), outputValue(0.0) {};
	Neuron::Neuron(int Id, VecCon con) : Id(Id), con(con), outputValue(0.0) {} ;
	Neuron::~Neuron() {};


int Neuron::getId() {
	return Id;
}

void Neuron::setId(int id) {
	Id=id;
}


std::vector<NeuronPtr>	Neuron::getFrom		(){
	return con.getFrom();
}


std::vector<int>	Neuron::getConId	(){
	return con.getId();
}


std::vector<double>	Neuron::getWeight	(){
	return con.getWeight();
}


bool	Neuron::setFrom		(std::vector<NeuronPtr> vFrom){
	con.setFrom(vFrom);
}


bool	Neuron::setWeight	(std::vector<double> vWeight){
	con.setWeight(vWeight);
}

int	Neuron::numOfCons	(){
	return con.numOfCons();
}

bool	Neuron::show		(){
	Rprintf("\n------------------------\n");
	Rprintf("\n Id: ", getId());
	Rprintf("\n------------------------\n");
	con.show();
	Rprintf("\n------------------------\n");
	return true;

}


bool	Neuron::validate	(){
	BEGIN_RCPP
	if (getId() == NA_INTEGER )		throw std::range_error("[C++ Neuron::validate]: Error, Id is NA.");
	con.validate();
	return(TRUE);
	END_RCPP

}

