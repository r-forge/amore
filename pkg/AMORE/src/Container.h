/*
 * Container.h
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */


#ifndef CONTAINER_H_
#define CONTAINER_H_

template <typename T> class Container {
protected:
		std::vector<boost::shared_ptr<T> > collection; // Don't forget the space between "> >"

public:

	typedef typename std::vector<boost::shared_ptr<T> >::iterator	iterator;
	typedef typename std::vector<boost::shared_ptr<T> >::const_iterator	const_iterator;

													Container	( );
													Container	( typename std::vector<boost::shared_ptr<T> > collection);
										iterator	begin		( )	{ 	return collection.begin();	}
										iterator	end			( )	{ 	return collection.end();	}
	typename std::vector< boost::shared_ptr<T> >	load		( );
											void	store		( typename  std::vector< boost::shared_ptr<T> > );
										size_type 	size		( );
											void 	push_back	( boost::shared_ptr<T>   element);
											void 	append		( Container<T>  v);
											bool 	show		( );
											bool 	validate	( );
											void	reserve		( int n );
											void	resize		( int n );
							boost::shared_ptr<T>	&operator[]	( size_type offset ) ;
};


#endif /* CONTAINER_H_ */
