################################################################################
# 
# 	Class definition: listNeuron
#
################################################################################

gListRBFneuron <- setRefClass("listRBFneuron",
		contains="listNeuron",
		methods = list(
				
				populate=function(ID, WIDTH, ALTITUDE, FROM, WEIGHT, ...){
					if (missing(ID)||missing(WIDTH)||missing(ALTITUDE)||missing(FROM)||missing(WEIGHT)) {stop("[listRBFneuron populate]: Error, either ID, WIDTH, ALTITUDE, FROM or WEIGHT is missing")  } else {}
					if (!all(mapply(identical, length(ID), length(WIDTH), length(ALTITUDE), length(FROM), length(WEIGHT)))) {stop("[listRBFneuron populate]: Error ID, WIDTH, ALTITUDE, FROM, WEIGHT length's are not equal.")} else {}
					
					mapply(FUN=function(i,wi,a,f,we){
								lc <- gListCon$new()
								lc$populate(FROM=f,WEIGHT=we)
								addToLdata(gRBFneuron$new(id=i, width=wi, altitude=a, con=lc))
							},	ID, WIDTH, ALTITUDE, FROM, WEIGHT) -> DontMakeNoise
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
				
				validate=function(...){
					'Object validator for internal coherence.
							'
					lapply(ldata, function(x){if (!is(x,"RBFneuron")) {stop("[listRBFneuron Validate]: Element is not an MLPneuron")}  })
					callSuper(...)
				}

		)
)

