



incCode <- "
		#include <iostream>
		#include <sstream>
		#include <algorithm>
		#include <vector>
		#include <iterator>
		#include <boost/foreach.hpp>
		#include <Rcpp.h>
		#define foreach         BOOST_FOREACH
		#define size_type unsigned int
"

otherCode <- "
	using namespace Rcpp;
	class MyClass {
	public:
 		std::vector<int> collection;
		typedef std::vector<int>::iterator iterator;
  		typedef std::vector<int>::const_iterator const_iterator;
  		typedef int value_type;
  		typedef value_type const &const_reference;
 		iterator begin() { return collection.begin() ; }
 		iterator end()   { return collection.end()   ; }

		void push_back(int const &const_reference){
			collection.push_back(const_reference);
		}
};
"

testCode <- "
		MyClass my;		my.push_back(1);		my.push_back(2);		my.push_back(3);		my.push_back(4);		my.push_back(5);
		MyClass his;	his.push_back(3);		his.push_back(4); 		his.push_back(5);
		MyClass result;

		set_intersection(my.begin(), my.end(), his.begin(), his.end(), std::back_inserter(result));

		for( MyClass::const_iterator itr=my.begin() ; itr != my.end() ; ++itr ){
			Rprintf( \"%d _ \", *itr);
		}

		return wrap(result.collection);
"

	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs=otherCode, language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	result	

# 1 _ 2 _ 3 _ 4 _ 5 _ [1] 3 4 5



	
	
	
	
	
		

