################################################################################
#
# 	Class definition: RBFneuron
#
################################################################################

gRBFneuron <- setRefClass("RBFneuron",
		contains="Neuron",
		fields= list(
				width = "numeric",
				altitude = "numeric"
		),
		methods= list(
			
				show = function(...){
					cat("\n------------------------------")
					cat("\n Id: ", id)
					cat("\n-----------------")
					cat("\n Width: ", width)
					cat("\n-----------------")
					cat("\n Altitude: ", altitude)
					cat("\n------------------------------")
					getCon()$show()
					cat("\n------------------------------")
					return(invisible(TRUE))
				},

				validate = function(...){
					if(length(width)!=1) 	{ stop("[RBFneuron Validation]: Error, RBFneuron$width must have length 1") } else {}
					if(length(altitude)!=1) { stop("[RBFneuron Validation]: Error, RBFneuron$altitude must have length 1") } else {}
					if(!is.finite(width)) {stop("[RBFneuron Validation]: Error, is.finite(width) returned FALSE ")} else {}
					if(!is.finite(altitude)) {stop("[RBFneuron Validation] Error, is.finite(altitude) returned FALSE ")} else {}
					callSuper(...)
				}				
		)
)

gRBFneuron$accessors(c("width","altitude"))


