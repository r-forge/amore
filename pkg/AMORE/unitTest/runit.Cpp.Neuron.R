
###############################################################################
 test.Neuron.Cpp.Constructor_EmptyArgumentList <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		//Test
				NeuronPtr ptN(new Neuron());	
				ptN->show();	
				Container<Con>::const_iterator firstCon, lastCon;
				ptN->const_iterators(firstCon, lastCon);		
				int numOfCons = lastCon - firstCon;
				return	Rcpp::List::create(	Rcpp::Named(\"Id\") = ptN->getId(),
                        		  			Rcpp::Named(\"numOfCons\") = numOfCons
										);
	"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkTrue(is.na(result$Id))
	checkEquals(result$numOfCons, 0)
	# 
	# ------------------------
	# 
	#  Id: NA, Invalid neuron Id
	# ------------------------
	# 
	#  No connections defined
	# ------------------------
	# [1] TRUE
	# [1] TRUE
}


###############################################################################
test.Neuron.Cpp.Constructor_IdNumericConMissing <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		//Test
			NeuronPtr ptN(new Neuron(12));	
			ptN->show();	
			Container<Con>::const_iterator firstCon, lastCon;
			ptN->const_iterators(firstCon, lastCon);		
			int numOfCons = lastCon - firstCon;
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") 		= ptN->getId(),
										Rcpp::Named(\"numOfCons\") 	= numOfCons
									);
		"
testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
result <- testCodefun()
checkEquals(result$Id, 12)
checkEquals(result$numOfCons, 0)
# 
# ------------------------
# 
#  Id: 12
# ------------------------
# 
#  No connections defined
# ------------------------
# [1] TRUE
# [1] TRUE

}
 

###############################################################################
test.Neuron.Cpp.Constructor_FullArgumentList <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
				int ids[]= {1, 2, 3};
				double weights[]= {0.11, 0.22, 0.33};
				Container<Neuron> neuronContainer;
				std::vector<double> nWeights;
				NeuronPtr ptNeuron;
				for (int i=0; i<=2; i++) {
					ptNeuron.reset( new Neuron(ids[i]) );
					neuronContainer.push_back(ptNeuron);
					nWeights.push_back(weights[i]);					
				}
				ConContainerPtr vcPt(new ConContainer());
				vcPt->buildAndAppend( neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
		// Test	
				NeuronPtr ptN(new Neuron(123, vcPt->begin(), vcPt->end() ));
				ptN->show();

				Container<Con>::const_iterator firstCon, lastCon;
				ptN->const_iterators(firstCon, lastCon);		
				int numOfCons = lastCon - firstCon;
				
				std::vector<int> nIds;
				nWeights.clear();
				for( Container<Con>::const_iterator itrCon(firstCon) ;itrCon!=lastCon; ++itrCon) {
					nIds.push_back( (*itrCon)->getId() );
					nWeights.push_back( (*itrCon)->getWeight());
				}

				return	Rcpp::List::create(	Rcpp::Named(\"Id\") = ptN->getId(),
				Rcpp::Named(\"numOfCons\") = numOfCons,
				Rcpp::Named(\"nIds\") = nIds,
				Rcpp::Named(\"nWeights\") = nWeights
				);
				"
		testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
		result <- testCodefun()	
		checkEquals(result$Id, 123)
		checkEquals(result$numOfCons, 3)
		checkEquals(result$nIds, c(1, 2, 3))
		checkEquals(result$nWeights, c(0.11, 0.22, 0.33))
		# 
		# ------------------------
		# 
		#  Id: 123
		# ------------------------
		# From:	 1 	 Weight= 	 0.110000 
		# From:	 2 	 Weight= 	 0.220000 
		# From:	 3 	 Weight= 	 0.330000 
		# 
		# ------------------------
		# [1] TRUE
		# [1] TRUE
		# [1] TRUE
		# [1] TRUE
}
	



###############################################################################
test.Neuron.Cpp.getId <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			std::vector<int> result;
		//Test
			NeuronPtr ptN(new Neuron() );	
			result.push_back( ptN->getId() ) ;
			ptN.reset(new Neuron(12) );	
			result.push_back( ptN->getId() ) ;			
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c(NA, 12))
	# [1] TRUE
}




###############################################################################
test.Neuron.Cpp.setId <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<int> result;
			//Test
			NeuronPtr ptN(new Neuron() );	
			result.push_back( ptN->getId() ) ;		
			ptN->setId(12);
			result.push_back( ptN->getId() ) ;			
			ptN->setId(NA_INTEGER) ;
			result.push_back( ptN->getId() ) ;
			ptN->setId(35) ;		
			result.push_back( ptN->getId() ) ;			
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c(NA, 12, NA, 35))
	# [1] TRUE
}


