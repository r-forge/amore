# Class definition: listRBFLayer
# 
# Author: mcasl
###############################################################################

gListRBFLayer <- setRefClass("listRBFLayer",
		contains="listLayer",
		methods = list(	
				
				validate = function(...){
					lapply(getLdata(), function(x){ 
								if(!is(x,"rbfLayer")) {stop("[listRBFlayer Validate]: Error, layer does not belogn to the rbfLayer class.")} else {} 
							} )
					callSuper(...)
					return(TRUE)
				}
		
		)
)



