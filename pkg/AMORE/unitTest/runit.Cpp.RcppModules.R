
###############################################################################
test.RcppModules.Cpp.new_NetworRinterface <- function() {	
###############################################################################	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- ""
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	
	modAMORE <- Module("mod_AMORE",  getDynLib(testCodefun))	

	
	AMOREnet <- modAMORE$NetworkRinterface
	net <- new (AMOREnet)
	checkException(net$validate(), silent=TRUE)
	net$createFeedForwardNetwork(c(3,2,2))
	checkTrue(net$validate())
	checkEquals(net$inputSize(),3)
	checkEquals(net$outputSize(),2)
	
	checkException( net$predict(matrix(rnorm(120),  nrow=4)) , silent=TRUE )
	net$predict(matrix(rnorm(120), nrow=3))
	# [1] TRUE
	# [1] TRUE
	# [1] TRUE
	# [1] TRUE
	# [1] TRUE
	#            [,1]       [,2]       [,3]        [,4]        [,5]         [,6]
	# [1,]  0.2661342  0.4094152  0.3050051  0.23526447  0.08541735  0.187659883
	# [2,] -0.1235824 -0.2860403 -0.1001661 -0.07238416 -0.03994715 -0.006765459
	#            [,7]       [,8]       [,9]      [,10]       [,11]      [,12]
	# [1,]  0.2985369  0.3456564  0.3211533  0.3058313 -0.02716411  0.3968877
	# [2,] -0.2185035 -0.1958843 -0.2778964 -0.1739399  0.05868608 -0.1734127
	#           [,13]      [,14]      [,15]       [,16]       [,17]       [,18]
	# [1,]  0.1818045  0.1867680  0.3864555  0.24173095  0.13296151  0.10669643
	# [2,] -0.1914229 -0.2571183 -0.2878341 -0.03316943 -0.08012724 -0.09864317
	#           [,19]       [,20]      [,21]     [,22]      [,23]      [,24]
	# [1,]  0.3247788  0.09888853  0.2335130  0.197185  0.3916486  0.2299377
	# [2,] -0.1885535 -0.06676479 -0.1446138 -0.168720 -0.1606420 -0.1080171
	#           [,25]       [,26]      [,27]      [,28]      [,29]      [,30]
	# [1,]  0.3081023  0.27726703  0.3270115  0.3566278  0.3471540  0.2848579
	# [2,] -0.1731524 -0.09666468 -0.2613385 -0.1751110 -0.1413637 -0.2093456
	#           [,31]      [,32]       [,33]      [,34]      [,35]      [,36]
	# [1,]  0.1819744  0.4195369  0.13633008 0.07299894  0.2504122  0.3406345
	# [2,] -0.1804275 -0.3151363 -0.03673044 0.03481890 -0.1548564 -0.1914454
	#           [,37]       [,38]      [,39]      [,40]
	# [1,]  0.3474051  0.11352485 0.14023569  0.2818334
	# [2,] -0.3128464 -0.01846503 0.01060269 -0.1854476

}

