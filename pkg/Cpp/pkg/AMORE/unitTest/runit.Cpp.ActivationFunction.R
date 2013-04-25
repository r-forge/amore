# Unit Tests for the ActivationFunction class methods
#
# Author: mcasl
###############################################################################

suppressMessages(require("inline"))
suppressMessages(require("Rcpp"))
suppressMessages(require("RUnit"))


###############################################################################
test.ActivationFunction.Cpp.Constructor <- function() {
###############################################################################

	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	otherCode <- '
		using namespace Rcpp;
	'
	testCode <- '
		NeuralFactoryPtr neuralFactoryPtr( new MLPNoNetworkTrainBehaviorFactory() );
		NeuronPtr neuronPtr( neuralFactoryPtr->makeNeuron(1) );
		neuronPtr->show();
		ConPtr conPtr( neuralFactoryPtr->makeCon(*neuronPtr , 4.5) );
		conPtr->validate();

		Rcpp::NumericVector result;
		result["defaultBefore"]= neuronPtr->getOutput();
		neuronPtr->singlePatternForwardAction();
		result["defaultAfter"]= neuronPtr->getOutput();


		Rcpp::XPtr<CppFunctionPointer>  f0XPtr(new CppFunctionPointer(&Tanh_f0)) ;
		Rcpp::XPtr<CppFunctionPointer>  f1XPtr(new CppFunctionPointer(&Tanh_f1)) ;

		ActivationFunctionPtr activationFunctionPtr ( neuralFactoryPtr->makeActivationFunction(neuronPtr, f0XPtr, f1XPtr)	);
		neuronPtr->setActivationFunction(activationFunctionPtr);
		result["TanhBefore"]= neuronPtr->getOutput();
		neuronPtr->singlePatternForwardAction();
		result["TanhAfter"]= neuronPtr->getOutput();
		return	result;
		'
	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs=otherCode, language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())
	result <- testCodefun()
	result







}




###############################################################################
test.ActivationFunction.Cpp.Constructor <- function() {
###############################################################################

	otherCode <- '
 			double
			f0(double inducedLocalField)
			  {
			    return( tanh(inducedLocalField) );
			  }

			double
			f1(double inducedLocalField)
			  {
				double tanhx = tanh(inducedLocalField);
			    return( 1-tanhx*tanhx );
			  }
			'
	testCode <- '
			    typedef double (*CppFunctionPointer)(double);
				return List::create( _["f0"]=XPtr<CppFunctionPointer>(new CppFunctionPointer(&f0)), _["f1"]=XPtr<CppFunctionPointer>(new CppFunctionPointer(&f1)) ) ;
			'

	testCodefun <- cxxfunction(sig = character(), body = testCode, includes = otherCode, plugin="Rcpp")
	functionPointers <- testCodefun()
	#



	functionPointers
	testCode <- '
		    typedef double (*CppFunctionPointer)(double);
			List functionPointers(listOfFunctionPointers);
			double xx=as<double>(x);
			XPtr<CppFunctionPointer> f0XPtr = functionPointers["f0"];
			XPtr<CppFunctionPointer> f1XPtr = functionPointers["f1"];
			return NumericVector::create( _["f0(x)"]=(*f0XPtr)(xx) , _["f1(x)"]=(*f1XPtr)(xx) ) ;
			'
	testCodefun <- cxxfunction(sig = signature(listOfFunctionPointers="externalpointer", x="numeric"), body = testCode, includes = otherCode, plugin="Rcpp")
	result <-testCodefun(listOfFunctionPointers=functionPointers, x=0.1)
	result
	#      f0(x)      f1(x)
	# 0.09966799 0.99006629

	checkEquals(result, c("f0(x)"=tanh(0.1), "f1(x)"=1-tanh(0.1)^2))

###############################################################################
#Benchmarking
###############################################################################

otherCode <- '
		using namespace Rcpp;
		double
		f0(double inducedLocalField)
		{
		return( tanh(inducedLocalField) );
		}

		double
		f1(double inducedLocalField)
		{
		double tanhx = tanh(inducedLocalField);
		return( 1-tanhx*tanhx );
		}

			RCPP_MODULE(mod_Test)
			{
				function( "Tanh_f0", &f0 )  	;
			}

		'
testCode <- '
		typedef double (*funcPtr)(double);
		return List::create( _["f0"]=XPtr<funcPtr>(new funcPtr(&f0)), _["f1"]=XPtr<funcPtr>(new funcPtr(&f1)) ) ;
		'

testCodefun <- cxxfunction(sig = character(), body = testCode, includes = otherCode, plugin="Rcpp")
functionPointers <- testCodefun()

	modTest <- Module("mod_Test", getDynLib(testCodefun))
	modTest$Tanh_f0(0.1)

##  Benchmarking

testCode <- '
		typedef double (*funcPtr)(double);
		List functionPointers(listOfFunctionPointers);
		XPtr<funcPtr> f0XPtr = functionPointers["f0"];
		XPtr<funcPtr> f1XPtr = functionPointers["f1"];
		double xx=as<double>(x);
		int N =as<int>(n);
		double result;
		for (int i = 0; i<N ; i++) {
			 result = (*f0XPtr)(xx);
		}
		return wrap( result );
		'
usingXPtrs <- cxxfunction(sig = signature(listOfFunctionPointers="externalpointer", x="numeric", n="integer"), body = testCode, includes = otherCode, plugin="Rcpp")
usingXPtrs(functionPointers, 0.4, 100)
# [1] 0.379949

testCode <- '
			Rcpp::Function fx (myfun);
			int N =as<int>(n);
			double result;
		for (int i = 0; i<N ; i++) {
			 result = as<double>(fx(x));
		}
			return wrap( result );
			'
usingTanhf0 <- cxxfunction(sig=signature(myfun="function", x="numeric", n="integer"), body = testCode, includes = otherCode, plugin="Rcpp")
usingTanhf0(myfun=modTest$Tanh_f0, x=0.4, n=100)
# [1] 0.379949

testCode <- '
			int N =as<int>(n);
			double result;
				double value = as<double>(x);
			for (int i = 0; i<N ; i++) {
				result = tanh(value);
			}
			return wrap( result );
			'
usingTanh <- cxxfunction(sig=signature(x="numeric", n="integer"), body = testCode, includes = otherCode, plugin="Rcpp")
usingTanh( x=0.4, n=100)
# [1] 0.379949

suppressMessages(require("rbenchmark"))

benchmark(usingXPtrs(functionPointers, 0.4, 100), usingTanhf0(myfun=modTest$Tanh_f0, x=0.4, n=100) , usingTanh( x=0.4, n=100), columns=c("test", "elapsed", "relative"), order="relative", replications=100)
#                                                     test elapsed relative
# 1                 usingXPtrs(functionPointers, 0.4, 100)   0.001        1
# 3                            usingTanh(x = 0.4, n = 100)   0.001        1
# 2 usingTanhf0(myfun = modTest$Tanh_f0, x = 0.4, n = 100)   0.174      174





}

