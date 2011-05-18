# TODO: Add comment
# 
# Author: mcasl
###############################################################################
gListLayer <- setRefClass("listLayer",
		contains="listAMORE",
	
		methods = list(	
				getId = function(...){
					return(lapply(ldata, function(x){x$getId(...)}))	
				},
			validate = function(...){
				if (anyDuplicated(c(getId(...), recursive=TRUE))>0) {	stop("[listLayer: Validation] Neuron@id duplication error")} else {}
				return(TRUE)
			}
		)
)

#
#################################################################################
##
## 	Class: listLayer
## 	Method: delete
##	Parameters:
##		value: Positions of the list elements to be erased.
##
#################################################################################
#setMethod(f = "delete", signature = "listLayer",
#		definition = function(.Object, ...) {
#			deleteElements <- function(.Object, value) {
#				
#				aux <- seq(along=.Object) 
#				aux <- seq(along=aux)[aux %in% value]
#				if (length(aux)>0) {
#					.Object@.Data <- .Object@.Data[-aux]	       
#					validObject(.Object)
#				}
#				return(.Object)
#			}
#			
#			nameObject <- deparse(substitute(.Object))
#			assign(nameObject,deleteElements(.Object, ...),envir=parent.frame())
#			return(invisible())
#		}
#)
#
#
#################################################################################
##
## 	Class: listLayer
## 	Method: numberOfCons
##
#################################################################################
#setMethod(
#		f = "numberOfCons",
#		signature = c(.Object="listLayer", POS="missing"),
#		definition = function(.Object, ...) {
#			return(lapply(.Object, numberOfCons))
#		}
#)
#
#setMethod(
#		f = "numberOfCons",
#		signature = c(.Object="listLayer", POS="numeric"),
#		definition = function(.Object, POS, ...) {
#			return(numberOfCons(select(.Object,POS=POS)))
#		}
#)
#
#
#################################################################################
##
## 	Class: listLayer
## 	Method: activationFunction
##
#################################################################################
#setMethod(
#		f = "activationFunction",
#		signature = "listLayer",
#		definition = function(.Object, ...) {
#			return(sapply(.Object, activationFunction))
#		}
#)
#
#setReplaceMethod(
#		f = "activationFunction",
#		signature = "listLayer",
#		definition = function(.Object, ..., value) {
#			if(length(value)!=length(.Object)) {stop("[listLayer setReplaceMethod activationFunction<-] Error: Incorrect length value.")}
#			value <- c(value, recursive=TRUE)
#			for ( i in seq(along=.Object)) {
#				activationFunction(.Object[[i]]) <-  value[i]
#			}
#			return(.Object)
#		}
#)
#
#################################################################################
##
## 	Class: listLayer
## 	Method: altitude
##
#################################################################################
#setMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="missing", POS="missing"),
#		definition = function(.Object, ...) {
#			return(sapply(.Object, altitude))
#		}
#)
#
#setMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="numeric", POS="missing"),
#		definition = function(.Object, ID, ...) {	 
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setMethod altitude(ID=\"numeric\",POS=\"missing\") Error]: ID values not found in the Neuron$id slots.")}
#			result <- numeric(0)
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					result <- c(result, altitude(.Object[[i]], ID=idLayer[idLayerID]))
#				}
#			}
#			return(result)   
#		}
#)
#
#
#setMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="matrix", POS="missing"),
#		definition = function(.Object, ID, ...) {	 
#			ID <- as.vector(ID)
#			return(altitude(.Object, ID=ID))   
#		}
#)
#
#
#setMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="missing", POS="numeric"),
#		definition = function(.Object, POS, ...) {	 
#			return(sapply(select(.Object, POS), altitude))
#		}
#)
#
#
#setMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="numeric", POS="numeric"),
#		definition = function(.Object, ID, POS, ...) {
#			if (length(POS)>1) {stop("[listLayer setMethod altitude(ID=\"numeric\", POS=\"numeric\")]: Error: POS must be a numerical single value.")}
#			return(altitude(select(.Object, POS), ID=ID))
#		}
#)
#
#
#setMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="matrix", POS="numeric"),
#		definition = function(.Object, ID, POS, ...) {	 
#			ID <- as.vector(ID)
#			return(altitude(.Object, ID=ID, POS=POS))   
#		}
#)
#
#
#########
#########
#
#setReplaceMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="missing", POS="missing"),
#		definition = function(.Object, ..., value) {
#			if(length(value)!=length(.Object)) {stop("[listLayer setReplaceMethod altitude(ID=\"missing\", POS=\"missing\")<-] Error: Incorrect length of value.")}
#			for ( i in seq(along=.Object)) {
#				altitude(.Object[[i]]) <- value[[i]]	 
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#setReplaceMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="numeric", POS="missing"),
#		definition = function(.Object, ID, ..., value) {	 
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setReplaceMethod altitude(ID=\"numeric\",POS=\"missing\")<- ] Error: ID values not found in the Neuron$id slots.")}
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					altitude(.Object[[i]], ID=idLayer[idLayerID]) <- value[idValue]
#				}
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="matrix", POS="missing"),
#		definition = function(.Object, ID, ..., value) {	 
#			ID <- as.vector(ID)
#			altitude(.Object, ID=ID) <- value
#			return(.Object)   
#		}
#)
#
#
#setReplaceMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="missing", POS="numeric"),
#		definition = function(.Object, POS, ..., value) {
#			value <- makeList(value)
#			if(length(value)!=length(POS)) {stop("[listLayer setReplaceMethod altitude(ID=\"missing\", POS=\"numeric\")<-] Error: Incorrect length of value.")}
#			for (i in seq(along=POS)) {
#				altitude(.Object[[POS[i]]]) <- value[[i]]
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="numeric", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {
#			if(length(POS)>1) {stop("[listLayer setReplaceMethod altitude(ID=\"missing\", POS=\"numeric\")<-] Error: Incorrect length of POS.")}
#			altitude(.Object[[POS]], ID=ID) <- value
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "altitude",
#		signature = c(.Object="listLayer", ID="matrix", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {	 
#			ID <- as.vector(ID)
#			altitude(.Object, ID=ID, POS=POS) <- value
#			return(.Object)
#		}
#)
#
#
#
#################################################################################
##
## 	Class: listLayer
## 	Method: width
##
#################################################################################
#setMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="missing", POS="missing"),
#		definition = function(.Object, ...) {
#			return(sapply(.Object, width))
#		}
#)
#
#setMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="numeric", POS="missing"),
#		definition = function(.Object, ID, ...) {	 
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setMethod width(ID=\"numeric\",POS=\"missing\") Error]: ID values not found in the Neuron$id slots.")}
#			result <- numeric(0)
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					result <- c(result, width(.Object[[i]], ID=idLayer[idLayerID]))
#				}
#			}
#			return(result)   
#		}
#)
#
#
#setMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="matrix", POS="missing"),
#		definition = function(.Object, ID, ...) {	 
#			ID <- as.vector(ID)
#			return(width(.Object, ID=ID))   
#		}
#)
#
#
#setMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="missing", POS="numeric"),
#		definition = function(.Object, POS, ...) {	 
#			return(sapply(select(.Object, POS), width))
#		}
#)
#
#
#setMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="numeric", POS="numeric"),
#		definition = function(.Object, ID, POS, ...) {
#			if (length(POS)>1) {stop("[listLayer setMethod width(ID=\"numeric\", POS=\"numeric\")]: Error: POS must be a numerical single value.")}
#			return(width(select(.Object, POS), ID=ID))
#		}
#)
#
#
#setMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="matrix", POS="numeric"),
#		definition = function(.Object, ID, POS, ...) {	 
#			ID <- as.vector(ID)
#			return(width(.Object, ID=ID, POS=POS))   
#		}
#)
#
#
#########
#########
#
#setReplaceMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="missing", POS="missing"),
#		definition = function(.Object, ..., value) {
#			if(length(value)!=length(.Object)) {stop("[listLayer setReplaceMethod width(ID=\"missing\", POS=\"missing\")<-] Error: Incorrect length of value.")}
#			for ( i in seq(along=.Object)) {
#				width(.Object[[i]]) <- value[[i]]	 
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#setReplaceMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="numeric", POS="missing"),
#		definition = function(.Object, ID, ..., value) {	 
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setReplaceMethod width(ID=\"numeric\",POS=\"missing\")<- ] Error: ID values not found in the Neuron$id slots.")}
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					width(.Object[[i]], ID=idLayer[idLayerID]) <- value[idValue]
#				}
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="matrix", POS="missing"),
#		definition = function(.Object, ID, ..., value) {	 
#			ID <- as.vector(ID)
#			width(.Object, ID=ID) <- value
#			return(.Object)   
#		}
#)
#
#
#setReplaceMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="missing", POS="numeric"),
#		definition = function(.Object, POS, ..., value) {
#			value <- makeList(value)
#			if(length(value)!=length(POS)) {stop("[listLayer setReplaceMethod width(ID=\"missing\", POS=\"numeric\")<-] Error: Incorrect length of value.")}
#			for (i in seq(along=POS)) {
#				width(.Object[[POS[i]]]) <- value[[i]]
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="numeric", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {
#			if(length(POS)>1) {stop("[listLayer setReplaceMethod width(ID=\"missing\", POS=\"numeric\")<-] Error: Incorrect length of POS.")}
#			width(.Object[[POS]], ID=ID) <- value
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "width",
#		signature = c(.Object="listLayer", ID="matrix", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {	 
#			ID <- as.vector(ID)
#			width(.Object, ID=ID, POS=POS) <- value
#			return(.Object)
#		}
#)
#
#
#################################################################################
##
## 	Class: listLayer
## 	Method: bias
##
#################################################################################
#setMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="missing", POS="missing"),
#		definition = function(.Object, ...) {
#			return(sapply(.Object, bias))
#		}
#)
#
#setMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="missing", POS="numeric"),
#		definition = function(.Object, POS, ...) {	 
#			return(sapply(select(.Object, POS), bias))
#		}
#)
#
#
#setMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="numeric", POS="missing"),
#		definition = function(.Object, ID, ...) {
#			
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setMethod bias(ID=\"numeric\",POS=\"missing\")<- Error]: ID values not found in the Neuron$id slots.")}
#			result <- numeric(0)
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					result <- c(result, bias(.Object[[i]], ID=idLayer[idLayerID]))
#				}
#			}
#			return(result)   
#		}
#)
#
#
#setMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="numeric", POS="numeric"),
#		definition = function(.Object, ID, POS, ...) {
#			if(length(POS)>1) {stop("[listLayer setMethod bias(ID=\"numeric\",POS=\"numeric\")<- Error]: Incorrect POS length.")}
#			return(bias(.Object[[POS]], ID=ID))
#		}
#)
#
#
#setMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="matrix", POS="numeric"),
#		definition = function(.Object, ID, POS, ...) {
#			ID <- as.vector(ID)
#			return(bias(.Object, ID=ID, POS=POS))
#		}
#)
#
#
#setMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="matrix", POS="missing"),
#		definition = function(.Object, ID, ...) {
#			ID <- as.vector(ID)
#			return(bias(.Object, ID=ID))   
#		}
#)
#
#
#################################################################################
##
## 	Class: listLayer
## 	ReplaceMethod: bias
##	Parameters:
##		.Object: An object of class listLayer
##		POS: The position of the layers to be returned
##		ID: Id's of the neurons to modify
#################################################################################
#
#setReplaceMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="missing", POS="missing"),
#		definition = function(.Object, ..., value) {
#			if(is.vector(value)) {
#				if (is.list(value)) {
#					if(length(.Object@.Data)!=length(value)) { stop("[listLayer setReplaceMethod bias(ID=\"missing\", POS=\"missing\")<- Error]: Incorrect length(value)" )}
#					for (i in seq(.Object)) {
#						bias(.Object[[i]]) <- value[[i]]  
#					}
#				} else {
#					if(length(.Object@.Data)>1) { stop("[listLayer setReplaceMethod bias(ID=\"missing\", POS=\"missing\")<- Error]: Incorrect POS length." )}
#					bias(.Object[[1]]) <- value  
#				}
#			} else if(is.matrix(value) | is.data.frame(value)) {
#				if(length(.Object@.Data)!=ncol(value)) { stop("[listLayer setReplaceMethod bias(ID=\"missing\", POS=\"missing\")<- Error]: Incorrect ncol(value)" )}
#				for (i in seq(.Object)) {
#					bias(.Object[[i]]) <- value[,i]  
#				}	    
#			} else {
#				stop("[listLayer setReplaceMethod bias(ID=\"missing\", POS=\"missing\") Error:] Value must be either a data.frame, array, matrix or a list")
#			}
#			validObject(.Object)
#			return(.Object)   
#		}
#)
#
#setReplaceMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="missing", POS="numeric"),
#		definition = function(.Object, POS, ..., value) {
#			idObject <- seq(along=.Object)
#			myMatch <- match(POS, idObject)
#			if (any(is.na(myMatch))) {stop("[listLayer setReplaceMethod bias(ID=\"missing\", POS=\"numeric\")<- Error]: Your POS vector contains incorrect values.")}
#			
#			if(is.vector(value)) {
#				if (is.list(value)) {
#					if(length(POS)!=length(value)) { stop("[listLayer setReplaceMethod bias(ID=\"missing\", POS=\"numeric\")<- Error]: Incorrect length(value)" )}
#					for (i in seq(along=POS)) {
#						bias(.Object[[POS[i]]]) <- value[[i]]  
#					}
#				} else {
#					if(length(POS)>1) { stop("[listLayer setReplaceMethod bias(ID=\"missing\", POS=\"numeric\")<- Error]: Incorrect POS length." )}
#					bias(.Object[[POS]]) <- value
#				}
#			} else if(is.matrix(value) | is.data.frame(value)) {
#				if(length(POS)!=ncol(value)) { stop("[listLayer setReplaceMethod bias(ID=\"missing\", POS=\"numeric\")<- Error]: Incorrect ncol(value)" )}
#				for (i in seq(along=POS)) {
#					bias(.Object[[POS[i]]]) <- value[,i]  
#				}	    
#			} else {
#				stop("[listLayer setReplaceMethod bias(ID=\"missing\", POS=\"numeric\") Error:] Value must be either a vector, data.frame, array, matrix or a list")
#			}
#			validObject(.Object)
#			return(.Object)   
#		}
#)
#
#
#setReplaceMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="numeric", POS="missing"),
#		definition = function(.Object, ID, ..., value) {
#			
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setReplaceMethod bias(ID=\"numeric\",POS=\"missing\")<- Error]: ID values not found in the Neuron$id slots.")}
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					bias(.Object[[i]], ID=idLayer[idLayerID]) <- value[idValue]
#				}
#			}
#			validObject(.Object)
#			return(.Object)   
#		}
#)
#
#setReplaceMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="matrix", POS="missing"),
#		definition = function(.Object, ID, ..., value) {
#			ID <- as.vector(ID)
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setReplaceMethod bias(ID=\"numeric\",POS=\"missing\")<- Error]: ID values not found in the Neuron$id slots.")}
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					bias(.Object[[i]], ID=idLayer[idLayerID]) <- value[idValue]
#				}
#			}
#			validObject(.Object)
#			return(.Object)   
#		}
#)
#
#
#setReplaceMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="numeric", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {
#			if(length(POS)>1) { stop("[listLayer setReplaceMethod bias(ID=\"numeric\", POS=\"numeric\")<- Error]: Incorrect POS length." )}
#			myMatch <- match(POS, seq(along=.Object))
#			if (any(is.na(myMatch))) {stop("[listLayer setReplaceMethod bias(ID=\"numeric\", POS=\"numeric\")<- Error]: Your POS vector contains incorrect values.")}	 
#			if(is.vector(value)) {
#				if (is.list(value)) {
#					bias(.Object[[POS[i]]], ID) <- value[[i]]  
#				} else {
#					bias(.Object[[POS]], ID) <- value
#				}
#			} else if(is.matrix(value) | is.data.frame(value)) {
#				if(ncol(value)>1) { stop("[listLayer setReplaceMethod bias(ID=\"numeric\", POS=\"numeric\")<- Error]: Incorrect ncol(value)" )}
#				bias(.Object[[POS]], ID) <- value[,1]	    
#			} else {
#				stop("[listLayer setReplaceMethod bias(ID=\"numeric\", POS=\"numeric\") Error:] Value must be either a vector, data.frame, array, matrix or a list")
#			}
#			validObject(.Object)
#			return(.Object)
#			
#		}
#)
#
#
#setReplaceMethod(
#		f = "bias",
#		signature = c(.Object="listLayer", ID="matrix", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {
#			ID <- as.vector(ID)
#			bias(.Object, ID=ID, POS=POS) <- value  
#			validObject(.Object)
#			return(.Object)
#			
#		}
#)
#
#################################################################################
##
## 	Class: listLayer
## 	Method: from
##
#################################################################################
#setMethod(
#		f = "from",
#		signature = c(.Object="listLayer", ID="missing", POS="missing"),
#		definition = function(.Object, ...) {
#			return(lapply(.Object, from))
#		}
#)
#
#setMethod(
#		f = "from",
#		signature = c(.Object="listLayer", ID="missing",POS="numeric"),
#		definition = function(.Object, POS, ...) {	 
#			return(lapply(select(.Object, POS), from))
#		}
#)
#
#
#setMethod(
#		f = "from",
#		signature = c(.Object="listLayer", ID="numeric",POS="numeric"),
#		definition = function(.Object, ID, POS, ...) {
#			if(length(POS)>1) {stop("[listLayer setMethod from] Error: Incorrect length(POS).")}
#			return(list(from(.Object[[POS]], ID=ID)))
#		}
#)
#
#
#setMethod(
#		f = "from",
#		signature = c(.Object="listLayer", ID="numeric",POS="missing"),
#		definition = function(.Object, ID, ...) {
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setMethod from(ID=\"numeric\",POS=\"missing\")<- Error]: ID values not found in the Neuron$id slots.")}
#			result <- list()
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					result <- c(result, list(from(.Object[[i]], ID=idLayer[idLayerID])))
#				}
#			}
#			return(result)       
#		}
#)
#
#
#setMethod(
#		f = "from",
#		signature = c(.Object="listLayer", ID="matrix",POS="numeric"),
#		definition = function(.Object, ID, POS, ...) {
#			ID <- as.vector(ID)
#			return(from(.Object, ID=ID, POS=POS))
#		}
#)
#
#
#setMethod(
#		f = "from",
#		signature = c(.Object="listLayer", ID="matrix",POS="missing"),
#		definition = function(.Object, ID, ...) {
#			ID <- as.vector(ID)
#			return(from(.Object, ID=ID))
#		}
#)
#
#################
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="missing", ID="missing", POS="missing"),
#		definition = function(.Object, ..., value) {
#			value <- makeList(value, numberOfNeurons=numberOfNeurons(.Object)) 
#			for(i in seq(along=.Object)) {
#				from(.Object[[i]]) <- value[[i]]
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="missing", ID="numeric", POS="missing"),
#		definition = function(.Object, ID, ..., value) {
#			value <- makeList(value, numberOfNeurons=rep(1,length(ID))) 
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setReplaceMethod from(FROM=\"missing\", ID=\"numeric\",POS=\"missing\")<- Error]: ID values not found in the Neuron$id slots.")}
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					from(.Object[[i]], ID=idLayer[idLayerID]) <- value[idValue]
#				}
#			}
#			validObject(.Object)
#			return(.Object) 
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="missing", ID="matrix", POS="missing"),
#		definition = function(.Object, ID, ..., value) {
#			ID <- as.vector(ID)
#			from(.Object, ID=ID) <- value
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="numeric", ID="missing", POS="missing"),
#		definition = function(.Object, FROM, ..., value) {
#			stop("[listLayer setReplaceMethod from(FROM=\"numeric\", ID=\"missing\",POS=\"missing\")<- ] Error: Do you think that this signature makes sense. If you do, please write the code yourself.")
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="numeric", ID="numeric", POS="missing"),
#		definition = function(.Object, FROM, ID, ..., value) {
#			value <- makeList(value, numberOfNeurons=length(value))
#			if (length(ID)>1) {stop("[listLayer setReplaceMethod from(FROM=\"numeric\", ID=\"numeric\",POS=\"missing\")<- Error]: Id must be a numerical single value.")}
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setReplaceMethod from(FROM=\"missing\", ID=\"numeric\",POS=\"missing\")<- Error]: ID values not found in the Neuron$id slots.")}
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				if(any(idLayerID)) {
#					from(.Object[[i]], ID=ID, FROM=FROM) <- value
#					validObject(.Object)
#					return(.Object) 
#				}
#			}
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="numeric", ID="matrix", POS="missing"),
#		definition = function(.Object, FROM, ID, ..., value) {
#			ID <- as.vector(ID)
#			from(.Object, FROM=FROM, ID=ID) <- value
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="matrix", ID="missing", POS="missing"),
#		definition = function(.Object, FROM, ..., value) {
#			FROM <- as.vector(FROM)
#			from(.Object, FROM=FROM) <- value
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="matrix", ID="numeric", POS="missing"),
#		definition = function(.Object, FROM, ID, ..., value) {
#			FROM <- as.vector(FROM)
#			from(.Object, FROM=FROM, ID=ID) <- value
#			return(.Object)
#		}
#)
#
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="matrix", ID="matrix", POS="missing"),
#		definition = function(.Object, FROM, ID, ..., value) {
#			FROM <- as.vector(FROM)
#			ID <- as.vector(ID)
#			from(.Object, FROM=FROM, ID=ID) <- value
#			return(.Object)
#		}
#)
#
#
########
########
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="missing", ID="missing", POS="numeric"),
#		definition = function(.Object, POS, ..., value) {
#			value <- makeList(value, numberOfNeurons=numberOfNeurons(.Object,POS=POS)) 
#			if(any( !(POS %in% seq(along=.Object)))) {stop("[listLayer setReplaceMethod from(FROM=\"missing\", ID=\"missing\",POS=\"numeric\") Error]: POS value not found.")}	
#			if (length(POS)!=length(value)) {stop("[listLayer setReplaceMethod from(FROM=\"missing\", ID=\"missing\", POS=\"numeric\")] Error: Incorrect value length.")}
#			for(i in seq(along=POS)) {
#				from(.Object[[POS[i]]]) <- value[i]
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="missing", ID="numeric", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {
#			if (length(POS)!=1) {stop("[listLayer setReplaceMethod from(FROM=\"missing\", ID=\"numeric\", POS=\"numeric\")] Error: Incorrect POS length.")}
#			from(.Object[[POS]], ID=ID) <- value
#			validObject(.Object)
#			return(.Object) 
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="missing", ID="matrix", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {
#			ID <- as.vector(ID)
#			from(.Object, ID=ID, POS=POS) <- value
#			return(.Object)
#		}
#) 
#
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="numeric", ID="missing", POS="numeric"),
#		definition = function(.Object, FROM, POS, ..., value) {
#			stop("[listLayer setReplaceMethod from(FROM=\"numeric\", ID=\"missing\",POS=\"numeric\")<- ] Error: Do you think that this signature makes sense. If you do, please write the code yourself.")
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="numeric", ID="numeric", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ..., value) {
#			value <- makeList(value, numberOfNeurons=length(value))
#			if(any( !(POS %in% seq(along=.Object)))) {stop("[listLayer setReplaceMethod from(FROM=\"numeric\", ID=\"numeric\",POS=\"numeric\") Error]: POS value not found.")}	
#			if (length(POS)>1) {stop("[listLayer setReplaceMethod from(FROM=\"numeric\", ID=\"numeric\",POS=\"numeric\")<- Error]: POS must be a numerical single value.")}
#			if (length(ID)>1) {stop("[listLayer setReplaceMethod from(FROM=\"numeric\", ID=\"numeric\",POS=\"numeric\")<- Error]: ID must be a numerical single value.")}
#			from(.Object[[POS]], ID=ID, FROM=FROM) <- value
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="numeric", ID="matrix", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ..., value) {
#			ID <- as.vector(ID)
#			from(.Object, FROM=FROM, ID=ID, POS=POS) <- value
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="matrix", ID="missing", POS="numeric"),
#		definition = function(.Object, FROM, POS, ..., value) {
#			FROM <- as.vector(FROM)
#			from(.Object, FROM=FROM, POS=POS) <- value
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="matrix", ID="numeric", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ..., value) {
#			FROM <- as.vector(FROM)
#			from(.Object, FROM=FROM, ID=ID, POS=POS) <- value
#			return(.Object)
#		}
#)
#
#
#setReplaceMethod(
#		f = "from",
#		signature = c(.Object="listLayer", FROM="matrix", ID="matrix", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ..., value) {
#			FROM <- as.vector(FROM)
#			ID <- as.vector(ID)
#			from(.Object, FROM=FROM, ID=ID, POS=POS) <- value
#			return(.Object)
#		}
#)
#
#
#
#################################################################################
##
## 	Class: listLayer
## 	Method: id
##
#################################################################################
#setMethod(
#		f = "id",
#		signature = c(.Object="listLayer", POS="missing"),
#		definition = function(.Object, ...) {
#			return(sapply(.Object, id))
#		}
#)
#
#setMethod(
#		f = "id",
#		signature = c(.Object="listLayer", POS="numeric"),
#		definition = function(.Object, POS, ...) {
#			return(sapply(select(.Object, POS), id))
#		}
#)
#
#
#################################################################################
##
## 	Class: listLayer
## 	Method: id
##
#################################################################################
#setReplaceMethod(
#		f = "id",
#		signature = c(.Object="listLayer", ID="missing", POS="missing"),
#		definition = function(.Object, ..., value) {
#			value <- makeList(value, numberOfNeurons=numberOfNeurons(.Object))
#			for (i in seq(.Object)) {
#				id(.Object[[i]]) <- value[[i]]  
#			}
#			validObject(.Object)
#			return(.Object)   
#		}
#)
#
#setReplaceMethod(
#		f = "id",
#		signature = c(.Object="listLayer", ID="missing", POS="numeric"),
#		definition = function(.Object, POS, ..., value) {
#			value <- makeList(value, numberOfNeurons=numberOfNeurons(.Object, POS=POS))
#			myMatch <- match(POS, seq(along=.Object))
#			if (any(is.na(myMatch))) {stop("[listLayer setReplaceMethod id(ID=\"missing\", POS=\"numeric\")<- Error]: Your ID vector contains incorrect values.")}
#			if(length(POS)!=length(value)) { stop("[listLayer setReplaceMethod id(ID=\"missing\", POS=\"numeric\")<- Error]: Incorrect length(value)" )}
#			for (i in seq(along=POS)) {
#				id(.Object[[POS[i]]]) <- value[[i]]  
#			}
#			validObject(.Object)
#			return(.Object)   
#		}
#)
#
#
#
#setReplaceMethod(
#		f = "id",
#		signature = c(.Object="listLayer", ID="numeric", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {
#			if(length(POS)>1) { stop("[listLayer setReplaceMethod id(ID=\"numeric\", POS=\"numeric\")<- Error]: POS must be a single value, not a vector, matrix, ... ." )} 
#			idObject <- seq(along=.Object)
#			myMatch <- match(POS, idObject)
#			if (any(is.na(myMatch))) {stop("[listLayer setReplaceMethod id(ID=\"numeric\", POS=\"numeric\")<- Error]: Your POS vector contains incorrect values.")}
#			if(is.vector(value)) {
#				if (is.list(value)) {
#					if(length(value)>1) { stop("[listLayer setReplaceMethod id(ID=\"numeric\", POS=\"numeric\")<- Error]: Incorrect length(value)" )}
#					id(.Object[[POS]], ID) <- value[[1]]  
#				} else {
#					id(.Object[[POS]], ID) <- value
#				}
#			} else if(is.matrix(value) | is.data.frame(value)) {
#				if(ncol(value)!=1) { stop("[listLayer setReplaceMethod id(ID=\"numeric\", POS=\"numeric\")<- Error]: Incorrect ncol(value)" )}
#				id(.Object[[POS]], ID) <- value[,1]  
#			} else {
#				stop("[listLayer setReplaceMethod id(ID=\"numeric\", POS=\"numeric\")<- Error:] Value must be either a vector, data.frame, array, matrix or a list")
#			}
#			validObject(.Object)
#			return(.Object)   
#		}
#)
#
#
#
#setReplaceMethod(
#		f = "id",
#		signature = c(.Object="listLayer", ID="numeric", POS="missing"),
#		definition = function(.Object, ID, ..., value) {
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setReplaceMethod id(ID=\"numeric\",POS=\"missing\")<- Error]: ID values not found in the Neuron$id slots.")}
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					id(.Object[[i]], ID=idLayer[idLayerID]) <- value[idValue]
#				}
#			}
#			validObject(.Object)
#			return(.Object)   
#		}
#)
#
#
#setReplaceMethod(
#		f = "id",
#		signature = c(.Object="listLayer", ID="matrix", POS="missing"),
#		definition = function(.Object, ID, ..., value) {
#			ID <- as.vector(ID)
#			id(.Object, ID=ID) <- value
#			return(.Object)   
#		}
#)
#
#
#setReplaceMethod(
#		f = "id",
#		signature = c(.Object="listLayer", ID="matrix", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {
#			ID <- as.vector(ID)
#			id(.Object, ID=ID, POS=POS) <- value
#			return(.Object)   
#		}
#)
#
#
#
#################################################################################
##
## 	Class: listLayer
## 	Method: select
##	Parameters:
##		.Object: An object of class listLayer
##		POS: The position of the layers to be returned
##
#################################################################################
#setMethod(
#		f = "select",
#		signature = "listLayer",
#		definition = function(.Object, POS, ...) {
#			idObject <- seq(along=.Object)
#			myMatch <- match(POS, idObject)
#			if (any(is.na(myMatch))) {stop("[listLayer setMethod select Error]: Your POS vector contains incorrect values.")}
#			idx <- seq(along=.Object) [- myMatch]
#			delete(.Object, idObject[idx])
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
#
#################################################################################
##
## 	Class: listLayer
## 	Method: neuron
##	Parameters:
##		.Object: An object of class listLayer
##		POS: The position of the layers to be returned
##
#################################################################################
#setMethod(
#		f = "neuron",
#		signature = c(.Object="listLayer", POS="missing"),
#		definition = function(.Object, ...) {
#			return(sapply(.Object, neuron))
#		}
#)
#
#setReplaceMethod(
#		f = "neuron",
#		signature = c(.Object="listLayer", POS="missing"),
#		definition = function(.Object, ..., value) {
#			if(length(value)!=length(.Object)) {stop("[listLayer setReplaceMethod neuron(ID=\"missing\")<-] Error: Incorrect length of value.")}
#			for ( i in seq(along=.Object)) {
#				neuron(.Object[[i]]) <- value[[i]]	 
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#setMethod(
#		f = "neuron",
#		signature = c(.Object="listLayer", POS="numeric"),
#		definition = function(.Object, POS, ...) {
#			return(neuron(select(.Object, POS)))
#		}
#)
#
#setReplaceMethod(
#		f = "neuron",
#		signature = c(.Object="listLayer", POS="numeric"),
#		definition = function(.Object, POS, ..., value) {
#			if(length(value)!=length(POS)) {stop("[listLayer setReplaceMethod neuron(ID=\"missing\")<-] Error: Incorrect length of value.")}
#			for ( i in seq(along=POS)) {
#				neuron(.Object[[POS[i]]]) <- value[[i]]	 
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
#
#################################################################################
##
## 	Class: listLayer
## 	Method: numberOfNeurons
##	Parameters:
##		.Object: An object of class listLayer
##		POS: The position of the layers to be returned
##
#################################################################################
#setMethod(
#		f = "numberOfNeurons",
#		signature = c(.Object="listLayer", POS="missing"),
#		definition = function(.Object, ...) {
#			return(sapply(.Object, numberOfNeurons))
#		}
#)
#
#
#setMethod(
#		f = "numberOfNeurons",
#		signature = c(.Object="listLayer", POS="numeric"),
#		definition = function(.Object, POS, ...) {
#			return(numberOfNeurons(select(.Object, POS)))
#		}
#)
#
#
#################################################################################
##
##    Class: listLayer
##    Method: weight
##    Parameters:
##	.Object: An object of class listLayer
##	FROM= a numeric vector
##	ID: a numeric vector that contains the Id's of the Neuron@id slot.
##	POS: a numeric vector with the position of the layers to be returned
##
#################################################################################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="missing", POS="missing"),
#		definition = function(.Object, ...) {
#			return(lapply(.Object, weight))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="missing", POS="missing"),
#		definition = function(.Object, ..., value) {
#			value <- makeList(value, numberOfNeurons=numberOfNeurons(.Object)) 
#			for(i in seq(along=.Object)) {
#				weight(.Object[[i]]) <- value[[i]]
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="numeric", POS="missing"),
#		definition = function(.Object, ID, ...) {
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setMethod weight(FROM=\"missing\", ID=\"numeric\",POS=\"missing\")<- Error]: ID values not found in the Neuron$id slots.")}
#			result <- list()
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					result <- c(result, list(weight(.Object[[i]], ID=idLayer[idLayerID])))
#				}
#			}
#			return(result)  
#		}
#)
#
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="numeric", POS="missing"),
#		definition = function(.Object, ID, ..., value) {
#			value <- makeList(value, numberOfNeurons=rep(1,length(ID))) 
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setReplaceMethod weight(FROM=\"missing\", ID=\"numeric\",POS=\"missing\")<- Error]: ID values not found in the Neuron$id slots.")}
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					weight(.Object[[i]], ID=idLayer[idLayerID]) <- value[idValue]
#				}
#			}
#			validObject(.Object)
#			return(.Object) 
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="matrix", POS="missing"),
#		definition = function(.Object, ID, ...) {
#			ID <- as.vector(ID)
#			return(weight(.Object, ID=ID))	
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="matrix", POS="missing"),
#		definition = function(.Object, ID, ..., value) {
#			ID <- as.vector(ID)
#			weight(.Object, ID=ID) <- value
#			return(.Object)
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="missing", POS="missing"),
#		definition = function(.Object, FROM, ...) {
#			stop("[listLayer setMethod weight(FROM=\"numeric\", ID=\"missing\",POS=\"missing\") ] Error: Do you think that this signature makes sense. If you do, please write the code yourself.")
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="missing", POS="missing"),
#		definition = function(.Object, FROM, ..., value) {
#			stop("[listLayer setReplaceMethod weight(FROM=\"numeric\", ID=\"missing\",POS=\"missing\")<- ] Error: Do you think that this signature makes sense. If you do, please write the code yourself.")
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="numeric", POS="missing"),
#		definition = function(.Object, FROM, ID, ...) {
#			if (length(ID)>1) {stop("[listLayer setMethod weight(FROM=\"numeric\", ID=\"numeric\",POS=\"missing\")<- Error]: Id must be a numerical single value.")}
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setMethod weight(FROM=\"numeric\", ID=\"numeric\",POS=\"missing\")<- Error]: ID value not found in the Neuron$id slots.")}
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				idValue    <- ID %in% idLayer
#				if(any(idLayerID)) {
#					return(weight(.Object[[i]], ID=ID, FROM=FROM))
#				}
#			}
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="numeric", POS="missing"),
#		definition = function(.Object, FROM, ID, ..., value) {
#			value <- makeList(value, numberOfNeurons=length(value))
#			if (length(ID)>1) {stop("[listLayer setReplaceMethod weight(FROM=\"numeric\", ID=\"numeric\",POS=\"missing\")<- Error]: Id must be a numerical single value.")}
#			idObject <- id(.Object)
#			if(any( !(ID %in% idObject))) {stop("[listLayer setReplaceMethod weight(FROM=\"missing\", ID=\"numeric\",POS=\"missing\")<- Error]: ID values not found in the Neuron$id slots.")}
#			for ( i in seq(length(.Object))) {
#				idLayer    <- idObject[,i]
#				idLayerID  <- idLayer %in% ID
#				if(any(idLayerID)) {
#					weight(.Object[[i]], ID=ID, FROM=FROM) <- value
#					validObject(.Object)
#					return(.Object) 
#				}
#			}
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="matrix", POS="missing"),
#		definition = function(.Object, FROM, ID, ...) {
#			ID <- as.vector(ID)
#			return(weight(.Object, FROM=FROM, ID=ID))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="matrix", POS="missing"),
#		definition = function(.Object, FROM, ID, ..., value) {
#			ID <- as.vector(ID)
#			weight(.Object, FROM=FROM, ID=ID) <- value
#			return(.Object)
#		}
#)
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="missing", POS="missing"),
#		definition = function(.Object, FROM, ...) {
#			FROM <- as.vector(FROM)
#			return(weight(.Object, FROM=FROM))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="missing", POS="missing"),
#		definition = function(.Object, FROM, ..., value) {
#			FROM <- as.vector(FROM)
#			weight(.Object, FROM=FROM) <- value
#			return(.Object)
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="numeric", POS="missing"),
#		definition = function(.Object, FROM, ID, ...) {
#			FROM <- as.vector(FROM)
#			return(weight(.Object, FROM=FROM, ID=ID))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="numeric", POS="missing"),
#		definition = function(.Object, FROM, ID, ..., value) {
#			FROM <- as.vector(FROM)
#			weight(.Object, FROM=FROM, ID=ID) <- value
#			return(.Object)
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="matrix", POS="missing"),
#		definition = function(.Object, FROM, ID, ...) {
#			FROM <- as.vector(FROM)
#			ID <- as.vector(ID)
#			return(weight(.Object, FROM=FROM, ID=ID))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="matrix", POS="missing"),
#		definition = function(.Object, FROM, ID, ..., value) {
#			FROM <- as.vector(FROM)
#			ID <- as.vector(ID)
#			weight(.Object, FROM=FROM, ID=ID) <- value
#			return(.Object)
#		}
#)
#
#
########
########
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="missing", POS="numeric"),
#		definition = function(.Object, POS, ...) {
#			return(weight(select(.Object, POS)))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="missing", POS="numeric"),
#		definition = function(.Object, POS, ..., value) {
#			value <- makeList(value, numberOfNeurons=numberOfNeurons(.Object,POS=POS)) 
#			if(any( !(POS %in% seq(along=.Object)))) {stop("[listLayer setReplaceMethod weight(FROM=\"missing\", ID=\"missing\",POS=\"numeric\") Error]: POS value not found.")}	
#			if (length(POS)!=length(value)) {stop("[listLayer setReplaceMethod weight(FROM=\"missing\", ID=\"missing\", POS=\"numeric\")] Error: Incorrect value length.")}
#			for(i in seq(along=POS)) {
#				weight(.Object[[POS[i]]]) <- value[i]
#			}
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="numeric", POS="numeric"),
#		definition = function(.Object, ID, POS, ...) {
#			return(weight(select(.Object, POS), ID=ID))
#		}
#)
#
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="numeric", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {
#			if (length(POS)!=1) {stop("[listLayer setReplaceMethod weight(FROM=\"missing\", ID=\"numeric\", POS=\"numeric\")] Error: Incorrect POS length.")}
#			weight(.Object[[POS]], ID=ID) <- value
#			validObject(.Object)
#			return(.Object) 
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="matrix", POS="numeric"),
#		definition = function(.Object, ID, POS, ...) {
#			ID <- as.vector(ID)
#			return(weight(.Object, ID=ID, POS=POS))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="missing", ID="matrix", POS="numeric"),
#		definition = function(.Object, ID, POS, ..., value) {
#			ID <- as.vector(ID)
#			weight(.Object, ID=ID, POS=POS) <- value
#			return(.Object)
#		}
#) 
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="missing", POS="numeric"),
#		definition = function(.Object, FROM, POS, ...) {
#			stop("[listLayer setMethod weight(FROM=\"numeric\", ID=\"missing\",POS=\"numeric\") ] Error: Do you think that this signature makes sense. If you do, please write the code yourself.")
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="missing", POS="numeric"),
#		definition = function(.Object, FROM, POS, ..., value) {
#			stop("[listLayer setReplaceMethod weight(FROM=\"numeric\", ID=\"missing\",POS=\"numeric\")<- ] Error: Do you think that this signature makes sense. If you do, please write the code yourself.")
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="numeric", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ...) {
#			return(weight(select(.Object, POS), FROM=FROM, ID=ID))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="numeric", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ..., value) {
#			value <- makeList(value, numberOfNeurons=length(value))
#			if(any( !(POS %in% seq(along=.Object)))) {stop("[listLayer setReplaceMethod weight(FROM=\"numeric\", ID=\"numeric\",POS=\"numeric\") Error]: POS value not found.")}	
#			if (length(POS)>1) {stop("[listLayer setReplaceMethod weight(FROM=\"numeric\", ID=\"numeric\",POS=\"numeric\")<- Error]: POS must be a numerical single value.")}
#			if (length(ID)>1) {stop("[listLayer setReplaceMethod weight(FROM=\"numeric\", ID=\"numeric\",POS=\"numeric\")<- Error]: ID must be a numerical single value.")}
#			weight(.Object[[POS]], ID=ID, FROM=FROM) <- value
#			validObject(.Object)
#			return(.Object)
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="matrix", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ...) {
#			ID <- as.vector(ID)
#			return(weight(.Object, FROM=FROM, ID=ID, POS=POS))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="numeric", ID="matrix", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ..., value) {
#			ID <- as.vector(ID)
#			weight(.Object, FROM=FROM, ID=ID, POS=POS) <- value
#			return(.Object)
#		}
#)
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="missing", POS="numeric"),
#		definition = function(.Object, FROM, POS, ...) {
#			FROM <- as.vector(FROM)
#			return(weight(.Object, FROM=FROM, POS=POS))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="missing", POS="numeric"),
#		definition = function(.Object, FROM, POS, ..., value) {
#			FROM <- as.vector(FROM)
#			weight(.Object, FROM=FROM, POS=POS) <- value
#			return(.Object)
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="numeric", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ...) {
#			FROM <- as.vector(FROM)
#			return(weight(.Object, FROM=FROM, ID=ID, POS=POS))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="numeric", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ..., value) {
#			FROM <- as.vector(FROM)
#			weight(.Object, FROM=FROM, ID=ID, POS=POS) <- value
#			return(.Object)
#		}
#)
#
#
###################
#setMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="matrix", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ...) {
#			FROM <- as.vector(FROM)
#			ID <- as.vector(ID)
#			return(weight(.Object, FROM=FROM, ID=ID, POS=POS))
#		}
#)
#
#setReplaceMethod(
#		f = "weight",
#		signature = c(.Object="listLayer", FROM="matrix", ID="matrix", POS="numeric"),
#		definition = function(.Object, FROM, ID, POS, ..., value) {
#			FROM <- as.vector(FROM)
#			ID <- as.vector(ID)
#			weight(.Object, FROM=FROM, ID=ID, POS=POS) <- value
#			return(.Object)
#		}
#)
#
#
#
#
#
#
#

