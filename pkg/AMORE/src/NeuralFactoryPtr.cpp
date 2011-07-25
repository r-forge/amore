/*
 * NeuralFactory.cpp
 *
 *  Created on: 23/07/2011
 *      Author: mcasl
 */

#include "classHeaders/NeuralFactory.h"

//=========================================================================================================


NeuralFactoryPtr
NeuralFactory::getInstance()
{
  return d_uniqueInstancePtr;
}
