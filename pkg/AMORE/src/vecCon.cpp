/*
 * vecCon.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

//! Size of the vecCon object
/*!
 * This function returns the size of the vecCon object, that is to say, the number of Con objects it contains.
 * \return The size of the vector
 *
 *  \code
 *  //================
 *  //Usage example:
 *  //================
 *			// Data set up
 *			Neuron N1, N2, N3;
 *			vecCon MyvecCon;
 *			std::vector<int> result;
 *
 *			N1.setId(10);
 *			N2.setId(20);
 *			N3.setId(30);
 *
 *			// Test
 *			result.push_back(MyvecCon.numOfCons());		// Append numOfCons to result, create new Con and push_back into MyvecCon
 *			ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// and repeat twice
 *			MyvecCon.push_back(ptCon);
 *			result.push_back(MyvecCon.numOfCons());
 *
 *			ptCon.reset(  new Con(&N2, 2.22) );
 *			MyvecCon.push_back(ptCon);
 *			result.push_back(MyvecCon.numOfCons());
 *
 *			ptCon.reset(  new Con(&N3, 3.33) );
 *			MyvecCon.push_back(ptCon);
 *			result.push_back(MyvecCon.numOfCons());
 *
 *	// Now, result contains a numeric vector with values 0, 1, 2, and 3.
 * \endcode
 *
 * \sa vecAMORE::size (alias)
 */
int  vecCon::numOfCons() {
	return ldata.size();
}



//! Getter of the Id values of the vector of Cons
/*!
 * This function returns the Id's of the neurons referred to by the vector of Cons.
 * \return An std::vector<int> that contains the Ids
 *
 * \code
 *  //================
 *  //Usage example:
 *  //================
 * 	// Data set up
 *			Neuron N1, N2, N3;
 *			vecCon MyvecCon;
 *			std::vector<int> result;
 *
 *			N1.setId(10);
 *			N2.setId(20);
 *			N3.setId(30);
 *
 *			ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
 *			MyvecCon.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N2, 2.22) );		// create new Con and assign to ptCon
 *			MyvecCon.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
 *			MyvecCon.push_back(ptCon);				// push_back
 *
 *	// Test
 *			MyvecCon.show() ;
 *			MyvecCon.validate();
 *			result=MyvecCon.getFromId();
 *
 *	// Now result is a vector that contains the values 10, 20 and 30.
 * \endcode
 *
 * \sa getWeight and the unit test files, e.g. runit.Cpp.vecCon.R, for further examples.
 */
