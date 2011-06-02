# Unit Tests for the listMLPneuron class methods
# 
# Author: mcasl
###############################################################################

test.gListMLPneuron.new <- function() {
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=1:5, WEIGHT=11:15)
	nn <- gMLPneuron$new(id=1, bias=9.9, con=lc)
	checkTrue(nn$validate())
	checkEquals(nn$getId(),1)
	checkEquals(nn$getBias(),9.9)
	checkEquals(nn$getFrom(),1:5)
	checkEquals(nn$getWeight(),11:15)
	ln <- gListMLPneuron$new(nn)
	checkTrue(ln$validate())
	ln <- gListMLPneuron$new()
	checkTrue(ln$validate())
	ln$push_back(nn)
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$buildAndAppend(FROM=11:15, WEIGHT=1:5)
	nn <- gMLPneuron$new(id=2, bias=8.7, con=lc)
	ln$push_back(nn)
	checkTrue(ln$validate())
	checkEquals(ln$getId(),1:2)
	checkEquals(ln$getBias(),c(9.9, 8.7))
	checkEquals(ln$getFrom(),list(1:5, 11:15))
	checkEquals(ln$getFrom(ID=2),list(11:15))
	checkEquals(ln$getWeight(),list(11:15,1:5))
	checkEquals(ln$getWeight(ID=1),list(11:15))	
}


test.gListMLPneuron.buildAndAppend_fromIsNumeric <- function() {
	ln <- gListMLPneuron$new()
	ln$buildAndAppend(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln$is.regular())
	checkTrue(ln$validate())
	rm(ln)
	ln <- gListMLPneuron$new()
	ln$buildAndAppend(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(!ln$is.regular())
	checkEquals(ln$getId(),1:5)
	checkEquals(ln$getBias(),c(1.1,3.4,5.4,9.8,5.6))
	checkEquals(ln$getFrom(),list(1:3,4:6,7:9,10:12,13:15))
	checkEquals(ln$getWeight(),list(11:13,21:23,31:33,41:43,51:53))
	checkEquals(ln$getFrom(ID=4),list(10:12))
	checkEquals(ln$getWeight(ID=4),list(41:43))
}


test.gListMLPneuron.buildAndAppend_fromIsNeuron <- function() {
	ln1 <- gListMLPneuron$new()
	ln1$buildAndAppend(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln1$validate())
	ln2 <- gListMLPneuron$new()
	ln2$buildAndAppend(ID=6:8, BIAS=c(1.1,3.4,5.4), FROM= replicate(3, ln1$getLdata(), simplify=FALSE), WEIGHT=list(11:15,21:25,31:35))
	checkTrue(ln2$is.regular())
	checkEquals(ln2$getId(),6:8)
	checkEquals(ln2$getBias(),c(1.1,3.4,5.4))
	checkEquals(gListMLPneuron$new(ln2$getFrom()[[1]])$getId(), ln1$getId() )
	checkEquals(gListMLPneuron$new(ln2$getFrom()[[2]])$getId(), ln1$getId() )
	checkEquals(gListMLPneuron$new(ln2$getFrom()[[3]])$getId(), ln1$getId() )
	checkEquals(ln2$getFromId(), replicate(3, ln1$getId(), simplify=FALSE)) # An example of how handy getFromId is.
	checkEquals(ln2$getWeight(),list(11:15,21:25,31:35))
	checkEquals(gListMLPneuron$new(ln2$getFrom()[[1]])$getId(),  ln1$getId() )
	checkEquals(ln2$getWeight(ID=6),list(11:15))
}


test.gListMLPneuron.setBias.getBias <- function() {
	ln <- gListMLPneuron$new()
	ln$buildAndAppend(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ln$setBias(11:15)
	checkEquals(ln$getBias(),11:15)
	checkTrue(ln$validate())
}


test.gListMLPneuron.show <- function() {
	ln <- gListMLPneuron$new()
	ln$buildAndAppend(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln$show())
}


test.gListMLPneuron.validate <- function() {
	ln <- gListMLPneuron$new()
	ln$buildAndAppend(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ln$push_back("xx")
	checkException(ln$validate(), silent=TRUE)	
}

