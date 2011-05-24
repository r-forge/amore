# Unit Tests for the listAMORE class methods
# 
# Author: mcasl
###############################################################################


test.gListAMORE.new <- function() {
	checkException(gListAMORE$new("xx"), silent=TRUE)
	la <- gListAMORE$new()
	checkTrue(la$validate())
	checkException(gListAMORE$new(list(1:3)), silent=TRUE)
	lb <- gListAMORE$new(ldata=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(lb$validate())
	checkEquals(lb$getLdata()[[1]], gCon$new(from=1, weight=14.5))	
	checkEquals(lb$getLdata()[[2]], gCon$new(from=2, weight=24.5))	
	checkEquals(lb$getLdata()[[3]], gCon$new(from=3, weight=34.5))	
}


test.gListAMORE.getLdata <- function() {
	lb <- gListAMORE$new(ldata=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(lb$validate())	
	checkEquals(lb$ldata,lb$getLdata())
}


test.gListAMORE.addToLdata <- function() {
	lc <- gListAMORE$new()	
	checkTrue(lc$validate())
	lc$addToLdata(gCon$new(from=1, weight=14.5))
	lc$addToLdata(gCon$new(from=2, weight=24.5))
	lc$addToLdata(gCon$new(from=3, weight=34.5))
	ld <- gListAMORE$new(ldata=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(ld$validate())
	checkEquals(lc,ld)
	checkEquals(lc$getLdata(), list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))
}


test.gListAMORE.join <- function() {
	lc <- gListAMORE$new()	
	checkTrue(lc$validate())
	lc$addToLdata(gCon$new(from=1, weight=14.5))
	lc$addToLdata(gCon$new(from=2, weight=24.5))
	lc$addToLdata(gCon$new(from=3, weight=34.5))
	ld <- gListAMORE$new(ldata=list (gCon$new(from=4, weight=1.5),	gCon$new(from=5, weight=2.5), gCon$new(from=6, weight=4.5)))	
	checkTrue(ld$validate())
	lc$join(ld)
	checkTrue(ld$validate())
	checkEquals(lc$getLdata(), list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5), gCon$new(from=4, weight=1.5),	gCon$new(from=5, weight=2.5), gCon$new(from=6, weight=4.5)))	
}


test.gListAMORE.setLdata <- function() {
	le <- gListAMORE$new()
	checkTrue(le$validate())
	le$setLdata(list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5)))
	checkTrue(le$validate())
	checkEquals(le$getLdata(),list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5)))
}


test.gListAMORE.show <- function() {
	ld <- gListAMORE$new(ldata=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(ld$show())
}


test.gListAMORE.validate <- function() {
	le <- gListAMORE$new()
	le$addToLdata("xx")
	checkEquals(le$ldata[[1]],"xx")
	checkException(le$validate(), silent=TRUE)
	le$addToLdata("yy")
	checkEquals(le$getLdata(),list("xx","yy"))
	checkException(le$validate(), silent=TRUE)	
}
