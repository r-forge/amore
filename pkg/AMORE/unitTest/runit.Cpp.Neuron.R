
###############################################################################
//test.VecCon.Cpp.getWeight_FromIsNumeric <- function() {	
	###############################################################################
	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- "
			// Data set up
			std::vector<double> result;
			std::vector<NeuronPtr> vNeuron;
			VecConPtr	ptShvCon( new VecCon() );
			ConPtr	ptC;
			NeuronPtr ptN;
			int ids[]= {11, 10, 9, 3, 4, 5, 6, 7, 8, 2, 1};
			double weights[]={11.32, 1.26, 2.14, 3.16, 4.14, 5.19, 6.18, 7.16, 8.14, 9.12, 10.31};
			std::vector<double> vWeight;
			for (int i=0; i<11; i++) {
			vWeight.push_back(weights[i]);
			}
			for (int i=0; i<vWeight.size() ; i++) {				// Let's create a vector with three neurons
			ptN.reset( new Neuron( ids[i] ) ); 	
			vNeuron.push_back(ptN);
			}
			ptShvCon->buildAndAppend(vNeuron, vWeight);			 
			
			// Test
			std::vector<int> toSelect;
			toSelect.push_back(1);
			toSelect.push_back(3);
			toSelect.push_back(5);
			toSelect.push_back(7);
			
			result=ptShvCon->getWeight(toSelect);
			return wrap(result);
			"
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())	
	result <- testCodefun()	
	checkEquals(result, c( 10.31, 3.16,  5.19, 7.16))
	# [1] TRUE
//}
