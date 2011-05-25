/*
 * Neuron.h
 *
 *  Created on: 25/05/2011
 *      Author: mcasl
 */

#ifndef NEURON_H_
#define NEURON_H_

class Neuron {
	int Id;
	std::vector<Con> listCon;
	double outputValue;
public:

	int  getId	();
	void setId	(int id);
};



#endif /* NEURON_H_ */
