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
		Neuron N1, N2, N3, N4, N5, N6;
		vecAMORE<Con> vcA, vcB;
		std::vector<int> result;	
		
		N1.setId(10);
		N2.setId(20);
		N3.setId(30);
		N4.setId(40);
		N5.setId(50);
		N6.setId(60);

	// Test
		ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// Create and store in vcA three Cons 
		vcA.push_back(ptCon);					 
		ptCon.reset( new Con(&N2, 2.22) );		
		vcA.push_back(ptCon);					
		ptCon.reset(  new Con(&N3, 3.33) );		
		vcA.push_back(ptCon);					

		ptCon.reset( new Con(&N4, 1.13) );  	// Create and store in vcB three more Cons
		vcB.push_back(ptCon);					 
		ptCon.reset( new Con(&N5, 2.22) );		
		vcB.push_back(ptCon);					
		ptCon.reset(  new Con(&N6, 3.33) );		
		vcB.push_back(ptCon);					

		// Append test
		vcA.append(vcB);
		vcA.validate();		
		vcA.show() ;
		
		// Get Ids (vecAMORE does not know about vecCon::getFromId yet, thus the loop)		
		for(std::vector<ConSharedPtr>::iterator itr = (vcA.getLdata()).begin();   itr != (vcA.getLdata()).end();   itr++)	{ result.push_back((*itr)->getFromId()); }
		return wrap(result);
		'
testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
result <- testCodefun()
checkEquals(result, c(10,20,30,40,50,60))
# From:	 10 	 Weight= 	 1.130000 
# From:	 20 	 Weight= 	 2.220000 
# From:	 30 	 Weight= 	 3.330000 
# From:	 40 	 Weight= 	 1.130000 
# From:	 50 	 Weight= 	 2.220000 
# From:	 60 	 Weight= 	 3.330000 
# [1] TRUE
}
