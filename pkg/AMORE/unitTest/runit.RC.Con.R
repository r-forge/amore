# Unit Tests for the Con class methods
# 
# Author: mcasl
###############################################################################


test.gCon.new.fromIsNumeric <- function() {	
	myCon <- gCon$new(from=1, weight=14.5)  # from is numeric
	checkTrue(myCon$validate())
	checkEquals(myCon$getFrom(),1)	
	checkEquals(myCon$getFromId(),1)	
	checkEquals(myCon$getWeight(),14.5)
}


test.gCon.new.fromIsNeuron <- function() {
	my1stCon <- gCon$new(from=1, weight=14.5)
	myListCon <- gListCon$new()
	myListCon$addToLdata(my1stCon)
	myNeuron <- gNeuron$new(id=10, con=myListCon)
	myCon <- gCon$new(from=myNeuron, weight=14.5)  # from is neuron
	checkTrue(is(myCon,"Con"))
	checkTrue(myCon$validate())
	checkTrue(is(myCon$getFrom(),"numericOrNeuron"))
	checkTrue(is(myCon$getFrom(),"Neuron"))
	checkEquals(myCon$getFrom()$getId(),10)
	checkEquals(myCon$getFromId(),10)	
	checkEquals(myCon$getFrom(), myNeuron)
	# Check for collateral effects
	my1stCon$setWeight(22)
	checkEquals(myNeuron$getWeight(), 22)
	# As it can be seen, once my1stCon is assigned to myNeuron, a change in my1stCon has impact on myNeuron	
	checkEquals(myCon$getWeight(),14.5)	
}


test.gCon.getFrom.fromIsNumeric  <- function() {
	#from is a numeric
	myCon <- gCon$new(from=10, weight=14.5)
	checkEquals(myCon$getFrom(),10)	
	checkTrue(is.vector(myCon$getFrom()))
	checkEquals(length(myCon$getFrom()),1)
}


test.gCon.getFrom.fromIsNeuron <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:3,WEIGHT=c(1.4,5.6,9.8))
	myNeuron <- gNeuron$new(id=10, con=lc)
	myCon <- gCon$new(from=myNeuron, weight=14.5)
	checkTrue(myCon$validate())
	checkTrue(is(myCon$getFrom(),"Neuron"))
	checkEquals(myCon$getFrom()$getId(),10)
	checkEquals(myCon$getFrom()$getWeight(),c(1.4,5.6,9.8))
	checkEquals(myCon$getFrom()$getFrom(),1:3)
	checkEquals(myCon$getFrom(), myNeuron)
}


test.gCon.getWeight  <- function() {
	myCon <- gCon$new(from=1, weight=14.5)
	checkEquals(myCon$getWeight(),14.5)	
	checkTrue(is.vector(myCon$getWeight()))
	checkEquals(length(myCon$getWeight()),1)
}


test.gCon.setFrom <- function() {
	myCon <- gCon$new(from=1, weight=14.5)
	myCon$setFrom(10)
	checkEquals(myCon$getFrom(),10)	
	checkTrue(is.vector(myCon$getFrom()))
	checkEquals(length(myCon$getFrom()),1)
}


test.gCon.setWeight  <- function() {
	myCon <- gCon$new(from=1, weight=14.5)
	myCon$setWeight(1.5)
	checkEquals(myCon$getWeight(),1.5)
	checkTrue(is.vector(myCon$getWeight()))
	checkEquals(length(myCon$getWeight()),1)
}


test.gCon.show  <- function() {
	myCon <- gCon$new(from=1, weight=14.5)
	checkTrue(myCon$show())
}


test.gCon.validate  <- function() {
	myCon <- gCon$new(from=1, weight=14.5)
	checkTrue(myCon$validate())
	myCon$setWeight(1:5)
	checkException(myCon$validate(), silent=TRUE)
	myCon$setWeight("xx")
	checkException(myCon$validate(), silent=TRUE)
	myCon$setWeight(5)
	myCon$setFrom(1:5)
	checkException(myCon$validate(), silent=TRUE)
	checkException(myCon$setFrom("xx"), silent=TRUE)
}



