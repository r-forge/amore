# Unit Tests for the vecAMORE C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.vecAMORE.Cpp.validate.show<- function() {	
###############################################################################
#############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
		// Data set up
			Neuron N1, N2, N3;
			vecAMORE<Con> MyvecCon;

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
			return wrap(1);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 1)
	# From:	 10 	 Weight= 	 1.130000 
	# From:	 20 	 Weight= 	 2.220000 
	# From:	 30 	 Weight= 	 3.330000 
	# [1] TRUE
}



###############################################################################
test.vecAMORE.Cpp.push_back<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
		// Data set up
			Neuron N1, N2, N3;
			vecAMORE<Con> MyvecCon;
			std::vector<ConSharedPtr> vc;
			std::vector<int> result;
			N1.setId(10);
			N2.setId(20);
			N3.setId(30);
		// Test
			ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
			MyvecCon.push_back(ptCon);				// push_back 
			ptCon.reset(  new Con(&N2, 2.22) );		// create new Con and assign to ptCon
			MyvecCon.push_back(ptCon);				// push_back
			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
			MyvecCon.push_back(ptCon);				// push_back
				
			vc = MyvecCon.getLdata();
			
			result.push_back(vc.at(0)->getFromId());
			result.push_back(vc.at(1)->getFromId());
			result.push_back(vc.at(2)->getFromId());

			return wrap(result);
			'
	
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


###############################################################################
test.vecAMORE.Cpp.size<- function() {	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
			// Data set up
			Neuron N1, N2, N3;
			vecAMORE<Con> MyvecCon;
			std::vector<int> result;
			N1.setId(10);
			N2.setId(20);
			N3.setId(30);
		// Test
			result.push_back(MyvecCon.size());
			ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
			MyvecCon.push_back(ptCon);				// push_back 
			result.push_back(MyvecCon.size());
			ptCon.reset(  new Con(&N2, 2.22) );		// create new Con and assign to ptCon
			MyvecCon.push_back(ptCon);				// push_back
			result.push_back(MyvecCon.size());
			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
			MyvecCon.push_back(ptCon);				// push_back
			result.push_back(MyvecCon.size());
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(0,1,2,3))
	# [1] TRUE
}



###############################################################################
test.vecAMORE.Cpp.setLdata.getLdata<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
		// Data set up
			Neuron N1, N2, N3;
			vecAMORE<Con> MyvecCon;
			std::vector<int> result;
			std::vector<ConSharedPtr> vcA, vcB;

			N1.setId(10);
			N2.setId(20);
			N3.setId(30);

		// Test
			ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
			vcA.push_back(ptCon);				// push_back 
			ptCon.reset( new Con(&N2, 2.22) );		// create new Con and assign to ptCon
			vcA.push_back(ptCon);				// push_back
			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
			vcA.push_back(ptCon);				// push_back

			MyvecCon.setLdata(vcA);
			vcB = MyvecCon.getLdata();

			result.push_back(vcB.at(0)->getFromId());
			result.push_back(vcB.at(1)->getFromId());
			result.push_back(vcB.at(2)->getFromId());			
			return wrap(result);
			'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


################################################################################
test.vecAMORE.Cpp.append<- function() {	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- '
		// Data set up
		Con Con1, Con2, Con3, Con4, Con5, Con6;
		Neuron N1, N2, N3, N4, N5, N6;
		vecAMORE<Con> vc1, vc2;
		std::vector<int> result;
		
		N1.setId(10);
		N2.setId(20);
		N3.setId(30);
		N4.setId(40);
		N5.setId(50);
		N6.setId(60);
		
		Con1.setFromNeuron(&N1);
		Con2.setFromNeuron(&N2);
		Con3.setFromNeuron(&N3);
		Con4.setFromNeuron(&N4);
		Con5.setFromNeuron(&N5);
		Con6.setFromNeuron(&N6);
		
		Con1.setWeight(1.01);
		Con2.setWeight(22.02);
		Con3.setWeight(333.03);			
		Con4.setWeight(5.4);
		Con5.setWeight(2.22);
		Con6.setWeight(33.03);			
		
		vc1.push_back(Con1);
		vc1.push_back(Con2);
		vc1.push_back(Con3);
		vc2.push_back(Con4);
		vc2.push_back(Con5);
		vc2.push_back(Con6);
		
		// Append test
		vc1.append(vc2);
		vc1.validate();		
		vc1.show() ;
		
		// Get Ids (vecAMORE does not know about vecCon::getFromId yet, thus the loop)		
		for(std::vector<Con>::iterator itr = (vc1.getLdata()).begin();   itr != (vc1.getLdata()).end();   itr++)	{ result.push_back(itr->getFromId()); }
		return wrap(result);
		'
testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
result <- testCodefun()
checkEquals(result, c(10,20,30,40,50,60))
}
