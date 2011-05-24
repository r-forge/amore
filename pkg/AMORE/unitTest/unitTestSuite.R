# 
# Run unit tests and store the results in a html file
# Author: mcasl
###############################################################################

require("RUnit") 
uniTestPath   <-  "./pkg/AMORE/unitTest"
testFile <- "./www/unitTestResults.html"

testFileToSFLinkMap <- function(testFileName, testDir = "unitTest") {
	bname <- basename(testFileName)
	regExp <- paste("^.*/([.a-zA-Z0-9]*)/", testDir,"/.*$", sep = "")
	pack <- sub(regExp, "\1", testFileName)
	return(paste("https://r-forge.r-project.org/scm/viewvc.php/pkg/AMORE/", pack, "/", testDir, "/", bname,"?root=amore", sep = ""))
}


testsuite.AMORErefClasses <- defineTestSuite("AMORE Reference Classes Unit Tests",
		dirs = uniTestPath ,	
		testFileRegexp = "^runit.RC.+\\.R",
		testFuncRegexp = "^test.+",
		rngKind = "Marsaglia-Multicarry",
		rngNormalKind = "Kinderman-Ramage"
)


testsuite.AMORECppClasses <- defineTestSuite("AMORE C++ Classes Unit Tests",
		dirs = uniTestPath ,	
		testFileRegexp = "^runit.Cpp.+\\.R",
		testFuncRegexp = "^test.+",
		rngKind = "Marsaglia-Multicarry",
		rngNormalKind = "Kinderman-Ramage"
)

testResult <- runTestSuite(list( 	testsuite.AMORECppClasses
									,	testsuite.AMORErefClasses
								))
						
printHTMLProtocol(testResult, file=testFile, testFileToLinkMap = testFileToSFLinkMap)

