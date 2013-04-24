/*
 * Neuron.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/Container.h"
#include "classHeaders/ActivationFunction.h"

Neuron::Neuron(NeuralFactory& neuralFactory) :
  d_Id(NA_INTEGER), d_inducedLocalField(0.0), d_output(0.0), d_target(0.0)
{
  d_nCons = neuralFactory.makeConContainer();
  d_conIterator = d_nCons->createIterator();
}

Neuron::~Neuron()
{
	delete d_nCons;
	delete d_predictBehavior;
	delete d_activationFunction;
	delete d_neuronTrainBehavior; // TODO hacer este destructor
	d_nCons=NULL;
	d_predictBehavior=NULL;
	d_activationFunction=NULL;
	d_neuronTrainBehavior=NULL;
}


