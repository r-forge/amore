/*
 * ConContainer.h
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#ifndef MLPNEURONCONTAINER_H_
#define MLPNEURONCONTAINER_H_

//!  A vector of connections
/*!
 *   The ConContainer class provides a simple class for a vector of connections. It's named after the R equivalent Reference Class.
 */

class MLPneuronContainer : public NeuronContainer<MLP>
{

public:

  //									int	numOfCons();
  std::vector<int>
  getId();

  bool
  buildAndAppend(std::vector<int> IDS, std::vector<int> BIAS, ConContainer VC);
  //					std::vector<double>	getWeight	  	( );
  //					std::vector<double>	getWeight	  	( std::vector<int> FROM );
  //		std::vector<NeuronPtr>	getFrom 	( );
  //								void	setWeight		( std::vector<double> value);
  //		À?						void	setWeight		( std::vector<double> value, std::vector<int> FROM);
  //								void	setFrom	( std::vector<NeuronPtr> FROM);
  //								void 	erase 			( std::vector<int> FROM );
  //								ConContainer	select			( std::vector<int> FROM );
  //								bool	validate		( );

};

#endif /* MLPNEURONCONTAINER_H_ */

