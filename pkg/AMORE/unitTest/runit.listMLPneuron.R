# Unit Tests for the listMLPneuron class methods
# 
# Author: mcasl
###############################################################################


test.gListMLPneuron <- function() {
#   new unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
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
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$populate(FROM=11:15, WEIGHT=1:5)
	nn <- gMLPneuron$new(id=2, bias=8.7, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	checkEquals(ln$getId(),1:2)
	checkEquals(ln$getBias(),c(9.9, 8.7))
	checkEquals(ln$getFrom(),list(1:5, 11:15))
	checkEquals(ln$getFrom(ID=2),list(11:15))
	checkEquals(ln$getWeight(),list(11:15,1:5))
	checkEquals(ln$getWeight(ID=1),list(11:15))
	rm(lc, nn, ln)
	
#   populate unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln$is.regular())
	checkTrue(ln$validate())
	rm(ln)
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(!ln$is.regular())
	checkEquals(ln$getId(),1:5)
	checkEquals(ln$getBias(),c(1.1,3.4,5.4,9.8,5.6))
	checkEquals(ln$getFrom(),list(1:3,4:6,7:9,10:12,13:15))
	checkEquals(ln$getWeight(),list(11:13,21:23,31:33,41:43,51:53))
	checkEquals(ln$getFrom(ID=4),list(10:12))
	checkEquals(ln$getWeight(ID=4),list(41:43))
	rm(ln)

#   setBias  unit test
# & getBias  unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ln$setBias(11:15)
	checkEquals(ln$getBias(),11:15)
	checkTrue(ln$validate())
	rm(ln)
	
	
# show  unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln$show())
	rm(ln)
	
# validate  unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=list(1,2,3,4,5), BIAS=list(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ln$addToLdata("xx")
	checkException(ln$validate(), silent=TRUE)
	rm(ln)
	
}

