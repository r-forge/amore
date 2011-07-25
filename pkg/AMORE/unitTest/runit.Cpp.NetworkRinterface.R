
###############################################################################
test.NetworkRinterface.Cpp.show_UninitializedNetwork <- function() {	
###############################################################################	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NetworkRinterface networkRinterface;
			// Test
			networkRinterface.show();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	# Uninitialized network. Please use any of the create methods available.
}


###############################################################################
test.NetworkRinterface.Cpp.show_InitializedNetwork <- function() {	
###############################################################################	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NetworkRinterface networkRinterface;
			// Test
			networkRinterface.createFeedForwardNetwork(numberOfNeurons);
			networkRinterface.show();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(numberOfNeurons="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,4,5,3))	
	
	# 
	# 
	# =========================================================
	#          Input Layer
	# =========================================================
	# 
	# -----------------------------------
	#  Id: 1
	# -----------------------------------
	#  output: 0.000000
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 2
	# -----------------------------------
	#  output: 0.000000
	# -----------------------------------
	# 
	# =========================================================
	#          Hidden Layers
	# =========================================================
	# 
	# -----------------------------------
	#  Id: 3
	# -----------------------------------
	#  bias: -0.060865
	#  output: 0.000000
	# -----------------------------------
	# From:	 1 	 Weight= 	 -0.034474
	# From:	 2 	 Weight= 	 -0.208815
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 4
	# -----------------------------------
	#  bias: -0.043078
	#  output: 0.000000
	# -----------------------------------
	# From:	 1 	 Weight= 	 0.049624
	# From:	 2 	 Weight= 	 0.165973
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 5
	# -----------------------------------
	#  bias: 0.226208
	#  output: 0.000000
	# -----------------------------------
	# From:	 1 	 Weight= 	 -0.096764
	# From:	 2 	 Weight= 	 0.041281
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 6
	# -----------------------------------
	#  bias: -0.204145
	#  output: 0.000000
	# -----------------------------------
	# From:	 1 	 Weight= 	 -0.053963
	# From:	 2 	 Weight= 	 -0.078895
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 7
	# -----------------------------------
	#  bias: 0.028852
	#  output: 0.000000
	# -----------------------------------
	# From:	 3 	 Weight= 	 0.045517
	# From:	 4 	 Weight= 	 -0.058829
	# From:	 5 	 Weight= 	 -0.107933
	# From:	 6 	 Weight= 	 -0.096048
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 8
	# -----------------------------------
	#  bias: -0.220832
	#  output: 0.000000
	# -----------------------------------
	# From:	 3 	 Weight= 	 0.035671
	# From:	 4 	 Weight= 	 0.214203
	# From:	 5 	 Weight= 	 -0.174332
	# From:	 6 	 Weight= 	 -0.012899
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 9
	# -----------------------------------
	#  bias: -0.170187
	#  output: 0.000000
	# -----------------------------------
	# From:	 3 	 Weight= 	 0.212855
	# From:	 4 	 Weight= 	 0.201016
	# From:	 5 	 Weight= 	 -0.061297
	# From:	 6 	 Weight= 	 -0.102799
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 10
	# -----------------------------------
	#  bias: -0.104461
	#  output: 0.000000
	# -----------------------------------
	# From:	 3 	 Weight= 	 -0.216360
	# From:	 4 	 Weight= 	 0.013905
	# From:	 5 	 Weight= 	 -0.210369
	# From:	 6 	 Weight= 	 -0.164582
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 11
	# -----------------------------------
	#  bias: -0.033844
	#  output: 0.000000
	# -----------------------------------
	# From:	 3 	 Weight= 	 0.225484
	# From:	 4 	 Weight= 	 -0.175755
	# From:	 5 	 Weight= 	 0.174282
	# From:	 6 	 Weight= 	 -0.075774
	# -----------------------------------
	# 
	# =========================================================
	#          Output Layer
	# =========================================================
	# 
	# -----------------------------------
	#  Id: 12
	# -----------------------------------
	#  bias: -0.160672
	#  output: 0.000000
	# -----------------------------------
	# From:	 7 	 Weight= 	 0.179381
	# From:	 8 	 Weight= 	 0.149133
	# From:	 9 	 Weight= 	 -0.025823
	# From:	 10 	 Weight= 	 0.084510
	# From:	 11 	 Weight= 	 -0.052451
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 13
	# -----------------------------------
	#  bias: -0.161888
	#  output: 0.000000
	# -----------------------------------
	# From:	 7 	 Weight= 	 -0.190744
	# From:	 8 	 Weight= 	 -0.211463
	# From:	 9 	 Weight= 	 0.143269
	# From:	 10 	 Weight= 	 -0.110210
	# From:	 11 	 Weight= 	 -0.061190
	# -----------------------------------
	# 
	# -----------------------------------
	#  Id: 14
	# -----------------------------------
	#  bias: 0.080368
	#  output: 0.000000
	# -----------------------------------
	# From:	 7 	 Weight= 	 -0.080062
	# From:	 8 	 Weight= 	 0.005857
	# From:	 9 	 Weight= 	 0.199951
	# From:	 10 	 Weight= 	 0.159832
	# From:	 11 	 Weight= 	 0.156462
	# -----------------------------------
	# =========================================================

}



###############################################################################
test.NetworkRinterface.Cpp.createFeedForwardNetwork <- function() {	
###############################################################################	
	
	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up			
			NetworkRinterface networkRinterface;
			// Test
			networkRinterface.createFeedForwardNetwork(numberOfNeurons);
			networkRinterface.show();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(numberOfNeurons="numeric"), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun(c(2,4,5,3))	
	
	
}

