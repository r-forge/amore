/*
 * MLPbehavior.cpp
 *
 *  Created on: 15/07/2011
 *      Author: mcasl
 */

#include "dia/PredictBehavior.h"
#include "dia/MLPbehavior.h"
//=========================================================================================================



void
MLPbehavior::predict()
{
       d_accumulator = 0.0;
       ConIteratorPtr  conIterator = d_nCons->createIterator();
       for ( conIterator->first(); !conIterator->isDone(); conIterator->next() ) {
          weight = conIterator->currentItem()->getWeight();
          input  = conIterator->currentItem()->getNeuron().getOutput();
          d_inducedLocalField +=  weight * input ;
       }
       d_output=d_activationFunction->f0();

}


void
MLPbehavior::show()
{
  Rprintf("\n bias: %lf", d_bias);
  Rprintf("\n output: %lf", d_output);
  Rprintf("\n------------------------\n");
 if (d_nCons->size() == 0)
   {
     Rprintf("\n No connections defined");
   }
 else
   {
     d_nCons->show();
   }
 Rprintf("\n------------------------\n");
}



void
MLPbehavior::setOutput(double output)
{
       d_output=output;
}


double
MLPbehavior::getOutput()
{
      return d_output;
}