###############################################################################
test.Neuron.Cpp.getFrom <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			int ids[]= {1, 2, 3};
			double weights[]= {0.11, 0.22, 0.33};
			NeuronContainer neuronContainer, nNeurons;
			std::vector<double> nWeights;
			NeuronPtr ptNeuron;
			for (int i=0; i<=2; i++) {
				ptNeuron.reset( new Neuron(ids[i]) );
				neuronContainer.push_back(ptNeuron);
				nWeights.push_back(weights[i]);					
			}
			ConContainerPtr vcPt(new ConContainer());
			vcPt->buildAndAppend( neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
			ptNeuron.reset(new Neuron(123, *vcPt));
			ptNeuron->show();
			// Test	
			nNeurons=ptNeuron->getFrom();			
			return wrap(nNeurons.getId());
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c(1, 2, 3))
	# 
	# ------------------------
	# 
	#  Id: 123
	# ------------------------
	# From:	 1 	 Weight= 	 0.110000 
	# From:	 2 	 Weight= 	 0.220000 
	# From:	 3 	 Weight= 	 0.330000 
	# 
	# ------------------------
	# [1] TRUE
}



###############################################################################
test.Neuron.Cpp.getConId <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			int ids[]= {1, 2, 3};
			double weights[]= {0.11, 0.22, 0.33};
			std::vector<NeuronPtr> neuronContainer;
			std::vector<double> nWeights;
			NeuronPtr ptNeuron;
			for (int i=0; i<=2; i++) {
			ptNeuron.reset( new Neuron(ids[i]) );
			neuronContainer.push_back(ptNeuron);
			nWeights.push_back(weights[i]);					
			}
			ConContainerPtr vcPt(new ConContainer());
			vcPt->buildAndAppend( neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
			NeuronPtr ptN(new Neuron(123, *vcPt));
			ptN->show();
		// Test		
			std::vector<int> result ( ptN->getConId() );
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c(1, 2, 3))
	# 
	# ------------------------
	# 
	#  Id: 123
	# ------------------------
	# From:	 1 	 Weight= 	 0.110000 
	# From:	 2 	 Weight= 	 0.220000 
	# From:	 3 	 Weight= 	 0.330000 
	# 
	# ------------------------
	# [1] TRUE

}



###############################################################################
test.Neuron.Cpp.getWeight <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			int ids[]= {1, 2, 3};
			double weights[]= {0.11, 0.22, 0.33};
			std::vector<NeuronPtr> neuronContainer;
			std::vector<double> nWeights;
			NeuronPtr ptNeuron;
			for (int i=0; i<=2; i++) {
				ptNeuron.reset( new Neuron(ids[i]) );
				neuronContainer.push_back(ptNeuron);
				nWeights.push_back(weights[i]);					
			}
			ConContainerPtr vcPt(new ConContainer());
			vcPt->buildAndAppend( neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
			// Test	
			NeuronPtr ptN(new Neuron(123, *vcPt));
			ptN->show();
			return	wrap(ptN->getWeight() );
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c(0.11, 0.22, 0.33))
	# 
	# ------------------------
	# 
	#  Id: 123
	# ------------------------
	# From:	 1 	 Weight= 	 0.110000 
	# From:	 2 	 Weight= 	 0.220000 
	# From:	 3 	 Weight= 	 0.330000 
	# 
	# ------------------------
	# [1] TRUE
}




