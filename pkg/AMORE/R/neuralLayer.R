# TODO: Add comment
# 
# Author: mcasl
###############################################################################
KnownActivationFunctions <- c("threshold", "logistic", "tanh", "identity", "exponential", "reciprocal", "square", "Gauss", "sine", "cosine", "Elliott", "arctan", "radialBasis")


gNeuralLayer <- setRefClass("neuralLayer",
		fields=list(
				numberOfNeurons = "integer",
				activationFunction = "character",
				neuron= "listNeuron"
		),
		
		methods = list(
						getId = function(...){
							return(neuron$getId())
						},
						
						is.regular = function(...){
							return(neuron$is.regular())
						},
						
						getFrom = function(ID, ...){
							return(neuron$getFrom(ID, ...))
						},
						
						getWeight = function(ID, ...){
							return(neuron$getWeight(ID, ...))
						},
						
						numOfCons = function(...){
							return(neuron$numOfCons(...))
						},
						
						setId = function(value, ID, ...){
							neuron$setId(value, ID, ...)
						},

						setFrom = function(value, ID, ...){
							return(neuron$setFrom(value, ID, ...))
						},
						
						
						setWeight = function(value, ID, ...){
							return(neuron$setWeight(value, ID, ...))
						},

						
						joinNeuron = function(value, ...){
							neuron$join(value, ...)
							numberOfNeurons <<- neuron$numOfNeurons()
						},
										
						delete = function(ID, ...){
							neuron$delete(ID, ...)
							numberOfNeurons <<- neuron$numOfNeurons()
						},
						
						validate = function(...){
							if(numberOfNeurons!=neuron$numOfNeurons()) {stop("[neuralLayer Validation]: Error in numberOfNeurons.")} else {}
							if(!is.finite(numberOfNeurons)){stop("[neuralLayer Validation]: Error, numberOfNeurons is not finite")} else {}
							if (!(activationFunction %in% KnownActivationFunctions)) {stop("[neuralLayer Validation]: Error, unknown activation function")} else {}
							neuron$validate(...)
						}
				)

)

gNeuralLayer$accessors(c("numberOfNeurons", "activationFunction", "neuron"))

