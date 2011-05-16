# Unit Tests for the listRBFneuron class methods
# 
# Author: mcasl
###############################################################################



test.gListRBFneuron <- function() {

#   new unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gRBFneuron$new(id=1, width=9.9, altitude=0.13, con=lc)
	checkTrue(nn$validate())
	checkEquals(nn$getId(),1)
	checkEquals(nn$getWidth(),9.9)
	checkEquals(nn$getAltitude(),0.13)
	checkEquals(nn$getFrom(),1:5)
	checkEquals(nn$getWeight(),11:15)
	ln <- gListRBFneuron$new(nn)
	checkTrue(ln$validate())
	ln <- gListRBFneuron$new()
	checkTrue(ln$validate())
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$populate(FROM=11:15, WEIGHT=1:5)
	nn <- gRBFneuron$new(id=2, width=8.7, altitude=3.2, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	checkEquals(ln$getId(),1:2)
	checkEquals(ln$getWidth(),c(9.9, 8.7))
	checkEquals(ln$getAltitude(),c(0.13, 3.2))
	checkEquals(ln$getFrom(),list(1:5, 11:15))
	checkEquals(ln$getFrom(ID=2),list(11:15))
	checkEquals(ln$getWeight(),list(11:15,1:5))
	checkEquals(ln$getWeight(ID=1),list(11:15))
	rm(lc, nn, ln)

# populate
	ln <- gListRBFneuron$new()
	ln$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln$is.regular())
	checkTrue(ln$validate())
	rm(ln)
	ln <- gListRBFneuron$new()
	ln$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(!ln$is.regular())
	checkEquals(ln$getId(),1:5)
	checkEquals(ln$getWidth(),c(1.1,3.4,5.4,9.8,5.6))
	checkEquals(ln$getAltitude(),c(1.9,8.4,8.7,3.5,7.6) )
	checkEquals(ln$getFrom(),list(1:3,4:6,7:9,10:12,13:15))
	checkEquals(ln$getWeight(),list(11:13,21:23,31:33,41:43,51:53))
	checkEquals(ln$getFrom(ID=4),list(10:12))
	checkEquals(ln$getWeight(ID=4),list(41:43))
	rm(ln)
	
#   setWidth  unit test
# & getWidth  unit test
	ln <- gListRBFneuron$new()
	ln$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ln$setWidth(11:15)
	checkEquals(ln$getWidth(),11:15)
	checkTrue(ln$validate())
	rm(ln)
	
#   setAltitude unit test
# & getAltitude  unit test
	ln <- gListRBFneuron$new()
	ln$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ln$setAltitude(11:15)
	checkEquals(ln$getAltitude(),11:15)
	checkTrue(ln$validate())
	rm(ln)
	
# show  unit test
	ln <- gListRBFneuron$new()
	ln$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(ln$show())
	rm(ln)
	
# validate  unit test
	ln <- gListRBFneuron$new()
	ln$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ln$addToLdata("xx")
	checkException(ln$validate(), silent=TRUE)
	rm(ln)
	
	}
