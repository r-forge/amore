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
		std::vector<boost::shared_ptr<T> > ldata; // Don't forget the space between "> >"

public:
		typename std::vector< boost::shared_ptr<T> > getLdata	();
											void	setLdata	( typename  std::vector< boost::shared_ptr<T> > );
											int 	size		();
											void 	push_back	( boost::shared_ptr<T>   element);
											void 	append		( vecAMORE<T>  v);
											bool 	show		();
											bool 	validate	();
};


#endif /* VECAMORE_H_ */
