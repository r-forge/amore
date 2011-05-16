# 
# Run unit tests and store the results in a html file
# Author: mcasl
###############################################################################

require("RUnit")
packPath <- "/Users/mcasl/pc-ule/Trabajo/investigacion/AMORE/AMORE-RefClasses/" 
#TODO change this to a package relative path
uniTestPath   <-  paste(packPath,"unitTest", sep="")
testFile <- paste(uniTestPath,"TEST-RESULTS.html", sep="/") 

testsuite.AMORErefClasses <- defineTestSuite("AMORE Reference Classes Unit Tests",
		dirs = uniTestPath ,	
		testFileRegexp = "^runit.+\\.R",
		testFuncRegexp = "^test.+",
		rngKind = "Marsaglia-Multicarry",
		rngNormalKind = "Kinderman-Ramage"
)
testResult <- runTestSuite(testsuite.AMORErefClasses)
testResult
printHTMLProtocol(testResult, file=testFile)


