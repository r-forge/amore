/*
 * VecCon.h
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#ifndef VECMLPNEURON_H_
#define VECMLPNEURON_H_


//!  A vector of connections
/*!
 *   The VecCon class provides a simple class for a vector of connections. It's named after the R equivalent Reference Class.
 */

class vecMLPneuron: public vecNeuron {

public:

//									int	numOfCons();
//					std::vector<int>	getFromId();
								bool	buildAndAppend	( std::vector<int> IDS , std::vector<int> BIAS, VecCon VC );
//					std::vector<double>	getWeight	  	( );
//					std::vector<double>	getWeight	  	( std::vector<int> FROM );
//		std::vector<NeuronPtr>	getFromNeuron 	( );
//								void	setWeight		( std::vector<double> value);
//		�?						void	setWeight		( std::vector<double> value, std::vector<int> FROM);
//								void	setFromNeuron	( std::vector<NeuronPtr> FROM);
//								void 	erase 			( std::vector<int> FROM );
//								VecCon	select			( std::vector<int> FROM );
//								bool	validate		( );

};

#endif /* VECMLPNEURON_H_ */

