# Unit Tests for the vecAMORE C++ class methods
# 
# Author: mcasl
###############################################################################


###############################################################################
test.vecAMORE.Cpp.validate.show<- function() {	
###############################################################################
#############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
			vecAMOREconSharedPtr	ptShvCon( new vecAMORE<Con>() );
			ConSharedPtr	ptC;
			NeuronSharedPtr ptN;
			int ids[]= {10, 20, 30};
			double weights[] = {1.13, 2.22, 3.33 };
			for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
				ptN.reset( new Neuron( ids[i] ) ); 	
				ptShvNeuron->push_back(ptN);
			}
			for (int i=0; i<=2 ; i++) {				// and a vector with three connections
				ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );  	
				ptShvCon->push_back(ptC);			 
			}			 
		// Test
			ptShvCon->show() ;
			ptShvCon->validate();		
			return wrap(1);
			"
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
	testCode <- "
			// Data set up
				std::vector<int> result;
				vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
				vecAMOREconSharedPtr	ptShvCon( new vecAMORE<Con>() );
				ConSharedPtr	ptC;
				NeuronSharedPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
			// Test
				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					ptShvNeuron->push_back(ptN);
				}
				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );  	
					ptShvCon->push_back(ptC);			 
				}			 
				for (int i=0; i<=2 ; i++) {				// get Ids. vecAMORE does not have getFromId defined
					result.push_back( ptShvCon->getLdata().at(i)->getFromId());
				}
				return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


###############################################################################
test.vecAMORE.Cpp.size<- function() {	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
				std::vector<int> result;
				vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
				vecAMOREconSharedPtr	ptShvCon( new vecAMORE<Con>() );
				ConSharedPtr	ptC;
				NeuronSharedPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
			// Test
				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					ptShvNeuron->push_back(ptN);
				}
				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );  	
					ptShvCon->push_back(ptC);			 
					result.push_back(ptShvCon->size());
				}			 
				return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(1,2,3))
	# [1] TRUE
}



###############################################################################
test.vecAMORE.Cpp.setLdata.getLdata<- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> result;
				std::vector<ConSharedPtr> vcA, vcB;
				vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
				vecAMOREconSharedPtr	ptShvCon( new vecAMORE<Con>() );
				ConSharedPtr	ptC;
				NeuronSharedPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					ptShvNeuron->push_back(ptN);
				}
				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );  	
					vcA.push_back(ptC);			 
				}			 

	// Test
			ptShvCon->setLdata(vcA);
			vcB = ptShvCon->getLdata();
			for (int i=0; i<=2 ; i++) {					// get Ids. vecAMORE does not have getFromId defined
					result.push_back( vcB.at(i)->getFromId());
			}
		
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	checkEquals(result, c(10,20,30))
	# [1] TRUE
}


################################################################################
test.vecAMORE.Cpp.append<- function() {	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> result;
				std::vector<ConSharedPtr> vcA, vcB;
				vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
				vecAMOREconSharedPtr	ptShvConA( new vecAMORE<Con>() );
				vecAMOREconSharedPtr	ptShvConB( new vecAMORE<Con>() );
				ConSharedPtr	ptC;
				NeuronSharedPtr ptN;
				int ids[]= {1, 2, 3, 4, 5, 6};
				double weights[] = {1.13, 2.22, 3.33, 5.6, 4.2, 3.6 };
				for (int i=0; i<=5 ; i++) {				// Let's create a vector with six neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					ptShvNeuron->push_back(ptN);
				}
				for (int i=0; i<=2 ; i++) {				// A vector with three connections
					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );  	
					ptShvConA->push_back(ptC);			 
				}			 
				for (int i=3; i<=5 ; i++) {				// Another vector with three connections
					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );  	
					ptShvConB->push_back(ptC);			 
				}			 
	// Test
				ptShvConA->append(*ptShvConB);
				ptShvConA->validate();		
				ptShvConA->show() ;
		
	// Get Ids (vecAMORE does not know about vecCon::getFromId yet, thus the loop)		
				for (std::vector<ConSharedPtr>::iterator itr = ptShvConA->getLdata().begin();   itr != ptShvConA->getLdata().end();   itr++)	{
					 result.push_back( (*itr)->getFromId() );
				 }
				return wrap(result);
		"
testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
result <- testCodefun()
checkEquals(result, c(1,2,3,4,5,6))
# From:	 1 	 Weight= 	 1.130000 
# From:	 2 	 Weight= 	 2.220000 
# From:	 3 	 Weight= 	 3.330000 
# From:	 4 	 Weight= 	 5.600000 
# From:	 5 	 Weight= 	 4.200000 
# From:	 6 	 Weight= 	 3.600000 
# [1] TRUE
}
