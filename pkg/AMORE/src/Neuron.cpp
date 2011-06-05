/*
 * Neuron.cpp
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */


#include "Neuron.h"


	Neuron::Neuron() {};
	Neuron::Neuron(int Id) : Id(Id), outputValue(0.0) {};
	Neuron::~Neuron() {};


int Neuron::getId() {
	return Id;
}

void Neuron::setId(int id) {
	Id=id;
}







