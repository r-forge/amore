
###############################################################################
test.NeuronContainer.Cpp.Constructor <- function() {	
###############################################################################	
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			int ids[]= {1, 2, 3};
			double weights[]= {0.11, 0.22, 0.33};
			std::vector<NeuronPtr> vNeuron;
			std::vector<double> vWeight;
			NeuronPtr ptNeuron;
			for (int i=0; i<=2; i++) {
			ptNeuron.reset( new Neuron(ids[i]) );
			vNeuron.push_back(ptNeuron);
			vWeight.push_back(weights[i]);					
			}
			ConContainerPtr vcPt(new ConContainer());
			vcPt->buildAndAppend(vNeuron, vWeight);
			// Test	
			NeuronPtr ptN(new Neuron(123, *vcPt));
			ptN->show();
			return	Rcpp::List::create(	Rcpp::Named(\"Id\") = ptN->getId(),
			Rcpp::Named(\"numOfCons\") = ptN->numOfCons(),
			Rcpp::Named(\"ConId\") = ptN->getConId(),
			Rcpp::Named(\"Weight\") = ptN->getWeight()
			);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result$Id, 123)
	checkEquals(result$numOfCons, 3)
	checkEquals(result$ConId, c(1, 2, 3))
	checkEquals(result$Weight, c(0.11, 0.22, 0.33))
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

