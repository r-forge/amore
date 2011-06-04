/*
 *  vecCon.h
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#ifndef VECCON_H_
#define VECCON_H_


//!  A vector of connections
/*!
 *   The vecCon class provides a simple class for a vector of connections. It's named after the R equivalent Reference Class.
 */

class vecCon: public vecAMORE<Con> {

public:

									int	numOfCons();
					std::vector<int>	getFromId();
								bool	buildAndAppend		( std::vector<NeuronSharedPtr> FROM , std::vector<double> WEIGHT );
					std::vector<double>	getWeight	  	( );
//					std::vector<double>	getWeight	  	( std::vector<int> FROM );
		std::vector<NeuronSharedPtr>	getFromNeuron 	( );
								bool	setWeight		( std::vector<double> value);
//		À?						void	setWeight		( std::vector<double> value, std::vector<int> FROM);
								void	setFromNeuron	( std::vector<NeuronSharedPtr> FROM);
//								void 	erase 			( std::vector<int> FROM );
//								vecCon	select			( std::vector<int> FROM );
//								bool	validate		( );

};

#endif /* VECCON_H_ */


