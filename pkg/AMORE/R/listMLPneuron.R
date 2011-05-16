################################################################################
# 
# 	Class definition: listNeuron
#
################################################################################

gListMLPneuron <- setRefClass("listMLPneuron",
		contains="listNeuron",
		methods = list(
				
				populate=function(ID, BIAS, FROM, WEIGHT, ...){
					if (missing(ID)||missing(BIAS)||missing(FROM)||missing(WEIGHT)) {stop("[listMLPneuron populate]: Error, Either ID, BIAS, FROM or WEIGHT is missing")  } else {}
					if (!all(mapply(identical, length(ID), length(BIAS), length(FROM), length(WEIGHT)))) {stop("[listNeuron populate]: Error ID, BIAS, FROM, WEIGHT length's are not equal.")} else {}
					
					mapply(FUN=function(i,b,f,w){
								lc <- gListCon$new()
								lc$populate(FROM=f,WEIGHT=w)
								addToLdata(gMLPneuron$new(id=i, bias=b, con=lc))
							},	ID, BIAS, FROM, WEIGHT) -> DontMakeNoise
				},
					
				getBias = function(ID, ...){
					if (missing(ID)) {
						return(sapply(ldata,function(x) { x$getBias(...)}))
					} else {
						return(select(ID)$getBias())
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
				
				validate=function(...){
					'Object validator for internal coherence.
							'
					lapply(ldata, function(x){if (!is(x,"MLPneuron")) {stop("[listMLPneuron Validate]: Element is not an MLPneuron")}  })
					callSuper(...)
				}
		
		
		)
)

