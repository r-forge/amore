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
				},

				validate = function(...){
					if(length(width)!=1) 	{ stop("[RBFneuron: Validation] RBFneuron$width must have length 1") } else {}
					if(length(altitude)!=1) { stop("[RBFneuron: Validation] RBFneuron$altitude must have length 1") } else {}
					callSuper(...)
				}				
		)
)

gRBFneuron$accessors(c("width","altitude"))


