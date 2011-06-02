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
 * 	// Data set up
 *		Con Con1, Con2, Con3;
 *		Neuron N1, N2, N3;
 *		vecCon MyvecCon;
 *		std::vector<int> result;
 *
 *		N1.setId(10);
 *		N2.setId(20);
 *		N3.setId(30);
 *
 *		Con1.setFromNeuron(&N1);
 *		Con2.setFromNeuron(&N2);
 *		Con3.setFromNeuron(&N3);
 *
 *		Con1.setWeight(1.01);
 *		Con2.setWeight(22.02);
 *		Con3.setWeight(333.03);
 *
 *	// Test
 *		result.push_back(MyvecCon.numOfCons());
 *		MyvecCon.push_back(Con1);
 *		result.push_back(MyvecCon.numOfCons());
 *		MyvecCon.push_back(Con2);
 *		result.push_back(MyvecCon.numOfCons());
 *		MyvecCon.push_back(Con3);
 *		result.push_back(MyvecCon.numOfCons());
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
 */
std::vector<int>  vecCon::getFromId() {
	std::vector<int> result;
	result.reserve(numOfCons());
	for(std::vector<ConSharedPtr>::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{ result.push_back((*itr)->getFromId()); }
	return result;
}


//
//
//
//void vecCon::populate	( std::vector<Neuron> FROM, std::vector<double> WEIGHT){
//
//	BEGIN_RCPP
//	Con con;
//	if (FROM.size() != WEIGHT.size() ) { throw std::range_error("[vecCon::populate]: Error, FROM.size() != WEIGHT.size()"); }
//	ldata.reserve(ldata.size() + FROM.size());
//	for( std::vector<int>::iterator itrFROM=FROM.begin(), std::vector<double>::iterator itrWEIGHT = WEIGHT.begin()	;   itrFROM != FROM.end();	itrFROM++, itrWEIGHT++)	{
//
//		new();
//
//		ldata.push_back(
//		)
//	}
//
//
//	END_RCPP
//}
//	push_back(gCon$new(from=f, weight=w))}, FROM, WEIGHT)



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

