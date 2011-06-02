################################################################################
#
# 	ConClass definition:
# 	
################################################################################
setClassUnion("numericOrNeuron", c("numeric")) 
# The Neuron class will be added to the class union after the Neuron class is defined
gCon <- setRefClass("Con",
		fields=list(
				from="numericOrNeuron",
				weight="numeric"
		),
		methods= list(

				getFromId = function(...) {
					if(is.numeric(from)) {return(from)} else { return(from$getId()) }	
				},
				
				show=function(...) {
					'Customized print function 
							'
					if (is.numeric(from)){
						cat("\n From: ", from, "\t Weight: ", weight)
					} else {
						cat("\n From: ", from$getId(...), "\t Weight: ", weight)
					}
					return(invisible(TRUE))
				},
				validate=function(...){
					'Object validator for internal coherence.
					'
					if(!is(from,"Neuron")) {
						if(length(from)!=1) {stop("[ConClass: Validate] From must have length 1")} else {}
						if(!is.finite(from)) {stop("[ConClass: Validate] is.finite(from) returned FALSE ") } else {}
					} else {}
					
					if(length(weight)!=1 ) {stop("[ConClass: Validate] Weight must have length 1")} else {}	
					if(!is.finite(weight)) {stop("[ConClass: Validate] is.finite(weight) returned FALSE ")} else {}
					return(TRUE)    
				}
		)
)


gCon$accessors(c("from","weight"))
