# Unit tests for the listCon class methods
# 
# Author: mcasl
###############################################################################


test.gListCon <- function() {

# new unit test	
	lc <- gListCon$new()
	checkTrue(lc$validate())
	rm(lc)
	

	lc <- gListCon$newFromWeight(FROM=1:6, WEIGHT=11:16)
	checkTrue(   lc$validate())
	checkEquals( lc$getFrom(),1:6)
	checkEquals( lc$getWeight(),11:16)
	rm(lc)
	
# addToLdata  unit test
	lc <- gListCon$new()
	c1 <- gCon$new(from=1, weight=14.5)
	c2 <- gCon$new(from=2, weight=24.5)
	c3 <- gCon$new(from=3, weight=34.5) 
	lc$addToLdata(c1)
	lc$addToLdata(c2)
	lc$addToLdata(c3)
	checkTrue(lc$validate())
	checkEquals( lc$getFrom(),1:3)
	checkEquals( lc$getWeight(),c(14.5,24.5,34.5))
	rm(lc, c1, c2, c3)

	lc <- gListCon$new()
	c1 <- gCon$new(from=1, weight=14.5)
	c2 <- gCon$new(from=2, weight=24.5)
	c3 <- gCon$new(from=3, weight=34.5) 
	lc$addToLdata(list(c1,c2, c3))
	checkTrue(lc$validate())
	checkEquals( lc$getFrom(),1:3)
	checkEquals( lc$getWeight(),c(14.5,24.5,34.5))
	rm(lc, c1, c2, c3)
	
# delete  unit test
# & select  unit test	
	c1 <- gCon$new(from=1, weight=14.5)
	c2 <- gCon$new(from=2, weight=24.5)
	c3 <- gCon$new(from=3, weight=34.5) 
	lc1 <- gListCon$new()
	lc1$addToLdata(list(c1, c2, c3))
	lc2 <- gListCon$new()
	lc2$addToLdata(list(c1, c3))
	lc3 <- lc1$copy(shallow=FALSE)
	lc3$delete(FROM=2)
	checkEquals(lc2, lc3)	
	checkEquals(lc1$select(FROM=c(1,3)), lc3)	
	rm(lc1, lc2, lc3, c1, c2, c3)
	
# getFrom  unit test
# & getWeight  unit test
	lc <- gListCon$newFromWeight(FROM=1:10, WEIGHT=10:1)
	checkEquals(lc$getFrom(), 1:10)	
	checkEquals(lc$getWeight(), 10:1)
	checkEquals(lc$getWeight(FROM=c(1,10)), c(10,1))
	rm(lc)

# numOfCons  unit test
	lc <- gListCon$newFromWeight(FROM=1:10, WEIGHT=10:1)
	checkEquals(lc$numOfCons(), 10)
	rm(lc)
	
# setFrom  unit test
# & setWeight  unit test
	lc <- gListCon$newFromWeight(FROM=1:10, WEIGHT=10:1)
	lc$setFrom(11:20)
	lc$setWeight(1:10)
	checkEquals(lc$getFrom(), 11:20)	
	checkEquals(lc$getWeight(), 1:10)
	rm(lc)
	
# show  unit test
	lc <- gListCon$newFromWeight(FROM=1:10, WEIGHT=10:1)
	checkTrue(lc$show())
	rm(lc)
	
	
# validate  unit test
	lc <- gListCon$newFromWeight(FROM=1:10, WEIGHT=10:1)
	lc$addToLdata("xx")
	checkException(lc$validate(), silent=TRUE)
	
}

