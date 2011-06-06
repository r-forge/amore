# Class definition: listMLPLayer
# 
# Author: mcasl
###############################################################################

gListMLPLayer <- setRefClass("listMLPLayer",
		contains="listLayer",
		methods = list(	
								
				validate = function(...){
					lapply(load(), function(x){ 
								if(!is(x,"mlpLayer")) {stop("[listMLPlayer Validate]: Error, layer does not belogn to the mlpLayer class.")} else {} 
							} )
					callSuper(...)
					return(TRUE)
				}

		)
)



