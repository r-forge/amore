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
				std::vector<int> result;
				std::vector<ConSharedPtr> vcA, vcB;
				vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
				vecConSharedPtr	ptShvCon( new vecCon() );
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
			result=ptShvCon->getFromId();
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
test.vecCon.Cpp.numOfCons.show <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
	// Data set up
				std::vector<int> result;
				std::vector<ConSharedPtr> vcA, vcB;
				vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
				vecConSharedPtr	ptShvCon( new vecCon() );
				ConSharedPtr	ptC;
				NeuronSharedPtr ptN;
				int ids[]= {10, 20, 30};
				double weights[] = {1.13, 2.22, 3.33 };
				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					ptShvNeuron->push_back(ptN);
				}
				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
					result.push_back(ptShvCon->numOfCons());		// Append numOfCons to result, create new Con and push_back into MyvecCon	
					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );  	
					ptShvCon->push_back(ptC);			 
				}		
	// Test
			ptShvCon->show() ;
			ptShvCon->validate();					
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(0, 1, 2))
	# From:	 10 	 Weight= 	 1.130000 
	# From:	 20 	 Weight= 	 2.220000 
	# From:	 30 	 Weight= 	 3.330000 
	# [1] TRUE
}



###############################################################################
test.vecCon.Cpp.BuildAppend <- function() {	
###############################################################################
incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
testCode <- "
			// Data set up
				std::vector<int> result;
				std::vector<NeuronSharedPtr> vNeuron;
				vecConSharedPtr	ptShvCon( new vecCon() );
				ConSharedPtr	ptC;
				NeuronSharedPtr ptN;
				int ids[]= {10, 20, 30};
				std::vector<double> vWeight;
				vWeight.push_back(12.3);
				vWeight.push_back(1.2);
				vWeight.push_back(2.1);
				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
					ptN.reset( new Neuron( ids[i] ) ); 	
					vNeuron.push_back(ptN);
				}
				ptShvCon->buildAndAppend(vNeuron, vWeight);			 
			// Test	
				result=ptShvCon->getFromId();
				return wrap(result);
		"
testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
result <- testCodefun()
checkEquals(result, c( 10, 20, 30))
# [1] TRUE
}

###############################################################################
test.vecCon.Cpp.Validate_Weight_Inf <- function() {	
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
				vWeight.push_back(1.2/0);
				vWeight.push_back(2.1);
			
				MyvecCon.buildAndAppend(vNeuron, vWeight);
				MyvecCon.validate();
				return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	checkException(result <- testCodefun(), silent=TRUE)
	# [1] TRUE
	# (plus a few reasonable warnings from the compiler related to 1.2/0 )
}



###############################################################################
test.vecCon.Cpp.setFromNeuron <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			std::vector<int> result;
			vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
			vecConSharedPtr	ptShvCon( new vecCon() );
			ConSharedPtr	ptC;
			NeuronSharedPtr ptN;

			int ids[]= {10, 20, 30};
			double weights[] = {1.13, 2.22, 3.33 };

			for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
				ptN.reset( new Neuron( ids[i] ) ); 	
				ptShvNeuron->push_back(ptN);
			}
			for (int i=0; i<=2 ; i++) {				// and a vector with three connections
				ptC.reset( new Con() );  	
				ptShvCon->push_back(ptC);			 
			}		
			// Test
			ptShvCon->setFromNeuron(ptShvNeuron->getLdata()) ;
			ptShvCon->show();		
			result=ptShvCon->getFromId();
			return wrap(result);
			"	
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c(10, 20, 30))
	# From:	 10 	 Weight= 	 0.000000 
	# From:	 20 	 Weight= 	 0.000000 
	# From:	 30 	 Weight= 	 0.000000 
	# [1] TRUE
}







###############################################################################
test.vecCon.Cpp.Validate_Duplicated_Id <- function() {	
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
			ptNeuron.reset( new Neuron(11) );
			vNeuron.push_back(ptNeuron);	
			
			vWeight.push_back(12.3);
			vWeight.push_back(1.2);
			vWeight.push_back(2.1);
			
			MyvecCon.buildAndAppend(vNeuron, vWeight);
			MyvecCon.validate();
			return wrap(true);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	checkException(result <- testCodefun(), silent=TRUE)
}


