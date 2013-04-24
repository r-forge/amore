/*
 * ADAPTgdNetworkTrainBehavior.cpp
 *
 *  Created on: 29/07/2011
 *      Author: mcasl
 */
#include "package.h"
#include "classHeaders/ADAPTgdNetworkTrainBehavior.h"
#include "classHeaders/NeuralNetwork.h"
#include "classHeaders/Neuron.h"
#include "classHeaders/Iterator.h"


ADAPTgdNetworkTrainBehavior::ADAPTgdNetworkTrainBehavior( NeuralNetworkPtr neuralNetworkPtr) :
  AdaptNetworkTrainBehavior(neuralNetworkPtr)
{
}

Rcpp::List
ADAPTgdNetworkTrainBehavior::train(Rcpp::List parameterList)
{

  double learningRate = as<double> (parameterList["learningRate"]);
  setLearningRate(learningRate);

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
  {
	  NeuronIteratorPtr inputNeuronIteratorPtr(d_neuralNetwork->getInputNeuronIterator());
	  NeuronIteratorPtr outputNeuronIteratorPtr(d_neuralNetwork->getOutputNeuronIterator());

	  for (int idShow = 0; idShow < maxShows; ++idShow)
		{
		  for (int step = 0; step < showStep; ++step)
			{
			  inputIterator  = inputBegin;
			  targetIterator = targetBegin;
			  for (int idRow = 0; idRow < inputMatrix.ncol(); idRow++)
				{
				  d_neuralNetwork->writeInput(inputIterator, inputNeuronIteratorPtr);
				  d_neuralNetwork->singlePatternForwardAction();
				  d_neuralNetwork->writeTarget(targetIterator, outputNeuronIteratorPtr);
				  d_neuralNetwork->singlePatternBackwardAction();
				}
			}

		  Rprintf("idShow: %d\n", idShow+1);
	//      inputIterator  = inputBegin;
	//    targetIterator = targetBegin;
	// TODO calculate error
	}
	  delete outputNeuronIteratorPtr;
	  delete inputNeuronIteratorPtr;
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
