################################################################################
#
# 	Class definition: listAMORE
# 	Methods: add, show
#
################################################################################
setClassUnion("AMORElistElement", c("Con")) 
#ÊTODO Remember to add other elements like Neuron, etc, ...

gListAMORE <- setRefClass("listAMORE",
  fields=list(
    ldata="list"
  ),
  methods= list(
	
    push_back=function(value, ...){
      ldata <<- c(ldata, value)
    },
	
	append=function(value, ...){
		ldata <<- c(ldata, value$getLdata(...))
	},
	
	
    show=function(...) {
    'Generic print function for the listAMORE class. 
    '
    lapply(ldata, function(x){x$show(...)})
    return(invisible(TRUE))
  	},

	validate=function(...){
		'Object validator for internal coherence.
		'
		lapply(ldata, function(x){if (!is(x,"AMORElistElement")) {stop("[listAMORE validate]: Element is not an AMORElistElement")}  })
		lapply(ldata, function(x){x$validate(...)})
		return(TRUE)
	}

 	)
)

gListAMORE$accessors("ldata")


