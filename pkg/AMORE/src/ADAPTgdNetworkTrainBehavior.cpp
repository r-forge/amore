/*
 * ADAPTgdNetworkTrainBehavior.cpp
 *
 *  Created on: 29/07/2011
 *      Author: mcasl
 */

ADAPTgdNetworkTrainBehavior::train(Rcpp::List parameterList)
{

  Rcpp::NumericMatrix inputMatrix = as<Rcpp::NumericMatrix> (
      parameterList["inputMatrix"]);
  Rcpp::NumericMatrix targetMatrix = as<Rcpp::NumericMatrix> (
      parameterList["targetMatrix"]);
  int numberOfEpochs = as<int> (parameterList["numberOfEpochs"]);
  int showStep = as<int> (parameterList["showStep"]);


 // Rcpp::NumericMatrix outputMatrix(outputSize(), numericMatrix.ncol());
  std::vector<double>::iterator inputIterator(inputMatrix.begin());
  std::vector<double>::iterator targetIterator(targetMatrix.begin());


  int maxShows = (numberOfEpochs > showStep) ? numberOfEpochs / showStep : 1;
  for (int idShow = 0; idShow < maxShows; ++idShow)
    {
      for (int step = 0; step < showStep; ++step)
        {
          for (int idRow = 0; idRow < inputMatrix.ncol(); idRow++)
            {
              d_neuralNetwork->writeInput(inputIterator);
              d_neuralNetwork->singlePatternForwardAction();
              d_neuralNetwork->writeTarget(targetIterator);
              d_neuralNetwork->singlePatternBackwardAction();
            }
        }
    }
}
