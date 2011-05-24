# Unit Tests for the Con C++ class methods
# 
# Author: mcasl
###############################################################################


test.Con.Cpp.setAndgetFromNeuron <- function() {	
	funCode <- '
			Con micon;
			Neuron nn;
			Neuron * ptnn;
			nn.setId(1);
			micon.setFromNeuron(&nn);
			
			ptnn = micon.getFromNeuron();
			int result= ptnn->getId();
			return wrap(result);
			'
	
	incCode <- paste( readLines( "pkg/AMORE/src/Con.cpp"), collapse = "\n" )
	fx <- cxxfunction( signature(), body=funCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- fx()
	checkEquals(result, 1)
}


test.Con.Cpp.getFromId<- function() {	
	funCode <- '
			Con micon;
			Neuron nn;
			nn.setId(16);
			micon.setFromNeuron(&nn);
			
			int result= micon.getFromId();
			return wrap(result);
			'
	
	incCode <- paste( readLines( "pkg/AMORE/src/Con.cpp"), collapse = "\n" )
	fx <- cxxfunction( signature(), body=funCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- fx()
	checkEquals(result, 16)
}


test.Con.Cpp.setAndgetWeight <- function() {	
	funCode <- '
			Con micon;
			Neuron nn;
			nn.setId(16);
			micon.setFromNeuron(&nn);
			micon.setWeight(12.4);
			double result1= micon.getWeight();
			micon.setWeight(2.2);
			double result2= micon.getWeight();
			return Rcpp::List::create(	Rcpp::Named("R1")	= result1,
										Rcpp::Named("R2") 	= result2);
			'
	incCode <- paste( readLines( "pkg/AMORE/src/Con.cpp"), collapse = "\n" )
	fx <- cxxfunction( signature(), body=funCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- fx()
	checkEquals(result$R1, 12.4)
	checkEquals(result$R2, 2.2)
}


test.Con.Cpp.show <- function() {	
	funCode <- '
			Con micon;
			Neuron nn;
			nn.setId(16);
			micon.setFromNeuron(&nn);
			micon.setWeight(12.4);
			bool result= micon.show();
			return wrap(result);
			'
	incCode <- paste( readLines( "pkg/AMORE/src/Con.cpp"), collapse = "\n" )
	fx <- cxxfunction( signature(), body=funCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	result <- fx()
	checkTrue(result)

}



test.Con.Cpp.validate.weight <- function() {	
	funCode <- '
			Con micon;
			Neuron nn;
			nn.setId(16);
			micon.setFromNeuron(&nn);
			micon.setWeight(1.4/0);
			micon.validate();
			return wrap(true);
			'
	incCode <- paste( readLines( "pkg/AMORE/src/Con.cpp"), collapse = "\n" )
	fx <- cxxfunction( signature(), body=funCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	checkException(result <- fx(), silent=TRUE)
}


test.Con.Cpp.validate.from <- function() {
	
	funCode <- '
			Con micon;
			Neuron nn;
			nn.setId(NA_INTEGER);
			micon.setFromNeuron(&nn);
			micon.setWeight(1.4);
			micon.validate();
			return wrap(micon.getFromId());
			'
	incCode <- paste( readLines( "pkg/AMORE/src/Con.cpp"), collapse = "\n" )
	fx <- cxxfunction( signature(), body=funCode , include = incCode, plugin = "Rcpp", verbose=FALSE )
	checkException(result <- fx(), silent=TRUE)


	
}





