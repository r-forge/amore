
###############################################################################
test.RcppModules.Cpp.new_NetworRinterface <- function() {	
###############################################################################	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- ""
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	
	modAMORE <- Module("modAMORE",  getDynLib(testCodefun))	

	
	AMOREnet <- modAMORE$NetworkRinterface
	net <- new (AMOREnet)
	checkException(net$validate(), silent=TRUE)
	net$createFeedForwardNetwork(c(3,2,2), "Tanh", "Identity")
	checkTrue(net$validate())
	checkEquals(net$inputSize(),3)
	checkEquals(net$outputSize(),2)
	
	checkException( net$predict(matrix(rnorm(120),  nrow=4)) , silent=TRUE )
	net$predict(matrix(rnorm(120), nrow=3))
	
	
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
	
    net$predict(matrix(rnorm(120),  nrow=4))
	#            [,1]       [,2]        [,3]       [,4]        [,5]       [,6]
	# [1,] -0.1440866 -0.1125475 -0.09873694 -0.1081136 -0.01153598 -0.1532900
	# [2,]  0.2591979  0.3073223  0.27910547  0.2980877  0.36910578  0.2346915
	# [3,] -0.3445102 -0.3409694 -0.33758609 -0.3398747 -0.32639222 -0.3451816
	#            [,7]       [,8]        [,9]      [,10]       [,11]      [,12]
	# [1,] -0.1943690 -0.2054356 -0.08339103 -0.1475452 -0.05549545 -0.1875168
	# [2,]  0.2197167  0.1352617  0.32204082  0.2187706  0.36240784  0.1696790
	# [3,] -0.3516517 -0.3505945 -0.33662300 -0.3436341 -0.33350913 -0.3487115
	#           [,13]      [,14]     [,15]      [,16]      [,17]      [,18]
	# [1,] -0.1386879 -0.1776910 -0.113771 -0.1269792 -0.0748119 -0.1846693
	# [2,]  0.2828013  0.2662729  0.295766  0.2877210  0.2836196  0.2299769
	# [3,] -0.3444649 -0.3504789 -0.340741 -0.3426688 -0.3337276 -0.3503576
	#           [,19]      [,20]      [,21]      [,22]      [,23]       [,24]
	# [1,] -0.1393251 -0.1471325 -0.1112424 -0.1383870 -0.1007335 -0.05865305
	# [2,]  0.2295089  0.2127068  0.3170888  0.2372973  0.3217125  0.26086366
	# [3,] -0.3426262 -0.3433471 -0.3411195 -0.3427485 -0.3395266 -0.33016283
	#           [,25]       [,26]      [,27]      [,28]       [,29]      [,30]
	# [1,] -0.1825223 -0.09186607 -0.2239265 -0.1614420 -0.06056589 -0.1950850
	# [2,]  0.1774886  0.28319996  0.1668513  0.2324923  0.36494964  0.1455367
	# [3,] -0.3481298 -0.33658162 -0.3548845 -0.3464877 -0.33446067 -0.3491690


	
}

