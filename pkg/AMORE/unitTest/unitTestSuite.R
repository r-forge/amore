# 
# Run unit tests and store the results in a html file
# Author: mcasl
###############################################################################

require("RUnit")
packPath <- "../sandbox" 
#TODO change this to a package relative path
uniTestPath   <-  paste(packPath,"pkg/AMORE/unitTest", sep="/")
testFile <- paste(packPath,"www/unitTestResults.html", sep="/") 

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


