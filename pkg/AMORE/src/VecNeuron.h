/*
 *  VecNeuron.h
 *
 *  Created on: 03/06/2011
 *  Author: mcasl
 *
 */

#ifndef VECNEURON_H_
#define VECNEURON_H_


//!  A vector of neurons
/*!
 *   The vecNeuron class provides a simple class for a vector of neurons. It's named after the R equivalent Reference Class.
 */

class VecNeuron: public Container<Neuron> {

public:
										VecNeuron();
										VecNeuron(std::vector<NeuronPtr> vNeuron);
										~VecNeuron();
									int	numOfNeurons( );
//										numOfCons	( );
//										getConId	( );
//					std::vector<int>	getId		( );
//										setId		( );
//										getFrom		( );
//										is.regular	( );
//					std::vector<double>	getWeight	( );
//					std::vector<double>	getWeight	( std::vector<int> FROM );
//				std::vector<NeuronPtr>	getFrom		( );
//								void	setWeight	( std::vector<double> value);
//								void	setWeight	( std::vector<double> value, std::vector<int> FROM);
//								void	setFrom		( std::vector<NeuronPtr> FROM);
//								void 	erase		( std::vector<int> FROM );
//								VecCon	select		( std::vector<int> FROM );
//								bool	validate	( );
};

#endif /* VECNEURON_H_ */


