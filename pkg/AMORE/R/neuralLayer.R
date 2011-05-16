# TODO: Add comment
# 
# Author: mcasl
###############################################################################
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
						
						getWeight = function(FROM, ID, ...){
							return(neuron$getWeight(FROM, ID, ...))
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

						
						addToNeuron = function(value, ...){
							neuron$addToLdata(value, ...)
							numberOfNeurons <<- numberOfNeurons+length(value)
						},
										
						delete = function(ID, ...){
							neuron$delete(ID, ...)
						}
				)

)

gNeuralLayer$accessors(c("numberOfNeurons", "activationFunction", "neuron"))
