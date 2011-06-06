/*
 *  VecCon.h
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#ifndef VECCON_H_
#define VECCON_H_


//!  A vector of connections
/*!
 *   The VecCon class provides a simple class for a vector of connections. It's named after the R equivalent Reference Class.
 */

class VecCon: public Container<Con> {

public:

									int	numOfCons();
					std::vector<int>	getFromId();
								bool	buildAndAppend	( std::vector<NeuronPtr> vFrom , std::vector<double> vWeight );
					std::vector<double>	getWeight	  	( );
					std::vector<double>	getWeight	  	( std::vector<int> vFrom );
		std::vector<NeuronPtr>	getFromNeuron 	( );
								bool	setWeight		( std::vector<double> vWeight);
								bool	setWeight		( std::vector<double> vWeight, std::vector<int> vFrom);
								bool	setFromNeuron	( std::vector<NeuronPtr> vFrom);
								void	erase 			( std::vector<int> vFrom );
							VecConPtr	select			( std::vector<int> vFrom );
								bool	validate		( );

};

#endif /* VECCON_H_ */


