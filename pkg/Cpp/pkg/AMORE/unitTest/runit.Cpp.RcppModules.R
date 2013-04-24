

suppressMessages(require("inline"))
suppressMessages(require("Rcpp"))
suppressMessages(require("RUnit"))


###############################################################################
test.RcppModules.Cpp.new_NetworkRinterface <- function() {
###############################################################################

	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- ""
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())

	modAMORE <- Module("modAMORE",  getDynLib(testCodefun))
	AMOREnet <- modAMORE$NetworkRinterface
	net <- new (AMOREnet)
	#checkException(net$validate(), silent=TRUE)
	net$createFeedForwardNetwork(c(3,2,2), "Tanh", "Identity")
	checkTrue(net$validate())
	checkEquals(net$inputSize(),3)
	checkEquals(net$outputSize(),2)

	net$show()

	checkException( net$sim(matrix(rnorm(120),  nrow=4)) , silent=TRUE )

	net$sim(matrix(rnorm(12000), nrow=3))

	srcf0hiddenLayer <- 'double f0(double inducedLocalField) {
			return( tanh(inducedLocalField) );
			}
			'

	srcf1hiddenLayer <- 'double f1(double inducedLocalField) {
			double tanhx = tanh(inducedLocalField);
			return( 1-tanhx*tanhx );
			}
			'
	srcf0outputLayer <- 'double f0(double inducedLocalField) {
			return( tanh(inducedLocalField) );
			}
			'

	srcf1outputLayer <- 'double f1(double inducedLocalField) {
			double tanhx = tanh(inducedLocalField);
			return( 1-tanhx*tanhx );
			}
			'
	source("pkg/AMORE/R/common.R")

	hiddenLayersFunctions <- createXPtrFunctionListFromSources(srcf0hiddenLayer, srcf1hiddenLayer)
	outputLayerFunctions  <- createXPtrFunctionListFromSources(srcf0outputLayer, srcf1outputLayer)
	net$createCustomFeedForwardNetwork(c(4,2,3), hiddenLayersFunctions, outputLayerFunctions)
	checkTrue(net$validate())
	checkEquals(net$inputSize(),4)
	checkEquals(net$outputSize(),3)
}

