
createXPtrFunctionListFromSources <- function(srcf0, srcf1) {
	suppressMessages(require("Rcpp"))
	suppressMessages(require("inline"))
	otherCode <- paste(srcf0, srcf1, sep="\n")
	testCode <- '
		typedef double (*CppFunctionPointer)(double);
		return List::create( _["f0"]=XPtr<CppFunctionPointer>(new CppFunctionPointer(&f0)), _["f1"]=XPtr<CppFunctionPointer>(new CppFunctionPointer(&f1)) ) ;
	'
	testCodefun <- cxxfunction(sig = character(), body = testCode, includes = otherCode, plugin="Rcpp")
	return ( testCodefun() )
}



