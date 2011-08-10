/*
 * ADAPTgdNetworkTrainBehavior.cpp
 *
 *  Created on: 29/07/2011
 *      Author: mcasl
 */
#include "package.h"
#include "classHeaders/ADAPTgdNetworkTrainBehavior.h"

ADAPTgdNetworkTrainBehavior::ADAPTgdNetworkTrainBehavior( NeuralNetworkPtr neuralNetworkPtr) :
  AdaptNetworkTrainBehavior(neuralNetworkPtr)
{
}

Rcpp::List
ADAPTgdNetworkTrainBehavior::train(Rcpp::List parameterList)
{

  Rcpp::NumericMatrix inputMatrix = as<Rcpp::NumericMatrix> (parameterList["inputMatrix"]);
  Rcpp::NumericMatrix targetMatrix = as<Rcpp::NumericMatrix> (parameterList["targetMatrix"]);
  std::vector<double>::iterator inputIterator(inputMatrix.begin());
  std::vector<double>::iterator targetIterator(targetMatrix.begin());
  std::vector<double>::iterator inputBegin(inputMatrix.begin());
  std::vector<double>::iterator targetBegin(targetMatrix.begin());

  int numberOfEpochs = as<int> (parameterList["numberOfEpochs"]);
  int showStep = as<int> (parameterList["showStep"]);

  // Rcpp::NumericMatrix outputMatrix(outputSize(), numericMatrix.ncol());

  int maxShows = (numberOfEpochs > showStep) ? numberOfEpochs / showStep : 1;
  for (int idShow = 0; idShow < maxShows; ++idShow)
    {
      for (int step = 0; step < showStep; ++step)
        {
          inputIterator  = inputBegin;
          targetIterator = targetBegin;
          for (int idRow = 0; idRow < inputMatrix.ncol(); idRow++)
            {
              writeInput(inputIterator);
              singlePatternForwardAction();
              writeTarget(targetIterator);
              singlePatternBackwardAction();
            }
        }
//      inputIterator  = inputBegin;
//    targetIterator = targetBegin;
// TODO calculate error
    }

  Rcpp::List result;
  result["error"]=0.0; //TODO change

  return result;
}


std::string
ADAPTgdNetworkTrainBehavior::getName()
{
  std::string name("ADAPTgdNetworkTrainBehavior");
  return name;
}
