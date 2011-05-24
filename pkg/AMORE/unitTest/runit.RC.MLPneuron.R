# Unit Tests for the listMLPneuron class methods
# 
# Author: mcasl
###############################################################################


test.gMLPneuron.new <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gMLPneuron$new(id=1, bias=9.9, con=lc)
	checkTrue(nn$validate())
	checkEquals(nn$getId(),1)
	checkEquals(nn$getBias(),9.9)
	checkEquals(nn$getFrom(),1:5)
	checkEquals(nn$getWeight(),11:15)
}


test.gMLPneuron.show <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gMLPneuron$new(id=1, bias=9.9, con=lc)
	checkTrue(nn$validate())
	checkTrue(nn$show())
}


test.gMLPneuron.validate <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gMLPneuron$new(id=1, bias=9.9, con=lc)
	nn$setBias("xx")
	checkException(nn$validate(), silent=TRUE)
}