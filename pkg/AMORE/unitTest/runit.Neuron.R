# Unit tests for the neuron class
# 
# Author: mcasl
###############################################################################


test.gNeuron <- function() {
# new unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkTrue(nn$validate())
	checkEquals(nn$getId(),1)
	checkEquals(nn$getCon(),lc)
	rm(lc, nn)
	
# addCon  unit test
# & setId  unit test
# & getId  unit test
	nn <- gNeuron$new()
	con1 <- gCon$new(from=6,weight=4.3)
	nn$addCon(con1)
	checkException(nn$validate(), silent=TRUE)
	nn$setId(1)
	checkEquals(nn$getId(), 1)
	checkEquals(nn$getFrom(), 6)
	checkEquals(nn$getWeight(), 4.3)
	checkTrue(nn$validate())
	rm(con1, nn)

#  deleteCon  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	nn$deleteCon(FROM=4)
	checkTrue(nn$validate())
	checkEquals(nn$getFrom(), c(1,2,3,5))
	rm(lc, nn)
	
# getCon  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getCon(), lc)
	rm(lc, nn)
	
#  getFrom  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getFrom(), 1:5)
	rm(lc,nn)

# getWeight  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getWeight(), 11:15)
	checkEquals(nn$getWeight(FROM=2), 12)
	checkEquals(nn$getWeight(FROM=2:3), 12:13)
	rm(lc,nn)
	
# numOfCons  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$numOfCons(), 5)
	rm(lc,nn)
	
# setCon  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	lc <- gListCon$new()
	lc$populate(FROM=11:15, WEIGHT=11:15)
	nn$setCon(lc)
	checkEquals(nn$getFrom(), 11:15)	
	checkTrue(nn$validate())
	rm(lc,nn)
	
# setFrom  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getFrom(), 1:5)
	nn$setFrom(55:51)
	checkEquals(nn$getFrom(), 55:51)
	rm(lc, nn)
	
# setWeight  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkEquals(nn$getWeight(), 11:15)
	nn$setWeight(55:51)
	checkEquals(nn$getWeight(), 55:51)
	nn$setWeight(FROM=1, 6)
	checkEquals(nn$getWeight(FROM=1), 6)
	rm(lc, nn)
	
	

# show  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkTrue(nn$show())
	rm(lc, nn)
	
# validate  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	checkTrue(nn$validate())
	nn$setId("xx")
	checkException(nn$validate(), silent=TRUE)
	rm(lc, nn)
	
}
