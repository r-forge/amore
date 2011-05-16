# Unit tests for the neuron class
# 
# Author: mcasl
###############################################################################


test.gNeuron <- function() {

# TODO  new unit test
	lc <- gListCon$new(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkTrue(nn$validate())
	checkEquals(nn$getId(),1)
	checkEquals(nn$getCon(),p)
	
# TODO  addCon  unit test
	nn <- gNeuron$new()
	con1 <- gCon$new(from=6,weight=4.3)
	nn$addCon(con1)
	checkException(nn$validate(), silent=TRUE)
	nn$setId(1)
	checkTrue(nn$validate())


#  deleteCon  unit test
	
	nn$setCon(p)
	checkEquals(nn$getFrom(), 1:5)
	nn$deleteCon(FROM=5)
	checkEquals(length(nn$getFrom()),4)
	checkEquals(length(nn$getFrom()),nn$numOfCons())
	
# TODO  getCon  unit test
# TODO  getFrom  unit test
# TODO  getId  unit test
# TODO  getWeight  unit test
# TODO  numOfCons  unit test
# TODO  setCon  unit test
# TODO  setFrom  unit test
	checkEquals(nn$getFrom(), 1:6)
	nn$setFrom(6:1)
	checkEquals(nn$getFrom(), 6:1)
# TODO  setId  unit test
	
	nn$setId(4)
	checkEquals(nn$getId(), 4)
	
# TODO  setWeight  unit test
	p <- gListCon$new(FROM=1:5, WEIGHT=11:15)
	checkEquals(nn$getWeight(FROM=6), 4.3)
	nn$setWeight(4.5, FROM=6)
	checkEquals(nn$getWeight(FROM=6), 4.5)
	
	

# show  unit test
	lc <- gListCon$new(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkTrue(nn$show())
	
# TODO  validate  unit test
	
	
	

	
	
	
}
