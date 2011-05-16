# Unit Tests for the RBFneuron class methods
# 
# Author: mcasl
###############################################################################


test.gRBFneuron <- function() {
# new unit test
# & show  unit test
	nn <- gRBFneuron$new()
	checkException(nn$validate(), silent=TRUE)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gRBFneuron$new(id=1, width=9.9, altitude=29.3, con=lc)
	checkTrue(nn$validate())
	checkTrue(nn$show())
	rm(lc, nn)
	
# validate  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gRBFneuron$new(id=1, width=9.9, altitude=29.3, con=lc)
	nn$setWidth("xx")
	checkException(nn$validate(), silent=TRUE)
	nn <- gRBFneuron$new(id=1, width=9.9, altitude=29.3, con=lc)
	nn$setAltitude("xx")
	checkException(nn$validate(), silent=TRUE)
	rm(lc, nn)
}