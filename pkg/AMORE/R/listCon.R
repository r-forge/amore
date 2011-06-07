################################################################################
#
#     Class definition: listCon
#     Methods: validity, initialize, delete, getWeight, setWeight, getFrom, setFrom
#
################################################################################

gListCon <- setRefClass("listCon",
		contains="listAMORE",  
		methods= list(
				initialize=function(con, ...){
					if (missing(con)){
						callSuper(...)
					} else {
						push_back(con)
						return(.self)
					}
				},
				
				buildAndAppend=function(FROM, WEIGHT, ...){
					if (missing(FROM)||missing(WEIGHT)) {stop("[listCon buildAndAppend]: Error, FROM and/or WEIGHT parameters missing")  } else {}
					if (length(FROM)!=length(WEIGHT)) {stop("[listCon initialize]: Error length(FROM)!=length(WEIGHT)")} else {}   
					mapply(FUN=function(f,w){push_back(gCon$new(from=f, weight=w))}, FROM, WEIGHT) -> DontMakeNoise
				},
				
				getWeight = function(FROM, ...){
					if (missing(FROM)) {
						return(sapply(collection,function(x) { x$getWeight(...)}))
					} else {
						return(select(FROM)$getWeight(...))
					}
				},
				
				getFrom = function(...){
					return(sapply(collection,function(x) { x$getFrom(...)}))
				},
				
				getId = function(...){
					return(sapply(collection,function(x) { x$getId(...)}))
				},
				
				setWeight= function(value, FROM, ...) {
					value <- c(value, recursive=TRUE)
					if (missing(FROM)) {
						if(numOfCons(...)!=length(value)) { stop("[listCon setWeight error]: Incorrect length(value)" )}
						mapply(FUN=function(x,w){x$setWeight(w)}, collection, value)	-> DontMakeNoise	
					} else {
						if(length(FROM)!=length(value)) { stop("[listCon setWeight(FROM=\"numeric\") error]:  Please, provide as many values as FROM slots you want to set." )} 
						myMatch <- match(FROM, getId(...))
						if (any(is.na(myMatch))) {stop("[listCon setWeight(FROM=\"numeric\")]: Your FROM vector contains values that were not found by the .self$getFrom() call.")} 
						mapply(FUN=function(x,w){x$setWeight(w)}, collection[myMatch], value)	-> DontMakeNoise			
					}
				},
				
				setFrom= function(value, FROM, ...) {
					value <- c(value, recursive=TRUE)
					if (missing(FROM)) {
						if(numOfCons(...)!=length(value)) { stop("[listCon setFrom error]: Incorrect length(value)" )}
						mapply(FUN=function(x,f){x$setFrom(f)}, collection, value)	-> DontMakeNoise	
					} else {
						if(length(FROM)!=length(value)) { stop("[listCon setFrom(FROM=\"numeric\") error]:  Please, provide as many values as FROM slots you want to set." )} 
						myMatch <- match(FROM, getId(...))
						if (any(is.na(myMatch))) {stop("[listCon setFrom(FROM=\"numeric\")]: Your FROM vector contains values that were not found by the .self$getFrom() call.")} 
						mapply(FUN=function(x,f){x$setFrom(f)}, collection[myMatch], value)	-> DontMakeNoise			
					}
				},
				
				delete = function(FROM, ...) {
					fromIds <- getId(...) 
					delIds  <- seq(along=fromIds)[fromIds %in% FROM]
					if (length(delIds)>0) {
						collection <<- collection[-delIds]	       
					}
				},
				
				select=function(FROM, ...){
					fromObject <- getId(...)
					myMatch <- match(FROM,  fromObject)
					if (any(is.na(myMatch))) {stop("[listCon select Error]: Your FROM vector contains values that were not found by the .self$getFrom() call.")}
					idx <- seq(along=collection) [- myMatch]
					selfClone <- copy(shallow=FALSE)
					selfClone$delete(FROM=fromObject[idx])
					return(selfClone)
				},
				
				numOfCons=function(...) {
					return(length(collection))			
				},
				
				validate=function(...){
					'Object validator for internal coherence.
							'
					lapply(collection, function(x){if (!is(x,"Con")) {stop("[listAMORE validate]: Element is not an AMORElistElement")}  })
					if (anyDuplicated(lapply(collection, function(x){x$getFrom(...)}))>0) {stop("[listCon: Validation] Con@from duplication error")} else {}
					lapply(collection, function(x){x$validate(...)})
					return(TRUE)
				}
		)
)


