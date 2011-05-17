# TODO: Add comment
# 
# Author: mcasl
###############################################################################

gMLPneuralLayer <- setRefClass("MLPneuralLayer",
		contains="listMLPneuron",
		fields=list(
				numberOfNeurons = "integer",
				activationFunction = "character",
		),
		
		methods = list(		
				join = function(value, ...){
					callSuper(value, ...)
					numberOfNeurons <<- neuron$numOfNeurons()
				},
				
				delete = function(ID, ...){
					callSuper(ID, ...)
					numberOfNeurons <<- neuron$numOfNeurons()
				},
				
				validate = function(...){
					if(numberOfNeurons!=numOfNeurons()) {stop("[neuralLayer Validation]: Error in numberOfNeurons.")} else {}
					if(!is.finite(numberOfNeurons)){stop("[neuralLayer Validation]: Error, numberOfNeurons is not finite")} else {}
					if (!(activationFunction %in% KnownActivationFunctions)) {stop("[neuralLayer Validation]: Error, unknown activation function")} else {}
					neuron$validate(...)
				},
				
				getBias = function(ID, ...){
					return(neuron$getBias(ID, ...))
				},
				
				setBias = function(value, ID, ...){
					neuron$setBias(value, ID, ...)
				},
				
				show = function(...){
					cat("\n ------------------------------")
					cat("\n LAYER ")
					cat("\n ------------------------------")
					cat("\n Number of neurons: ", numberOfNeurons)
					cat("\n -----------------")
					cat("\n Activation function: ", activationFunction)
					cat("\n ------------------------------")
					neuron$show()
					cat("\n ------------------------------")
					return(invisible(TRUE))
				}, 
				
				validate = function(...){
					if (!is(neuron,"listMLPneuron")) {stop("[MLPneuralLayer]: Error")} else {}			
					callSuper(...)				
				}
		)
)
gMLPneuralLayer$accessors(c("numberOfNeurons", "activationFunction"))

