################################################################################
#
#   Class definition: Neuron
#
################################################################################

gNeuron <- setRefClass("Neuron",
		fields= list(
				id = "numeric",
				con = "listCon"
		),
		
		methods= list(
				
				getFrom=function(...) {
					return(con$getFrom(...))
				},
				
				getWeight=function(...) {
					return(con$getWeight(...))
				},
				
				setFrom=function(value, ...) {
					con$setFrom(value, ...)
				},
				
				setWeight=function(value, ...) {
					con$setWeight(value, ...)
				}, 
				
				addCon= function(value, ...) { 
					con$addToLdata(value, ...)
				},
				
				deleteCon= function(FROM, ...) {
					con$delete(FROM, ...)
				},
				
				numOfCons=function(...){
					return(con$numOfCons(...))  		
				},
				
				show=function() {
					'Customized print function 
							'
					cat("\n------------------------\n")
					cat("\n Id: ", id)
					cat("\n------------------------\n")
					con$show()
					cat("\n------------------------\n")
					return(invisible(TRUE))
				},
				
				validate=function(){
					'Object validator for internal coherence.
							'
					if(!is.finite(id)) {stop("[NeuronClass: Validate] id is not finite") } else {}
					if(length(id)!=1) {stop("[NeuronClass: Validate] id must have length 1") } else {}
					con$validate()
					return(TRUE)    
				}
		)
)

gNeuron$accessors(c("id","con"))

setIs("Neuron", "numericOrNeuron") 


