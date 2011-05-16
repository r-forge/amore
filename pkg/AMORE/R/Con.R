################################################################################
#
# 	ConClass definition:
# 	
################################################################################
setClassUnion("numericOrNeuron", c("numeric")) 
# The neuron class will be added to the class union after the Neuron class is defined
# TODO Add help info with Roxygen
gCon <- setRefClass("Con",
		fields=list(
				from="numericOrNeuron",
				weight="numeric"
		),
		methods= list(
				show=function(...) {
					'Customized print function 
							'
					if (is.numeric(from)){
						cat("\n From: ", from, "\t Weight: ", weight)
					} else {
						cat("\n From: ", from$getId(), "\t Weight: ", weight)
					}
					return(invisible(TRUE))
				},
				validate=function(...){
					'Object validator for internal coherence.
					'
					if(!is(from,"Neuron")) {
						if(length(from)!=1) {stop("[ConClass: Validate] From must have length 1")} else {}
						if(is.na(from)) {stop("[ConClass: Validate] is.na(from) returned TRUE ") } else {}
					} else {}
					
					if(length(weight)!=1 ) {stop("[ConClass: Validate] Weight must have length 1")} else {}	
					if(is.na(weight)) {stop("[ConClass: Validate] is.na(weight) returned TRUE ")} else {}
					return(TRUE)    
				}
		)
)


gCon$accessors(c("from","weight"))
