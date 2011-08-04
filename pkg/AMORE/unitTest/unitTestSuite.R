# 
# 

# Run unit tests and report the results in a html file
# Author: mcasl
###############################################################################

suppressMessages(require("inline"))
suppressMessages(require("Rcpp"))
suppressMessages(require("RUnit"))


uniTestPath   <-  "./pkg/AMORE/unitTest"
testFile <- "./www/unitTestResults.html"

testFileToSFLinkMap <- function(testFileName, testDir = "unitTest") {
	bname <- basename(testFileName)
	regExp <- paste("^.*/([.a-zA-Z0-9]*)/", testDir,"/.*$", sep = "")
	pack <- sub(regExp, "\1", testFileName)
	return(paste("https://r-forge.r-project.org/scm/viewvc.php/pkg/AMORE/", pack, "/", testDir, "/", bname,"?root=amore", sep = ""))
}



testsuite.AMORECppClasses <- defineTestSuite("AMORE C++ Classes Unit Tests",
		dirs = uniTestPath ,	
		testFileRegexp = "^runit.Cpp.+\\.R",
		testFuncRegexp = "^test.+",
		rngKind = "Marsaglia-Multicarry",
		rngNormalKind = "Kinderman-Ramage"
)

testResult <- runTestSuite(list( 
 				testsuite.AMORECppClasses					
								))
						
printHTMLProtocol(testResult, file=testFile, testFileToLinkMap = testFileToSFLinkMap)

