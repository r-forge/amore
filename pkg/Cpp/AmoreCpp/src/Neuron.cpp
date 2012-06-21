/*
 * Neuron.cpp
 *
 *  Created on: 20/07/2011
 *      Author: mcasl
 */

#include "package.h"
#include "classHeaders/NeuralFactory.h"
#include "classHeaders/Neuron.h"

Neuron::Neuron(NeuralFactory& neuralFactory) :
  d_Id(NA_INTEGER), d_inducedLocalField(0.0), d_output(0.0), d_target(0.0)
{
  d_nCons = neuralFactory.makeConContainer();
}



