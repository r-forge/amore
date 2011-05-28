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
		typename std::vector<T> getLdata	();
						void 	setLdata	( typename  std::vector<T>);
						int 	size		();
						void 	push_back	(T element);
						void 	append		( vecAMORE<T> v);
						bool 	show		();
						bool 	validate	();
};


#endif /* VECAMORE_H_ */