###############################################################################
test.Neuron.Cpp.setFrom <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			int ids[]= {1, 2, 3, 4, 5, 6};
			double weights[]= {0.11, 0.22, 0.33};
			std::vector<NeuronPtr> neuronContainer;
			std::vector<double> nWeights;

			NeuronPtr ptNeuron;
			for (int i=0; i<=2; i++) {
				ptNeuron.reset( new Neuron(ids[i]) );
				neuronContainer.push_back(ptNeuron);
				nWeights.push_back(weights[i]);
			}

			ConContainerPtr vcPt(new ConContainer());
			vcPt->buildAndAppend( neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
			
			NeuronPtr ptN(new Neuron(123456 ,*vcPt));
			neuronContainer.clear();
			for (int i=3; i<=5; i++) {
				ptNeuron.reset( new Neuron(ids[i]) );
				neuronContainer.push_back(ptNeuron);
			}
		// Test		
			ptN->setFrom(neuronContainer);
			ptN->show();
			std::vector<int> result ( ptN->getConId() );
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c(4, 5, 6))
	# 
	# ------------------------
	# 
	#  Id: 123456
	# ------------------------
	# From:	 4 	 Weight= 	 0.110000 
	# From:	 5 	 Weight= 	 0.220000 
	# From:	 6 	 Weight= 	 0.330000 
	# 
	# ------------------------
	# [1] TRUE
}




###############################################################################
test.Neuron.Cpp.setWeight <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			int ids[]= {1, 2, 3, 4, 5, 6};
			double weights[]= {0.11, 0.22, 0.33, 0.44, 0.55, 0.66};
			std::vector<NeuronPtr> neuronContainer;
			std::vector<double> nWeights;
			
			NeuronPtr ptNeuron;
			for (int i=0; i<=2; i++) {
				ptNeuron.reset( new Neuron(ids[i]) );
				neuronContainer.push_back(ptNeuron);
				nWeights.push_back(weights[i]);
			}
			
			ConContainerPtr vcPt(new ConContainer());
			vcPt->buildAndAppend( neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
			
			NeuronPtr ptN(new Neuron(123456 ,*vcPt));
			nWeights.clear();
			for (int i=3; i<=5; i++) {
				nWeights.push_back(weights[i]);
			}
			// Test		
			ptN->setWeight(nWeights);
			ptN->show();
			std::vector<double> result ( ptN->getWeight() );
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c(0.44, 0.55, 0.66))
	# 
	# ------------------------
	# 
	#  Id: 123456
	# ------------------------
	# From:	 1 	 Weight= 	 0.440000 
	# From:	 2 	 Weight= 	 0.550000 
	# From:	 3 	 Weight= 	 0.660000 
	# 
	# ------------------------
	# [1] TRUE
}



###############################################################################
test.Neuron.Cpp.numOfCons <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
		// Data set up
			int ids[]= {1, 2, 3};
			double weights[]= {0.11, 0.22, 0.33};
			std::vector<NeuronPtr> neuronContainer;
			std::vector<double> nWeights;
			NeuronPtr ptNeuron;
			for (int i=0; i<=2; i++) {
				ptNeuron.reset( new Neuron(ids[i]) );
				neuronContainer.push_back(ptNeuron);
				nWeights.push_back(weights[i]);					
			}
			ConContainerPtr vcPt(new ConContainer());
			vcPt->buildAndAppend( neuronContainer.begin(), neuronContainer.end(), nWeights.begin(), nWeights.end() );
			NeuronPtr ptN(new Neuron(123, *vcPt));
		// Test	
			return wrap(ptN->numOfCons());
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, 3)
	# [1] TRUE
}


###############################################################################
test.Neuron.Cpp.Validate_IdIsNa <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			//Test
			NeuronPtr ptN(new Neuron());	
			ptN->validate();			
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	checkException( result <- testCodefun() , silent=TRUE)
}


###############################################################################
test.Neuron.Cpp.Validate_EmptyCon <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			//Test
			NeuronPtr ptN(new Neuron());	
			ptN->setId(12);
			ptN->validate();			// An empty con does not throw exception
			return wrap( ptN->getId() );			
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()
	checkEquals(result, 12 )
	# [1] TRUE
}
