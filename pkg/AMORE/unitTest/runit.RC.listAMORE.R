# Unit Tests for the listAMORE class methods
# 
# Author: mcasl
###############################################################################


test.gListAMORE.new <- function() {
	checkException(gListAMORE$new("xx"), silent=TRUE)
	la <- gListAMORE$new()
	checkTrue(la$validate())
	checkException(gListAMORE$new(list(1:3)), silent=TRUE)
	lb <- gListAMORE$new(collection=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(lb$validate())
	checkEquals(lb$load()[[1]], gCon$new(from=1, weight=14.5))	
	checkEquals(lb$load()[[2]], gCon$new(from=2, weight=24.5))	
	checkEquals(lb$load()[[3]], gCon$new(from=3, weight=34.5))	
}


test.gListAMORE.load <- function() {
	lb <- gListAMORE$new(collection=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(lb$validate())	
	checkEquals(lb$collection,lb$load())
}


test.gListAMORE.push_back <- function() {
	lc <- gListAMORE$new()	
	checkTrue(lc$validate())
	lc$push_back(gCon$new(from=1, weight=14.5))
	lc$push_back(gCon$new(from=2, weight=24.5))
	lc$push_back(gCon$new(from=3, weight=34.5))
	ld <- gListAMORE$new(collection=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(ld$validate())
	checkEquals(lc,ld)
	checkEquals(lc$load(), list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))
}


test.gListAMORE.append <- function() {
	lc <- gListAMORE$new()	
	checkTrue(lc$validate())
	lc$push_back(gCon$new(from=1, weight=14.5))
	lc$push_back(gCon$new(from=2, weight=24.5))
	lc$push_back(gCon$new(from=3, weight=34.5))
	ld <- gListAMORE$new(collection=list (gCon$new(from=4, weight=1.5),	gCon$new(from=5, weight=2.5), gCon$new(from=6, weight=4.5)))	
	checkTrue(ld$validate())
	lc$append(ld)
	checkTrue(ld$validate())
	checkEquals(lc$load(), list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5), gCon$new(from=4, weight=1.5),	gCon$new(from=5, weight=2.5), gCon$new(from=6, weight=4.5)))	
}


test.gListAMORE.store <- function() {
	le <- gListAMORE$new()
	checkTrue(le$validate())
	le$store(list(gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5)))
	checkTrue(le$validate())
	checkEquals(le$load(),list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5)))	
}


test.gListAMORE.show <- function() {
	ld <- gListAMORE$new(collection=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(ld$show())
}


test.gListAMORE.validate <- function() {
	le <- gListAMORE$new()
	le$push_back("xx")
	checkEquals(le$collection[[1]],"xx")
	checkException(le$validate(), silent=TRUE)
	le$push_back("yy")
	checkEquals(le$load(),list("xx","yy"))
	checkException(le$validate(), silent=TRUE)	
}
