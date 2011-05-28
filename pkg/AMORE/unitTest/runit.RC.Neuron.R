# Unit tests for the neuron class
# 
# Author: mcasl
###############################################################################


test.gNeuron.new <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkTrue(nn$validate())
	checkEquals(nn$getId(),1)
	checkEquals(nn$getCon(),lc)
}


test.gNeuron.addCon <- function() {
	nn <- gNeuron$new(id=1)
	con1 <- gCon$new(from=6,weight=4.3)
	nn$addCon(con1)
	checkEquals(nn$getId(), 1)
	checkEquals(nn$getFrom(), 6)
	checkEquals(nn$getWeight(), 4.3)
	checkTrue(nn$validate())
}

test.gNeuron.setId.getId <- function() {
	nn <- gNeuron$new()
	con1 <- gCon$new(from=6,weight=4.3)
	nn$addCon(con1)
	checkException(nn$validate(), silent=TRUE)
	nn$setId(1)
	checkEquals(nn$getId(), 1)
	checkTrue(nn$validate())
}


test.gNeuron.deleteCon <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	nn$deleteCon(FROM=4)
	checkTrue(nn$validate())
	checkEquals(nn$getFrom(), c(1,2,3,5))
}


test.gNeuron.getCon <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getCon(), lc)
}


test.gNeuron.getFrom_fromIsNumeric <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getFrom(), 1:5)
}

test.gNeuron.getFromId_fromIsNumeric <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getFromId(), 1:5)
}



test.gNeuron.getFrom_fromIsNeuron <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new()
	ln$push_back(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=1:5)
	nn <- gNeuron$new(id=2, con=lc)
	ln$push_back(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=21:25)
	nn <- gNeuron$new(id=3, con=lc)
	ln$push_back(nn)
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$populate(FROM=ln$getLdata(), WEIGHT=11:13)
	nn <- gNeuron$new(id=10, con=lc)
	checkEquals(nn$getFrom(), ln$getLdata())
}


test.gNeuron.getFromId_fromIsNeuron <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new()
	ln$push_back(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=1:5)
	nn <- gNeuron$new(id=2, con=lc)
	ln$push_back(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=21:25)
	nn <- gNeuron$new(id=3, con=lc)
	ln$push_back(nn)
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$populate(FROM=ln$getLdata(), WEIGHT=11:13)
	nn <- gNeuron$new(id=10, con=lc)
	checkEquals(nn$getFromId(), 1:3)
}


test.gNeuron.getWeight <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getWeight(), 11:15)
	checkEquals(nn$getWeight(FROM=2), 12)
	checkEquals(nn$getWeight(FROM=2:3), 12:13)
}


test.gNeuron.numOfCons <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$numOfCons(), 5)
}


test.gNeuron.setCon <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	lc <- gListCon$new()
	lc$populate(FROM=11:15, WEIGHT=11:15)
	nn$setCon(lc)
	checkEquals(nn$getFrom(), 11:15)	
	checkTrue(nn$validate())
}


test.gNeuron.setFrom <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getFrom(), 1:5)
	nn$setFrom(55:51)
	checkEquals(nn$getFrom(), 55:51)
}


test.gNeuron.setWeight <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getWeight(), 11:15)
	nn$setWeight(55:51)
	checkEquals(nn$getWeight(), 55:51)
	nn$setWeight(FROM=1, 6)
	checkEquals(nn$getWeight(FROM=1), 6)
}


test.gNeuron.show <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkTrue(nn$show())
}


test.gNeuron.validate <- function() {
	nn <- gNeuron$new()
	checkException(nn$validate(), silent=TRUE)
	
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkTrue(nn$validate())
	nn$setId("xx")
	checkException(nn$validate(), silent=TRUE)
}
