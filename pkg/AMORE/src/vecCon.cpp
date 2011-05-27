/*
 * vecCon.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */



//! Getter of the Id values of the vector of Cons
/*!
 * This function returns the Id's of the neurons referred to by the vector of Cons.
 */



std::vector<int>  vecCon::getFromId() {

//! \todo initialize result with as many elements as "this".
	std::vector<int> result;
	std::vector<Con>::iterator itr;

	for(itr = ldata.begin();   itr != ldata.end();   itr++) {
			result.push_back(itr->getFromId());
	}
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

				populate=function(FROM, WEIGHT, ...){
					if (missing(FROM)||missing(WEIGHT)) {stop("[listCon populate]: Error, FROM and/or WEIGHT parameters missing")  } else {}
					if (length(FROM)!=length(WEIGHT)) {stop("[listCon initialize]: Error length(FROM)!=length(WEIGHT)")} else {}
					mapply(FUN=function(f,w){push_back(gCon$new(from=f, weight=w))}, FROM, WEIGHT) -> DontMakeNoise
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

				getFromId = function(...){
					return(sapply(ldata,function(x) { x$getFromId(...)}))
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

				delete = function(FROM, ...) {
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