std::vector<int>  vecCon::getFromId() {
	std::vector<int> result;
	result.reserve(numOfCons());
	for(std::vector<ConSharedPtr>::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{ result.push_back((*itr)->getFromId()); }
	return result;
}



//! Builds Con objects and appends them to ldata.
/*!
 * This function provides a convenient way of populating a vecCon object by building and apending Con objects to ldata.
 * \param FROM  A vector of smart pointers to the neurons to be used in the Con::from fields
 * \param WEIGHT A vector of values to be set in the Con::weight fields
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<int> result;
 *		vecCon MyvecCon;
 *		std::vector<NeuronSharedPtr> vNeuron;
 *		std::vector<double> vWeight;
 *
 *
 *	// Test
 *		NeuronSharedPtr ptNeuron( new Neuron(11) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(22) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(33) );
 *		vNeuron.push_back(ptNeuron);
 *
 *		vWeight.push_back(12.3);
 *		vWeight.push_back(1.2);
 *		vWeight.push_back(2.1);
 *
 *		MyvecCon.buildAndAppend(vNeuron, vWeight);
 *
 *		result=MyvecCon.getFromId();
 *
 *	// Now result is a vector that contains the values 11, 22 and 32.
 * \endcode
 *
 * \sa append and the unit test files, e.g. runit.Cpp.vecCon.R, for further examples.
 */
bool vecCon::buildAndAppend	( std::vector<NeuronSharedPtr> FROM, std::vector<double> WEIGHT){
	BEGIN_RCPP
	if (FROM.empty()) { throw std::range_error("[vecCon::append]: Error, FROM is empty"); }
	if (FROM.size() != WEIGHT.size() ) { throw std::range_error("[vecCon::buildAndAppend]: Error, FROM.size() != WEIGHT.size()"); }
	ldata.reserve(ldata.size() + FROM.size());
	ConSharedPtr ptCon;
	std::vector<double>::iterator itrWEIGHT = WEIGHT.begin();
	for(  std::vector<NeuronSharedPtr>::iterator itrFROM=FROM.begin();  itrFROM != FROM.end();	itrFROM++ , itrWEIGHT++)	{
	 		ptCon.reset(  new Con( itrFROM->get(), *itrWEIGHT) );
	 		ldata.push_back(ptCon);
	}
	return true;
	END_RCPP
}




//! Getter of the weight field of the Con object related to vecCon
/*!
 * This function provides a convenient way of getting the values of the weight field of those Con object pointed to by the smart pointer stored in the vecCon object.
 * \return A numeric (double) vector with the weights
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<double> result;
 *		vecCon MyvecCon;
 *		std::vector<NeuronSharedPtr> vNeuron;
 *		std::vector<double> vWeight;
 *
 *
 *	// Test
 *		NeuronSharedPtr ptNeuron( new Neuron(11) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(22) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(33) );
 *		vNeuron.push_back(ptNeuron);
 *
 *		vWeight.push_back(12.3);
 *		vWeight.push_back(1.2);
 *		vWeight.push_back(2.1);
 *
 *		MyvecCon.buildAndAppend(vNeuron, vWeight);
 *
 *		result=MyvecCon.getWeight();
 *
 *	// Now result is a vector that contains the values 12.3, 1.2 and 2.1 .
 * \endcode
 *
 * \sa getFromId and the unit test files, e.g. runit.Cpp.vecCon.R, for further examples.
 */
std::vector<double>	vecCon::getWeight ( ) {
	std::vector<double> result;
	result.reserve(numOfCons());
	for(std::vector<ConSharedPtr>::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{ result.push_back((*itr)->getWeight()); }
	return result;
}





//! Getter of the weight field of the Con object related to vecCon
/*!
 * This function provides a convenient way of getting the values of the weight field of those Con object pointed to by the smart pointer stored in the vecCon object.
 * \return A numeric (double) vector with the weights
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *	std::vector<int> result;
 *			vecCon MyvecCon;
 *			std::vector<NeuronSharedPtr> vNeuron;
 *			std::vector<NeuronSharedPtr> auxvec;
 *			std::vector<double> vWeight;
 *
 *			// Test
 *			NeuronSharedPtr ptNeuron( new Neuron(11) );
 *			vNeuron.push_back(ptNeuron);
 *			ptNeuron.reset( new Neuron(22) );
 *			vNeuron.push_back(ptNeuron);
 *			ptNeuron.reset( new Neuron(33) );
 *			vNeuron.push_back(ptNeuron);
 *
 *			vWeight.push_back(12.3);
 *			vWeight.push_back(1.2);
 *			vWeight.push_back(2.1);
 *
 *			MyvecCon.buildAndAppend(vNeuron, vWeight);
 *			auxvec = MyvecCon.getFromNeuron();
 *			for(std::vector<NeuronSharedPtr>::iterator itr = auxvec.begin();   itr != auxvec.end();   itr++)	{ result.push_back( (*itr)->getId() ); }
 *
 *
 *	// Now result is a vector that contains the values 11, 22 and 33 .
 * \endcode
 *
 * \sa getFromId and the unit test files, e.g. runit.Cpp.vecCon.R, for further examples.
 */
std::vector<NeuronSharedPtr> vecCon::getFromNeuron 	( ) {
	std::vector<NeuronSharedPtr> result;
	result.reserve(numOfCons());
	for(std::vector<ConSharedPtr>::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{ result.push_back( (*itr)->getFromNeuron() ); }
	return result;
}





/*
 *
 * 	initialize=function(con, ...){
					if (missing(con)){
						callSuper(...)
					} else {
						push_back(con)
						return(.self)
					}
				},


				getWeight = function(FROM, ...){
					if (missing(FROM)) {
						return(sapply(ldata,function(x) { x$getWeight(...)}))
					} else {
						return(select(FROM)$getWeight(...))
					}
				},

				getFrom = function(...){
					return(sapply(ldata,function(x) { x$getFrom(...)}))
				},


				setWeight= function(value, FROM, ...) {
					value <- c(value, recursive=TRUE)
					if (missing(FROM)) {
						if(numOfCons(...)!=length(value)) { stop("[listCon setWeight error]: Incorrect length(value)" )}
						mapply(FUN=function(x,w){x$setWeight(w)}, ldata, value)	-> DontMakeNoise
					} else {
						if(length(FROM)!=length(value)) { stop("[listCon setWeight(FROM=\"numeric\") error]:  Please, provide as many values as FROM slots you want to set." )}
						myMatch <- match(FROM, getFromId(...))
						if (any(is.na(myMatch))) {stop("[listCon setWeight(FROM=\"numeric\")]: Your FROM vector contains values that were not found by the .self$getFrom() call.")}
						mapply(FUN=function(x,w){x$setWeight(w)}, ldata[myMatch], value)	-> DontMakeNoise
					}
				},

				setFrom= function(value, FROM, ...) {
					value <- c(value, recursive=TRUE)
					if (missing(FROM)) {
						if(numOfCons(...)!=length(value)) { stop("[listCon setFrom error]: Incorrect length(value)" )}
						mapply(FUN=function(x,f){x$setFrom(f)}, ldata, value)	-> DontMakeNoise
					} else {
						if(length(FROM)!=length(value)) { stop("[listCon setFrom(FROM=\"numeric\") error]:  Please, provide as many values as FROM slots you want to set." )}
						myMatch <- match(FROM, getFromId(...))
						if (any(is.na(myMatch))) {stop("[listCon setFrom(FROM=\"numeric\")]: Your FROM vector contains values that were not found by the .self$getFrom() call.")}
						mapply(FUN=function(x,f){x$setFrom(f)}, ldata[myMatch], value)	-> DontMakeNoise
					}
				},

				erase = function(FROM, ...) {
					fromIds <- getFromId(...)
					delIds  <- seq(along=fromIds)[fromIds %in% FROM]
					if (length(delIds)>0) {
						ldata <<- ldata[-delIds]
					}
				},

				select=function(FROM, ...){
					fromObject <- getFromId(...)
					myMatch <- match(FROM,  fromObject)
					if (any(is.na(myMatch))) {stop("[listCon select Error]: Your FROM vector contains values that were not found by the .self$getFrom() call.")}
					idx <- seq(along=ldata) [- myMatch]
					selfClone <- copy(shallow=FALSE)
					selfClone$delete(FROM=fromObject[idx])
					return(selfClone)
				},

				numOfCons=function(...) {
					return(length(ldata))
				},

validate=function(...){
					'Object validator for internal coherence.
							'
					lapply(ldata, function(x){if (!is(x,"Con")) {stop("[listAMORE validate]: Element is not an AMORElistElement")}  })
					if (anyDuplicated(lapply(ldata, function(x){x$getFrom(...)}))>0) {stop("[listCon: Validation] Con@from duplication error")} else {}
					lapply(ldata, function(x){x$validate(...)})
					return(TRUE)
 *
 *
 */


//! Internal Object validator
/*! This method checks the object for internal coherence.
 *  This method calls the validate method for each element in ldata,
 * \sa The unit test files, e.g., runit.Cpp.vecCon.R, for usage examples.
 */
bool vecCon<>::validate() {
	BEGIN_RCPP
	std::vector<int> vIds;
	for(typename std::vector< boost::shared_ptr<T>  >::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{
		(*itr)->validate();
		vIds.push_back( (*itr)->getFromId() )
	}
	unique(vIds)
	return true;
	END_RCPP
};

//! Object validator
/*! This method checks the object for internal coherence.
 *  A try / catch mechanism exits normal execution and returns control to the R terminal in case the contents of the vecCon object are identified as corrupted.
 * \return true in case the checks are Ok.
 * \throw An std::range error if weight or from are not finite.
 */
bool Con::validateVector() {
	BEGIN_RCPP
	// if (! R_FINITE(getWeight()) )  		throw std::range_error("weight is not finite.");
	 if (numOfCons() == NA_INTEGER )		throw std::range_error("numOfCons is not finite.");
	return(true);
	END_RCPP
};


