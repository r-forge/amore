# Unit Tests for the listAMORE class methods
# 
# Author: mcasl
###############################################################################

test.gListAMORE <- function() {

#   new unit test
# & getLdata  unit test
	checkException(gListAMORE$new("xx"), silent=TRUE)
	
	la <- gListAMORE$new()
	checkTrue(la$validate())
	checkException(gListAMORE$new(list(1:3)), silent=TRUE)
	lb <- gListAMORE$new(ldata=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(lb$validate())
	checkEquals(lb$ldata[[1]], gCon$new(from=1, weight=14.5))	
	checkEquals(lb$getLdata()[[1]], gCon$new(from=1, weight=14.5))	
	checkEquals(lb$getLdata()[[2]], gCon$new(from=2, weight=24.5))	
	checkEquals(lb$getLdata()[[3]], gCon$new(from=3, weight=34.5))	
	checkEquals(lb$ldata,lb$getLdata())

#  addToLdata  unit test
	lc <- gListAMORE$new()	
	checkTrue(lc$validate())
	lc$addToLdata(gCon$new(from=1, weight=14.5))
	lc$addToLdata(gCon$new(from=2, weight=24.5))
	lc$addToLdata(gCon$new(from=3, weight=34.5))
	ld <- gListAMORE$new(ldata=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(ld$validate())
	checkEquals(lc,ld)
	checkEquals(lc$getLdata(), list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))

# setLdata  unit test	
	le <- gListAMORE$new()
	checkTrue(le$validate())
	le$setLdata(list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5)))
	checkTrue(le$validate())
	checkEquals(le$getLdata(),list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5)))

# show  unit test
	ld <- gListAMORE$new(ldata=list (gCon$new(from=1, weight=14.5),	gCon$new(from=2, weight=24.5), gCon$new(from=3, weight=34.5)))	
	checkTrue(ld$show())

# validate unit test
	le <- gListAMORE$new()
	le$addToLdata("xx")
	checkEquals(le$ldata[[1]],"xx")
	checkException(le$validate(), silent=TRUE)
	le$addToLdata("yy")
	checkEquals(le$getLdata(),list("xx","yy"))
	checkException(le$validate(), silent=TRUE)
	
}
