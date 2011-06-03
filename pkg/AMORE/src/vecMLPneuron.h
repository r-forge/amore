/*
 * vecCon.h
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#ifndef VECMLPNEURON_H_
#define VECMLPNEURON_H_


//!  A vector of connections
/*!
 *   The vecCon class provides a simple class for a vector of connections. It's named after the R equivalent Reference Class.
 */

class vecMLPneuron: public vecNeuron {

public:

//									int	numOfCons();
//					std::vector<int>	getFromId();
								bool	buildAndAppend	( std::vector<int> IDS , std::vector<int> BIAS, vecCon VC );
//					std::vector<double>	getWeight	  	( );
//					std::vector<double>	getWeight	  	( std::vector<int> FROM );
//		std::vector<NeuronSharedPtr>	getFromNeuron 	( );
//								void	setWeight		( std::vector<double> value);
//		À?						void	setWeight		( std::vector<double> value, std::vector<int> FROM);
//								void	setFromNeuron	( std::vector<NeuronSharedPtr> FROM);
//								void 	erase 			( std::vector<int> FROM );
//								vecCon	select			( std::vector<int> FROM );
//								bool	validate		( );

};

#endif /* VECMLPNEURON_H_ */


