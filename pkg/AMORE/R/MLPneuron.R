
################################################################################
#
#   Class definition: MLPneuron
#
################################################################################

gMLPneuron <- setRefClass("MLPneuron",
  contains="Neuron",
  fields= list(
  	bias = "numeric"
  ),
  
  methods= list( 
    show=function(...){
	  	cat("\n------------------------------")
		  cat("\n Id: ", id)
	  	cat("\n-----------------")
		  cat("\n Bias: ", bias)
  		cat("\n------------------------------")
		  con$show()
  		cat("\n------------------------------")
	  },
    validate=function(...){
  	  if(length(bias)!=1) {stop("[MLPneuron: Validation] MLPneuron@bias must have length 1") } else {}
      callSuper(...)
    }
    
  )
)



gMLPneuron$accessors("bias")



  
