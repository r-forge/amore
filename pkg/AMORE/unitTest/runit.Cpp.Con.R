# Unit Tests for the Con class methods
# 
# Author: mcasl
###############################################################################


test.Con.Cpp.class <- function() {	
	

funCode <- '
int getFromIdResult;
double getWeightResult;
bool showResult;
Con micon;
Neuron nn;
nn.setId(1);
micon.setFromNeuron(&nn);
micon.setWeight(1.4);

showResult=micon.show();
getWeightResult= micon.getWeight();
getFromIdResult= micon.getFromId();

return Rcpp::List::create(	Rcpp::Named("show")			= showResult,
							Rcpp::Named("getFromId") 	= getFromIdResult,
							Rcpp::Named("getWeight")	= getWeightResult);
'

incCode <- paste( readLines( "pkg/AMORE/src/Con.cpp"), collapse = "\n" )
fx <- cxxfunction( signature(), body=funCode , include = incCode, plugin = "Rcpp", verbose=FALSE )

result <- fx()

checkEquals(result$show, TRUE)
checkEquals(result$getFromId, 1)
checkEquals(result$getWeight, 1.4)

}




