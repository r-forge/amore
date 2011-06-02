# Unit Tests for the vecCon C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.vecCon.Cpp.push_back.getFromId <- function() {	
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
	# [1] TRUE		
}

###############################################################################
test.vecCon.Cpp.numOfCons.show <- function() {	
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

			// Test
			result.push_back(MyvecCon.numOfCons());		// Append numOfCons to result, create new Con and push_back into MyvecCon	
			ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// and repeat twice
			MyvecCon.push_back(ptCon);				 
			result.push_back(MyvecCon.numOfCons());

			ptCon.reset(  new Con(&N2, 2.22) );		
			MyvecCon.push_back(ptCon);				
			result.push_back(MyvecCon.numOfCons());

			ptCon.reset(  new Con(&N3, 3.33) );		
			MyvecCon.push_back(ptCon);				
			result.push_back(MyvecCon.numOfCons());
			
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(0, 1, 2, 3))
	# [1] TRUE
}



###############################################################################
test.vecCon.Cpp.BuildAppend <- function() {	
###############################################################################
incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
testCode <- "
			// Data set up
			std::vector<int> result;
			vecCon MyvecCon;
			std::vector<NeuronSharedPtr> vNeuron;
			std::vector<double> vWeight;


			// Test	
			NeuronSharedPtr ptNeuron( new Neuron(11) );
			vNeuron.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(22) );
			vNeuron.push_back(ptNeuron);	
			ptNeuron.reset( new Neuron(33) );
			vNeuron.push_back(ptNeuron);	

			vWeight.push_back(12.3);
			vWeight.push_back(1.2);
			vWeight.push_back(2.1);

			MyvecCon.buildAndAppend(vNeuron, vWeight);

			result=MyvecCon.getFromId();
			return wrap(result);
		"
testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
result <- testCodefun()
checkEquals(result, c( 11, 22, 33))
# [1] TRUE
}






