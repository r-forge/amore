# Class definition: listLayer
# 
# Author: mcasl
###############################################################################

gListLayer <- setRefClass("listLayer",
		contains="listAMORE",
	
		methods = list(	
			getId = function(...){
				return(lapply(collection, function(x){x$getId(...)}))	
			},

			numOfLayers = function(...){
				return(length(load()))	
			},
			
			delete = function(POS, ...) {
				Pos <- seq(numOfLayers())
				myMatch <- match(POS, Pos)
				if (any(is.na(myMatch))) {stop("[listLayer delect Error]: Your POS vector contains values that were not present in the listLayer.")}			
				if (length(myMatch)>0) {
					collection <<- collection[-myMatch]	       
				}
			},
			
# TODO check out range in other delete methods
				
			select=function(POS, ...){
				Pos <- seq(numOfLayers())
				myMatch <- match(POS, Pos)
				if (any(is.na(myMatch))) {stop("[listLayer delect Error]: Your POS vector contains values that were not present in the listLayer.")}
				idx <- seq(numOfLayers()) [-myMatch]
				selfClone <- copy(shallow=FALSE)
				selfClone$delete(POS=Pos[idx])
				return(selfClone)
			},
			
					
			validate = function(...){
				if (anyDuplicated(c(getId(...), recursive=TRUE))>0) {	stop("[listLayer: Validation] Id duplication error")} else {}
				lapply(load(), function(x){x$validate(...)} )
				return(TRUE)
			}
		)
)

