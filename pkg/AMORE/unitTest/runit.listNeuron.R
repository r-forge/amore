# Unit Tests for the listNeuron class methods
# 
# Author: mcasl
###############################################################################



test.gListNeuron <- function() {
#   new unit test
# & addToLdata  unit test
# & numOfCons  unit test
# & numOfNeurons  unit test
	
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new(nn)
	checkTrue(ln$validate())
	rm(lc, nn, ln)
	
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new()
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=1:5)
	nn <- gNeuron$new(id=2, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=21:25)
	nn <- gNeuron$new(id=3, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	checkEquals(ln$getId(),1:3)
	checkEquals(ln$numOfNeurons(),3)
	checkEquals(ln$numOfCons(),c(5,5,5))
	rm(lc,nn,ln)
	
# delete  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new()
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=1:5)
	nn <- gNeuron$new(id=2, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=21:25)
	nn <- gNeuron$new(id=3, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	ln$delete(ID=3)
	checkTrue(ln$validate())
	checkEquals(ln$getId(),1:2)
	rm(lc, nn, ln)
	
#  getFrom  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new()
	ln$addToLdata(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=1:5)
	nn <- gNeuron$new(id=2, con=lc)
	ln$addToLdata(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=21:25)
	nn <- gNeuron$new(id=3, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	checkEquals(ln$getFrom(),list(1:5,1:5, 1:5))
	checkEquals(ln$getFrom(ID=2:3),list(1:5, 1:5))
	rm(lc,nn,ln)
	
#  getWeight  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new()
	ln$addToLdata(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=1:5)
	nn <- gNeuron$new(id=2, con=lc)
	ln$addToLdata(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=21:25)
	nn <- gNeuron$new(id=3, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	checkEquals(ln$getWeight(),list(11:15,1:5, 21:25))
	checkEquals(ln$getWeight(ID=1:2),list(11:15,1:5))
	rm(lc,nn,ln)
	
	
#  setId  unit test
# & getId  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new()
	ln$addToLdata(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=1:5)
	nn <- gNeuron$new(id=2, con=lc)
	ln$addToLdata(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=21:25)
	nn <- gNeuron$new(id=3, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	ln$setId(11:13)
	checkEquals(ln$getId(),11:13)
	ln$setId(2:3,ID=12:13)
	checkEquals(ln$getId(),c(11,2,3))
	rm(lc,nn,ln)
	
	
# is.regular  unit test
# & select  unit test
# & setFrom  unit test
# & setWeight  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new()
	ln$addToLdata(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=1:5)
	nn <- gNeuron$new(id=2, con=lc)
	ln$addToLdata(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=21:25)
	nn <- gNeuron$new(id=3, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$is.regular())
	lc <- gListCon$new()
	lc$populate(FROM=1:7, WEIGHT=21:27)
	nn <- gNeuron$new(id=4, con=lc)
	ln$addToLdata(nn)
	checkTrue(!ln$is.regular())
	checkTrue(ln$select(ID=1:3)$is.regular())
	ln$setFrom(list(7:1), ID=4)
	checkEquals(ln$getFrom(ID=4), list(7:1))
	ln$setFrom(list(101:105,11:15,5:1,1:7))
	checkEquals(ln$getFrom(ID=4), list(1:7))
	checkEquals(ln$getFrom(), list(101:105,11:15,5:1,1:7))
	rm(lc, nn, ln)
	
# show  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new()
	ln$addToLdata(nn)
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=1:5)
	nn <- gNeuron$new(id=2, con=lc)
	ln$addToLdata(nn)
	checkTrue(ln$show())
	rm(lc, nn, ln)
	
#  validate  unit test
	lc <- gListCon$new()
	lc$populate(FROM=1:5, WEIGHT=11:15)
	nn <- gNeuron$new(id=1, con=lc)
	ln <- gListNeuron$new()
	ln$addToLdata(nn)
	checkTrue(ln$validate())
	ln$addToLdata("xx")
	checkException(ln$validate(), silent=TRUE)
	rm(lc, nn, ln)
	
	
}