# Unit Tests for the vecAMORE C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.vecAMORE.Cpp.validate.show<- function() {	
###############################################################################
	incCode <- paste(
			paste(  "#define INLINE_R\n",						collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),			collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/vecAMORE.h"),		collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/vecAMORE.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),		collapse = "\n" ),	collapse = "\n")
	testCode <- '
			// Data set up
			Con Con1, Con2, Con3;
			Neuron N1, N2, N3;
			vecAMORE<Con> MyvecCon;
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
			
			MyvecCon.push_back(Con1);
			MyvecCon.push_back(Con2);
			MyvecCon.push_back(Con3);
			
			MyvecCon.show() ;

			// Validate test
			MyvecCon.validate();		
			return wrap(1);
			'
	testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- testCodefun()
	checkEquals(result, 1)
}



###############################################################################
test.vecAMORE.Cpp.push_back<- function() {	
###############################################################################
	incCode <- paste(
			paste(  "#define INLINE_R\n",						collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),			collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/vecAMORE.h"),		collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/vecAMORE.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),		collapse = "\n" ),	collapse = "\n")
	testCode <- '
			// Data set up
			Con Con1, Con2, Con3;
			Neuron N1, N2, N3;
			vecAMORE<Con> MyvecCon;
			std::vector<int> result;
			std::vector<Con> vc;

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

			MyvecCon.push_back(Con1);
			MyvecCon.push_back(Con2);
			MyvecCon.push_back(Con3);
			MyvecCon.show();
			MyvecCon.validate();		
			
			vc = MyvecCon.getLdata();
			
			result.push_back(vc.at(0).getFromId());
			result.push_back(vc.at(1).getFromId());
			result.push_back(vc.at(2).getFromId());

			return wrap(result);
			'
	testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- testCodefun()
	checkEquals(result, c(10,20,30))

}


###############################################################################
test.vecAMORE.Cpp.size<- function() {	
###############################################################################
	incCode <- paste(
			paste(  "#define INLINE_R\n",						collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),			collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/vecAMORE.h"),		collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/vecAMORE.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),		collapse = "\n" ),	collapse = "\n")
	testCode <- '
			// Data set up
			Con Con1, Con2, Con3;
			Neuron N1, N2, N3;
			vecAMORE<Con> MyvecCon;
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
			
			result.push_back(MyvecCon.size());

			MyvecCon.push_back(Con1);
			result.push_back(MyvecCon.size());

			MyvecCon.push_back(Con2);
			result.push_back(MyvecCon.size());

			MyvecCon.push_back(Con3);
			result.push_back(MyvecCon.size());
			
			return wrap(result);
			'
	testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- testCodefun()
	checkEquals(result, c(0,1,2,3))
}



###############################################################################
test.vecAMORE.Cpp.setLdata.getLdata<- function() {	
###############################################################################
	incCode <- paste(
			paste(  "#define INLINE_R\n",						collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/AMORE.h"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.h"),			collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/vecAMORE.h"),		collapse = "\n" ),											
			paste(	readLines( "pkg/AMORE/src/Neuron.h"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Con.cpp"),		collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/vecAMORE.cpp"),	collapse = "\n" ),
			paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),		collapse = "\n" ),	collapse = "\n")
	testCode <- '
			// Data set up
			Con Con1, Con2, Con3;
			Neuron N1, N2, N3;
			vecAMORE<Con> MyvecCon;
			std::vector<int> result;
			std::vector<Con> vcA, vcB;
			
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
			
			vcA.push_back(Con1);
			vcA.push_back(Con2);
			vcA.push_back(Con3);
		
			MyvecCon.setLdata(vcA);
			
			vcB = MyvecCon.getLdata();
			
			result.push_back(vcB.at(0).getFromId());
			result.push_back(vcB.at(1).getFromId());
			result.push_back(vcB.at(2).getFromId());
			
			return wrap(result);
			'
	testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
}


################################################################################
test.vecAMORE.Cpp.append<- function() {	
################################################################################
incCode <- paste(
		paste(  "#define INLINE_R\n",						collapse = "\n" ),
		paste(	readLines( "pkg/AMORE/src/AMORE.h"),		collapse = "\n" ),
		paste(	readLines( "pkg/AMORE/src/Con.h"),			collapse = "\n" ),											
		paste(	readLines( "pkg/AMORE/src/vecAMORE.h"),		collapse = "\n" ),											
		paste(	readLines( "pkg/AMORE/src/Neuron.h"),		collapse = "\n" ),
		paste(	readLines( "pkg/AMORE/src/Con.cpp"),		collapse = "\n" ),
		paste(	readLines( "pkg/AMORE/src/vecAMORE.cpp"),	collapse = "\n" ),
		paste(	readLines( "pkg/AMORE/src/Neuron.cpp"),		collapse = "\n" ),	collapse = "\n")
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
testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
result <- testCodefun()
checkEquals(result, c(10,20,30,40,50,60))
}
