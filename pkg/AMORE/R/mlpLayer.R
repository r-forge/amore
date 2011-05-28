# TODO: Add comment
# 
# Author: mcasl
###############################################################################

gmlpLayer <- setRefClass("mlpLayer",
		contains="listMLPneuron",
		fields=list(
				numberOfNeurons = "numeric",
				activationFunction = "character"
		),
		
		methods = list(		
				append = function(value, ...){
					callSuper(value, ...)
					numberOfNeurons <<- numOfNeurons()
				},
				
				delete = function(ID, ...){
					callSuper(ID, ...)
					numberOfNeurons <<- numOfNeurons()
				},

				populate = function(value, ...){
					callSuper(value, ...)
					numberOfNeurons <<- numOfNeurons()
				},
				
				show = function(...){
					cat("\n ------------------------------")
					cat("\n LAYER ")
					cat("\n ------------------------------")
					cat("\n Number of neurons: ", numberOfNeurons)
					cat("\n -----------------")
					cat("\n Activation function: ", activationFunction)
					cat("\n ------------------------------")
					callSuper(...)
					cat("\n ------------------------------")
					return(invisible(TRUE))
				}, 
				
				validate = function(...){
					if(numberOfNeurons!=numOfNeurons()) {stop("[mlpLayer Validation]: Error in numberOfNeurons.")} else {}
					if(!is.finite(numberOfNeurons)){stop("[mlpLayer Validation]: Error, numberOfNeurons is not finite")} else {}
					if (!(activationFunction %in% KnownActivationFunctions)) {stop("[neuralLayer Validation]: Error, unknown activation function")} else {}
					callSuper(...)				
				}
		)
)
gmlpLayer$accessors(c("numberOfNeurons", "activationFunction"))

