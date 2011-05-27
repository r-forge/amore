/*
 * vecAMORE.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */







template <typename T> void vecAMORE<T>::push_back(T element) {
	this->ldata.push_back(element);
};


template <typename T> bool vecAMORE<T>::show() {
//	for_each(ldata.begin(), ldata.end(), showCon );
	typename std::vector<T>::iterator itr;
	for(itr = ldata.begin();   itr != ldata.end();   itr++) {
			itr->show();
	}
	return true;
};


template <typename T> bool vecAMORE<T>::validate() {
// for_each(ldata.begin(), ldata.end(), validateCon);
	typename std::vector<T>::iterator itr;
		for(itr = ldata.begin();   itr != ldata.end();   itr++) {
				itr->validate();
		}
		return true;
};


//! \todo void join(vecAMORE<T> vecT);
// ldata <<- c(ldata, value$getLdata(...))


