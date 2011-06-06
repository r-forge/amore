# Unit tests for the listCon class methods
# 
# Author: mcasl
###############################################################################


test.gListCon.new <- function() {
	lc <- gListCon$new()
	checkTrue(lc$validate())
}


test.gListCon.buildAndAppend_fromIsNumeric <- function() {
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=1:6, WEIGHT=11:16)
	checkTrue(   lc$validate())
	checkEquals( lc$getFrom(),1:6)
	checkEquals( lc$getId(),1:6)
	checkEquals( lc$getWeight(),11:16)
}


test.gListCon.buildAndAppend_fromIsNeuron <- function() {
	ln1 <- gListMLPneuron$new()
	ln1$buildAndAppend(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln1$validate())
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=ln1$load(), WEIGHT=5:1)
	checkEquals(gListMLPneuron$new(lc$getFrom())$getId(), 1:5)	# This is interesting, lc$getFrom() is returning a set of neurons in a simple list. In order to get their Ids you need to pack that list into a listMLPneuron object, and then call getId(). This approach allows to get a result from getFrom which combines numeric and neuron values.
	checkEquals(lc$getWeight(), 5:1)
}


test.gListCon.push_back <- function() {
	lc <- gListCon$new()
	c1 <- gCon$new(from=1, weight=14.5)
	c2 <- gCon$new(from=2, weight=24.5)
	c3 <- gCon$new(from=3, weight=34.5) 
	lc$push_back(c1)
	lc$push_back(c2)
	lc$push_back(c3)
	checkTrue(lc$validate())
	checkEquals( lc$getFrom(),1:3)
	checkEquals( lc$getWeight(),c(14.5,24.5,34.5))
	rm(lc, c1, c2, c3)
	lc <- gListCon$new()
	c1 <- gCon$new(from=1, weight=14.5)
	c2 <- gCon$new(from=2, weight=24.5)
	c3 <- gCon$new(from=3, weight=34.5) 
	lc$push_back(list(c1,c2, c3))
	checkTrue(lc$validate())
	checkEquals( lc$getFrom(),1:3)
	checkEquals( lc$getWeight(),c(14.5,24.5,34.5))
}


test.gListCon.delete <- function() {
	c1 <- gCon$new(from=1, weight=14.5)
	c2 <- gCon$new(from=2, weight=24.5)
	c3 <- gCon$new(from=3, weight=34.5) 
	lc1 <- gListCon$new()
	lc1$push_back(list(c1, c2, c3))
	lc2 <- gListCon$new()
	lc2$push_back(list(c1, c3))
	lc3 <- lc1$copy(shallow=FALSE)
	lc3$delete(FROM=2)
	checkEquals(lc2, lc3)	
}


test.gListCon.select <- function() {
	c1 <- gCon$new(from=1, weight=14.5)
	c2 <- gCon$new(from=2, weight=24.5)
	c3 <- gCon$new(from=3, weight=34.5) 
	lc1 <- gListCon$new()
	lc1$push_back(list(c1, c2, c3))
	lc2 <- lc1$copy(shallow=FALSE)
	lc2$delete(FROM=2)
	checkEquals(lc1$select(FROM=c(1,3)), lc2)	
}

test.gListCon.getFrom_fromIsNumeric <- function() {
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=1:10, WEIGHT=10:1)
	checkEquals(lc$getFrom(), 1:10)	
}


test.gListCon.getId_fromIsNumeric <- function() {
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=1:10, WEIGHT=10:1)	
	checkEquals(lc$getId(), 1:10)	
}


test.gListCon.getWeight_fromIsNumeric <- function() {
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=1:10, WEIGHT=10:1)
	checkEquals(lc$getWeight(), 10:1)
	checkEquals(lc$getWeight(FROM=c(1,10)), c(10,1))
}


test.gListCon.getFrom_fromIsNeuron <- function() {
	ln <- gListMLPneuron$new()
	ln$buildAndAppend(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=ln$load(), WEIGHT=5:1)
	checkEquals(gListMLPneuron$new(ldata=lc$getFrom())$getId(), 1:5)
}


test.gListCon.getId_fromIsNeuron <- function() {
	ln <- gListMLPneuron$new()
	ln$buildAndAppend(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=ln$load(), WEIGHT=5:1)
	checkEquals(lc$getId(), ln$getId() )
	checkEquals(lc$getId(), 1:5)	
}


test.gListCon.getWeight_fromIsNeuron <- function() {
	ln <- gListMLPneuron$new()
	ln$buildAndAppend(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=ln$load(), WEIGHT=5:1)
	checkEquals(lc$getWeight(), 5:1)
	checkEquals(lc$getWeight(FROM=c(1,2)), c(5,4))		
}

test.gListCon.numOfCons <- function() {
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=1:10, WEIGHT=10:1)
	checkEquals(lc$numOfCons(), 10)
}


test.gListCon.setFrom <- function() {
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=1:10, WEIGHT=10:1)
	lc$setFrom(11:20)
	checkEquals(lc$getFrom(), 11:20)
}


test.gListCon.setWeight <- function() {
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=1:10, WEIGHT=10:1)
	lc$setWeight(1:10)
	checkEquals(lc$getWeight(), 1:10)
}

test.gListCon.show <- function() {
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=1:10, WEIGHT=10:1)
	checkTrue(lc$show())
}


test.gListCon.validate <- function() {
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=1:10, WEIGHT=10:1)
	lc$push_back("xx")
	checkException(lc$validate(), silent=TRUE)
}