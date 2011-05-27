/*
 * vecAMORE.h
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#ifndef VECAMORE_H_
#define VECAMORE_H_

template <typename T> class vecAMORE {
protected:
		std::vector<T> ldata;

public:
	    void push_back(T element);
// \todo		void join(vecAMORE<T> vecT);
	    bool show();
		bool validate();
};


#endif /* VECAMORE_H_ */