###############################################################################
test.vecCon.Cpp.getWeight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			std::vector<double> result;
			int ids[]= {1, 2, 3};
			double weights[] = {12.3, 1.2, 2.1 };
			vecCon MyvecCon;
			std::vector<NeuronSharedPtr> vNeuron;
			std::vector<double> vWeight;
			NeuronSharedPtr ptNeuron;

			for (int i=0; i<=2; i++) {
				ptNeuron.reset( new Neuron(ids[i]) );
				vNeuron.push_back(ptNeuron);	
				vWeight.push_back(weights[i]);	
			}
			MyvecCon.buildAndAppend(vNeuron, vWeight);

		// Test			
			result=MyvecCon.getWeight();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 12.3, 1.2, 2.1))
	# [1] TRUE
}



###############################################################################
test.vecCon.Cpp.setWeight <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<double> result;
			int ids[]= {1, 2, 3};
			double weights[] = {12.3, 1.2, 2.1 };
			vecCon MyvecCon;
			std::vector<NeuronSharedPtr> vNeuron;
			std::vector<double> vWeight;
			NeuronSharedPtr ptNeuron;
			
			for (int i=0; i<=2; i++) {
			ptNeuron.reset( new Neuron(ids[i]) );
			vNeuron.push_back(ptNeuron);	
			vWeight.push_back(0);					// weights are set to 0
			}
			MyvecCon.buildAndAppend(vNeuron, vWeight);
			MyvecCon.show();
			
			for (int i=0; i<=2; i++) {
				vWeight.at(i)=weights[i];	
			}
			// Test			
			MyvecCon.setWeight(vWeight);			// weights are set to 12.3, 1.2 and 2.1	
			result=MyvecCon.getWeight();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 12.3, 1.2, 2.1))
	# [1] TRUE
}


###############################################################################
test.vecCon.Cpp.getFromNeuron <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			std::vector<double> result;
			int ids[]= {1, 2, 3};
			double weights[] = {12.3, 1.2, 2.1 };
			vecCon MyvecCon;
			std::vector<NeuronSharedPtr> vNeuron;
			std::vector<double> vWeight;
			NeuronSharedPtr ptNeuron;
			
			for (int i=0; i<=2; i++) {
				ptNeuron.reset( new Neuron(ids[i]) );
				vNeuron.push_back(ptNeuron);	
				vWeight.push_back(weights[i]);					
			}
			MyvecCon.buildAndAppend(vNeuron, vWeight);
		// Test			
			vNeuron=MyvecCon.getFromNeuron();				
			for (int i=0; i<=2; i++) {
				result.push_back(vNeuron.at(i)->getId());		
			}
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, c( 1, 2, 3))
	# [1] TRUE
}



###############################################################################
test.vecCon.Cpp.erase <- function() {	
###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<int> result;
			std::vector<NeuronSharedPtr> vNeuron;
			vecConSharedPtr	ptShvCon( new vecCon() );
			vecConSharedPtr vErased;
			ConSharedPtr	ptC;
			NeuronSharedPtr ptN;
			int ids[]= {11, 10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
			std::vector<double> vWeight;
			vWeight.push_back(11.32);			vWeight.push_back(1.26);			vWeight.push_back(2.14);			vWeight.push_back(3.16);
			vWeight.push_back(4.14);			vWeight.push_back(5.19);			vWeight.push_back(6.18);			vWeight.push_back(7.16);
			vWeight.push_back(8.14);			vWeight.push_back(9.12);			vWeight.push_back(10.31);
	
			for (int i=0; i<vWeight.size() ; i++) {				// Let's create a vector with three neurons
				ptN.reset( new Neuron( ids[i] ) ); 	
				vNeuron.push_back(ptN);
			}
			ptShvCon->buildAndAppend(vNeuron, vWeight);			 

			// Test	

			std::vector<int> toRemove;
			toRemove.push_back(1);
			toRemove.push_back(3);
			toRemove.push_back(5);
			toRemove.push_back(7);

			ptShvCon->erase(toRemove);
			ptShvCon->show();
			result=ptShvCon->getFromId();
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c( 2,  4,  6, 8,  9, 10, 11))
	# From:	 2 	 Weight= 	 9.120000 
	# From:	 4 	 Weight= 	 4.140000 
	# From:	 6 	 Weight= 	 6.180000 
	# From:	 8 	 Weight= 	 8.140000 
	# From:	 9 	 Weight= 	 2.140000 
	# From:	 10 	 Weight= 	 1.260000 
	# From:	 11 	 Weight= 	 11.320000 
	# [1] TRUE
}


