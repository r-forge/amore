# TODO: Add comment
# 
# Author: mcasl
###############################################################################

gRBFneuralLayer <- setRefClass("RBFneuralLayer",
		contains="listRBFneuron",
		fields = list(
				numberOfNeurons = "integer",
				activationFunction = "character",
				normalizationMethod="character",
				threshold = "numeric",
				width = "numeric",
				altitude = "numeric"),
		
		methods = list(
						joinNeuron = function(value, ...){
							join(value, ...)
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

				getWidth = function(ID, ...){
					return(neuron$getWidth(ID, ...))
				},
				
				getWidth = function(ID, ...){
					return(neuron$getWidth(ID, ...))
				},
				
				setBias = function(value, ID, ...){
					neuron$setBias(value, ID, ...)
				},
				
				show = function(...){
					cat("\n ------------------------------")
					cat("\n LAYER ")
					cat("\n ------------------------------")
					cat("\n Number of neurons: ", numberOfNeurons)
					cat("\n Activation function: ", activationFunction)
					cat("\n Normalization Method: ", normalizationMethod)
					cat("\n Threshold: ", threshold)
					cat("\n Width: ", width)
					cat("\n Altitude: ", altitude)
					callSuper(...)
					cat("\n ------------------------------")
					return(invisible(TRUE))
				}, 
				
				validate = function(...){
					if (!is(neuron,"listRBFneuron")) {stop("[RBFneuralLayer]: Error")} else {}			
					callSuper(...)				
				}

}
)


# TODO: Add comment
# 
# Author: mcasl
###############################################################################


gNeuralLayer$accessors(c("numberOfNeurons", "activationFunction"))








validity=function(object){
	validObject(object@neuron)
	if(length(object@threshold)!=1) { stop("[RBFneuralLayer: Validation] RBFneuralLayer@threshold must have length 1")  } else {}
	if(length(object@width)!=1) { stop("[RBFneuralLayer: Validation] RBFneuralLayer@width must have length 1")    } else {}
	if(length(object@altitude)!=1) { stop("[RBFneuralLayer: Validation] RBFneuralLayer@altitude must have length 1")    } else {}
	if(is.na(pmatch(object@activationFunction, c("radialBasis")))) { stop("[RBFneuralLayer: Validation] RBFneuralLayer@activationFunction not known")    } else {}
	if(is.na(pmatch(object@normalizationMethod, c("none", "simplemax", "softmax")))) { stop("[RBFneuralLayer: Validation] neuralLayer@normalizationMethod not known")    } else {}
	if(object@numberOfNeurons != length(object@neuron)) { stop("[RBFneuralLayer: Validation] RBFneuralLayer@numberOfNeurons value is different from the actual length of the neurons' list")    } else {}
}
)


setMethod(
		f="show",
		signature = "RBFneuralLayer",
		definition=function(object){
			cat("\n ------------------------------")
			cat("\n LAYER ")
			cat("\n ------------------------------")
			cat("\n Number of neurons: ", numberOfNeurons(object))
			cat("\n Activation function: ", activationFunction(object))
			cat("\n Normalization Method: ", normalizationMethod(object))
			cat("\n Threshold: ", threshold(object))
			cat("\n Width: ", width(object))
			cat("\n Altitude: ", altitude(object))
			show(neuron(object))
			cat("\n ------------------------------")
		}
)


