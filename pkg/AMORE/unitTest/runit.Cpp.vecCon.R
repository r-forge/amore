# Unit Tests for the vecCon C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.vecCon.Cpp.push_back.getFromId.show <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			Neuron N1, N2, N3;
			vecCon MyvecCon;
			std::vector<int> result;
			
			N1.setId(10);
			N2.setId(20);
			N3.setId(30);
			
			ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
			MyvecCon.push_back(ptCon);				// push_back 
			ptCon.reset(  new Con(&N2, 2.22) );		// create new Con and assign to ptCon
			MyvecCon.push_back(ptCon);				// push_back
			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
			MyvecCon.push_back(ptCon);				// push_back
			
		// Test
			MyvecCon.show() ;
			MyvecCon.validate();		
			result=MyvecCon.getFromId();
			return wrap(result);
			"	
		testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
		result <- testCodefun()
		checkEquals(result, c(10, 20, 30))
	# From:	 10 	 Weight= 	 1.130000 
	# From:	 20 	 Weight= 	 2.220000 
	# From:	 30 	 Weight= 	 3.330000 
	# [1] TRUE		
}
			
			###############################################################################
			test.vecCon.Cpp.push_back.numOfCons <- function() {	
			###############################################################################
			incCode <- paste(
			paste(  "#define INLINE_R\n",						collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),			collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/vecAMORE.h"),		collapse = "\n" ),			
			paste(	readLines( "pkg/AMORE/src/vecCon.h"),		collapse = "\n" ),		
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/vecAMORE.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/vecCon.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),		collapse = "\n" ),	collapse = "\n")
			testCode <- '
	// Data set up
	Con Con1, Con2, Con3;
	Neuron N1, N2, N3;
	vecCon MyvecCon;
	std::vector<int> result;
	
	N1.setId(10);
	N2.setId(20);
	N3.setId(30);
	
	Con1.setFromNeuron(&N1);
	Con2.setFromNeuron(&N2);
	Con3.setFromNeuron(&N3);
	
	Con1.setWeight(1.01);
	Con2.setWeight(22.02);
	Con3.setWeight(333.03);			
	
	// Test
	result.push_back(MyvecCon.numOfCons());
	MyvecCon.push_back(Con1);
	result.push_back(MyvecCon.numOfCons());
	MyvecCon.push_back(Con2);
	result.push_back(MyvecCon.numOfCons());
	MyvecCon.push_back(Con3);
	result.push_back(MyvecCon.numOfCons());
	
	return wrap(result);
	'
			testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
			result <- testCodefun()
			checkEquals(result, c(0, 1, 2, 3))
			}
			
