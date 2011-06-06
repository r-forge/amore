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
								bool	buildAndAppend	( std::vector<NeuronSharedPtr> vFrom , std::vector<double> vWeight );
					std::vector<double>	getWeight	  	( );
					std::vector<double>	getWeight	  	( std::vector<int> vFrom );
		std::vector<NeuronSharedPtr>	getFromNeuron 	( );
								bool	setWeight		( std::vector<double> vWeight);
								bool	setWeight		( std::vector<double> vWeight, std::vector<int> vFrom);
								bool	setFromNeuron	( std::vector<NeuronSharedPtr> vFrom);
								void	erase 			( std::vector<int> vFrom );
						vecConSharedPtr	select			( std::vector<int> vFrom );
//								bool	validate		( );

};

#endif /* VECCON_H_ */


