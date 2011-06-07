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
    collection="list"
  ),
  methods= list(

	load=function( ... ){
		return(collection)
	},
	
	store=function(value, ...){
		collection <<- value
	},
	
    push_back=function(value, ...){
      collection <<- c(collection, value)
    },
	
	append=function(value, ...){
		collection <<- c(collection, value$load(...))
	},
	
	
    show=function(...) {
    'Generic print function for the listAMORE class. 
    '
    lapply(collection, function(x){x$show(...)})
    return(invisible(TRUE))
  	},

	validate=function(...){
		'Object validator for internal coherence.
		'
		lapply(collection, function(x){if (!is(x,"AMORElistElement")) {stop("[listAMORE validate]: Element is not an AMORElistElement")}  })
		lapply(collection, function(x){x$validate(...)})
		return(TRUE)
	}

 	)
)




