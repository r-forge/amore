# Unit Tests for the RBFneuron class methods
# 
# Author: mcasl
###############################################################################


test.gRBFneuron.new <- function() {
	nn <- gRBFneuron$new()
	checkException(nn$validate(), silent=TRUE)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gRBFneuron$new(id=1, width=9.9, altitude=29.3, con=lc)
	checkTrue(nn$validate())
	checkTrue(nn$show())
}

test.gRBFneuron.show <- function() {
	nn <- gRBFneuron$new()
	checkException(nn$validate(), silent=TRUE)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gRBFneuron$new(id=1, width=9.9, altitude=29.3, con=lc)
	checkTrue(nn$validate())
	checkTrue(nn$show())
}

test.gRBFneuron.validate <- function() {
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gRBFneuron$new(id=1, width=9.9, altitude=29.3, con=lc)
	nn$setWidth("xx")
	checkException(nn$validate(), silent=TRUE)
	nn <- gRBFneuron$new(id=1, width=9.9, altitude=29.3, con=lc)
	nn$setAltitude("xx")
	checkException(nn$validate(), silent=TRUE)
}