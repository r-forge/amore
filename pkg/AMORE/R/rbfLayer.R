# TODO: Add comment
# 
# Author: mcasl
###############################################################################

grbfLayer <- setRefClass("rbfLayer",
		contains="listRBFneuron",
		fields = list(
				numberOfNeurons = "integer",
				activationFunction = "character",
				normalizationMethod="character",
				threshold = "numeric",
				width = "numeric",
				altitude = "numeric"),
		
		methods = list(
				join = function(value, ...){
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
					cat("\n------------------------------")
					cat("\n LAYER ")
					cat("\n------------------------------")
					cat("\n Number of neurons: ", numberOfNeurons)
					cat("\n Activation function: ", activationFunction)
					cat("\n Normalization Method: ", normalizationMethod)
					cat("\n Threshold: ", threshold)
					cat("\n Width: ", width)
					cat("\n Altitude: ", altitude)
					callSuper(...)
					cat("\n------------------------------")
					return(invisible(TRUE))
				}, 
				
				validate = function(...){
					if(numberOfNeurons!=numOfNeurons()) 							{stop("[mlpLayer Validation]: Error in numberOfNeurons.")} else {}
					if (!(activationFunction %in% KnownActivationFunctions)) 		{stop("[rbfLayer Validation]: Error, unknown activation function")} else {}
					if (!(normalizationMethod %in% KnownNormalizationMethods)) 	{stop("[rbfLayer Validation]: Error, unknown normalization method")} else {}
					if(!is.finite(numberOfNeurons))								{stop("[mlpLayer Validation]: Error, numberOfNeurons is not finite")} else {}
					if(!is.finite(threshold))									{stop("[mlpLayer Validation]: Error, threshold is not finite")} else {}
					if(!is.finite(width))										{stop("[mlpLayer Validation]: Error, width is not finite")} else {}
					if(!is.finite(altitude))										{stop("[mlpLayer Validation]: Error, altitude is not finite")} else {}
					if(length(numberOfNeurons)!=1)								{stop("[mlpLayer Validation]: Error, length(numberOfNeurons)!=1")} else {}
					if(length(threshold)!=1)										{stop("[mlpLayer Validation]: Error, length(threshold)!=1")} else {}
					if(length(width)!=1)											{stop("[mlpLayer Validation]: Error, length(width)!=1")} else {}
					if(length(altitude)!=1)										{stop("[mlpLayer Validation]: Error, length(altitude)!=1")} else {}
					
					# TODO in fact , threshold, width and altitude might be missing FIX this		. May be the neurons as well, e.g, the width is set globally in the network			
					callSuper(...)				
				}
		)
)

grbfLayer$accessors(c("numberOfNeurons", "activationFunction", "normalizationMethod", "threshold", "width", "altitude"))
#TODO rename these methods to distinguish from those of the list. Do the same in mlpLayer
