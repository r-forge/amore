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
						addToLdata(neuron)
						return(.self)
					}
				},

				getId=function(...){
					return(sapply(ldata, function(x){x$getId(...)}))      
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
				
				numOfCons = function(...) {
					return(c(lapply(ldata, function(x) {x$numOfCons(...)}),recursive=TRUE))
				},  
				
				numOfNeurons = function(...) {
					return(length(ldata))
				},
				
				delete = function(ID, ...) {
					neuronIds <- getId(...) 
					delIds <- seq(along=neuronIds)[neuronIds %in% ID]
					if (length(delIds)>0) {
						ldata <<- ldata[-delIds]	       
					}
				},
				
				select=function(ID, ...){
					Ids <- getId(...)
					myMatch <- match(ID, Ids)
					if (any(is.na(myMatch))) {stop("[listNeuron select Error]: Your ID vector contains values that were not found by the getId() call.")}
					idx <- seq(along=ldata) [- myMatch]
					selfClone <- copy(shallow=FALSE)
					selfClone$delete(ID=Ids[idx])
					return(selfClone)
				},
				
				setId=function(value, ID, ...){
					if(missing(ID)){
						if(numOfNeurons()!=length(value)) {stop("[listNeuron setID(ID=\"missing\")<-]: Incorrect lengths.")}
						z <- mapply(ldata, value, FUN=function(x,y){x$setId(y)})		
					} else {
						select(ID)$setId(value, ...)
					}				},  
				
				setWeight=function(value, ID, ...){#TODO Remark in the help that value is a list and that the returned value from the getter is a list as well
					if(missing(ID)){
						if(numOfNeurons(...)!=length(value)) {stop("[listNeuron setWeight(ID=\"missing\")<-]: Incorrect lengths.")}
						z <- mapply(ldata, value, FUN=function(x,y){x$setWeight(y)})		
					} else {
						select(ID)$setWeight(value, ...)
					}
				},
				
				setFrom=function(value, ID, ...){ #TODO Remark in the help that value is a list and that the returned value from the getter is a list as well
					if(missing(ID)){
						if(numOfNeurons(...)!=length(value)) {stop("[listNeuron setFrom(ID=\"missing\")<-]: Incorrect lengths.")}
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
						return(all(mapply(identical, f[1], f[-1])))
					}
				},
				
				validate=function(...){
					'Object validator for internal coherence.
							'
					if (anyDuplicated(getId(...))>0) {stop("[listNeuron: Validation] Neuron$id  duplication error")} else {}
					lapply(ldata, function(x){x$validate(...)})
					return(TRUE)
				}
		
		)
)

