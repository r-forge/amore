# Unit Tests for the vecAMORE C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
#test.vecAMORE.Cpp.push_back <- function() {	
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
		MyvecCon.validate();		
		return wrap(1);
		
		'
testCodefun <- cxxfunction( signature(), body=testCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
result <- testCodefun()
checkEquals(result, 1)


#}
# From:	 10 	 Weight= 	 1.010000 
# From:	 20 	 Weight= 	 22.020000 
# From:	 30 	 Weight= 	 333.030000 
# [1] TRUE

