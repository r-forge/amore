/*
 * Con.h
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */

#ifndef CON_H_
#define CON_H_

class Con {
		Neuron * from;
		double weight;

public:
	Neuron *	getFromNeuron	();
	void 		setFromNeuron	(Neuron * f);
	int			getFromId		();
	double 		getWeight		();
	void 		setWeight		(double w);
	bool		show			();
	bool		validate		();
};



#endif /* CON_H_ */
