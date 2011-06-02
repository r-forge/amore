/*
 * vecCon.h
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

	int					numOfCons();
	std::vector<int>	getFromId();
//	void 				populate	( listNeuron * FROM, std::vector<double> WEIGHT);


	//	std::vector<double>	getWeight	(FROM);
	//
	// Test sv (Manolo)
	// (Manolo)
	// Prueba voy a cambiar cosas yo ahora
	//
	// Esta linea es de manolo
	// Esta linea también es de manolo
	//						getFrom ();
	//						setWeight(value, FROM);
	//						setFrom(value, FROM);
	//						delete(FROM);
	//						select(FROM);
	//						validate();
};


#endif /* VECCON_H_ */


