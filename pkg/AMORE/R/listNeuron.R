################################################################################
# 
# 	Class definition: listNeuron
#
################################################################################

gListNeuron <- setRefClass("listNeuron",
		contains="listAMORE",
		methods = list(
				
				initialize=function(neuron, ...){
					if (missing(neuron)){
						callSuper(...)
					} else {
						addNeuron(neuron)
						return(.self)
					}
				},
				
				addNeuron= function (value, ...) { 
					addToLdata(value)
				},	  
				
				getId=function(...){
					return(sapply(ldata, function(x){x$getId(...)}))      
				},  
				
				getBias = function(ID, ...){
					if (missing(ID)) {
						return(sapply(ldata,function(x) { x$getBias(...)}))
					} else {
						return(select(ID)$getBias())
					}
				},
				
				getWidth = function(ID, ...){
					if (missing(ID)) {
						return(sapply(ldata,function(x) { x$getWidth(...)}))
					} else {
						return(select(ID)$getWidth())
					}
				},
				
				getAltitude = function(ID, ...){
					if (missing(ID)) {
						return(sapply(ldata,function(x) { x$getAltitude(...)}))
					} else {
						return(select(ID)$getAltitude())
					}
				},
				
				getFrom =function(ID, ...){
					if(missing(ID)) {
						f <- lapply(ldata, function(x, ...) { x$getFrom(...)})
						return(f)
					} else {
						return(select(ID)$getFrom(...))
					}
				},
				
				getWeight =function(ID, ...){
					if(missing(ID)) {
						w <- lapply(ldata, function(x, ...) { x$getWeight(...)})
						return(w)
					} else {
						return(select(ID)$getWeight(...))
					}
				},
				
				setBias = function(value, ID,  ...) {
					if (missing(ID)) {
						if(numOfNeurons()!=length(value)) { stop("[listNeuron setBias(ID=\"missing\")<- Error]: Incorrect length(value)" )}
						z <- mapply(ldata, value, FUN=function(x,y){x$setBias(y)})		
						
					} else {
						return(select(ID)$setBias(value, ...))
					}
				},
				
				setWidth = function(value, ID,  ...) {
					if (missing(ID)) {
						if(numOfNeurons()!=length(value)) { stop("[listNeuron setWidth(ID=\"missing\")<- Error]: Incorrect length(value)" )}
						z <- mapply(ldata, value, FUN=function(x,y){x$setWidth(y)})		
					} else {
						return(select(ID)$setWidth(value, ...))
					}
				},
				
				setAltitude = function(value, ID,  ...) {
					if (missing(ID)) {
						if(numOfNeurons()!=length(value)) { stop("[listNeuron setAltitude(ID=\"missing\")<- Error]: Incorrect length(value)" )}
						z <- mapply(ldata, value, FUN=function(x,y){x$setAltitude(y)})		
					} else {
						return(select(ID)$setAltitude(value, ...))
					}
				},
				
				numOfCons = function(...) {
					return(c(lapply(ldata, function(x) {x$numberOfCons()}),recursive=TRUE))
				},  
				
				numOfNeurons = function(...) {
					return(length(ldata))
				},
				
				delete = function(ID, ...) {
					neuronIds <- getId() 
					delIds <- seq(along=neuronIds)[neuronIds %in% ID]
					if (length(delIds)>0) {
						ldata <<- ldata[-delIds]	       
					}
				},
				
				select=function(ID, ...){
					Ids <- getId()
					myMatch <- match(ID, Ids)
					if (any(is.na(myMatch))) {stop("[listNeuron select Error]: Your ID vector contains values that were not found by the getId() call.")}
					idx <- seq(along=ldata) [- myMatch]
					selfClone <- copy(shallow=FALSE)
					selfClone$delete(ID=Ids[idx])
					return(selfClone)
				},
				
				setWeight=function(value, ID, ...){
					if(missing(ID)){
						if(numOfNeurons()!=length(value)) {stop("[listNeuron setWeight(ID=\"missing\")<-]: Incorrect lengths.")}
							z <- mapply(ldata, value, FUN=function(x,y){x$setWeight(y)})		
					} else {
						select(ID)$setWeight(value, ...)
					}
				},
				
				setFrom=function(value, ID, ...){
					if(missing(ID)){
						if(numOfNeurons()!=length(value)) {stop("[listNeuron setFrom(ID=\"missing\")<-]: Incorrect lengths.")}
							z <- mapply(ldata, value, FUN=function(x,y){x$setFrom(y)})
					} else {
						select(ID)$setFrom(value, ...)
					}
				},
				
				is.regular=function(...) {
					if(identical(numOfNeurons(),1)) {
						return(TRUE)
					} else {
						f <- getFrom(...)
						
# TODO por arreglar
						return(all(mapply(identical, f[,1], f[,-1])))
					}
				},
				
				validate=function(...){
					'Object validator for internal coherence.
					'
					if (anyDuplicated(getId(...))>0) {
						stop("[listNeuron: Validation] Neuron$id  duplication error")
					} else {
						lapply(ldata, function(x){x$validate(...)})
					}
					return(TRUE)
				}
		
		)
)

