	setwd("/Users/mcasl/Documents/workspace/amore/pkg/Cpp")
	suppressMessages(require("inline"))
	suppressMessages(require("Rcpp"))
	suppressMessages(require("RUnit"))
	suppressMessages(require("rbenchmark"))

	incCode <-	paste(readLines( "pkg/AMORE/src/AMORE.h"),	collapse = "\n" )
	testCode <- ""
#	testCodefun <- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs="-lprofiler")

testCodefun<- cfunction(sig=signature(), body=testCode,includes=incCode, otherdefs="using namespace Rcpp;", language="C++", verbose=FALSE, convention=".Call",Rcpp=TRUE,cppargs=character(), cxxargs= paste("-O3 -I",getwd(),"/pkg/AMORE/src -I/opt/local/include",sep=""), libargs=character())


modAMORE <- Module("modAMORE",  getDynLib(testCodefun))
	AMOREnet <- modAMORE$NetworkRinterface
	net <- new (AMOREnet)
	checkException(net$validate(), silent=TRUE)
	net$createFeedForwardNetwork(c(2,40,3), "Tanh", "Identity")

	xSim <- runif(100000, min=-1, max=1)
	ySim <- runif(100000, min=-1, max=1)
	PSim <- as.matrix( rbind(xSim,ySim) )
	TSim <-  as.matrix( rbind(xSim^2,ySim^2, xSim+ySim) )
# system.time(net$train(list( inputMatrix = PSim, targetMatrix   = TSim, algorithm = "ADAPTgd", learningRate = 1e-4, costFunction  = "LMS", numberOfEpochs = 100,showStep=10)))

	library(AMORE)
	netAMOREclassic <- newff(n.neurons=c(2,40,3), learning.rate.global=1e-4,	error.criterium="LMS", Stao=NA, hidden.layer="tansig", output.layer="purelin", method="ADAPTgd")
# [1] TRUE


	benchmark( sim(netAMOREclassic, t(PSim))  ,
			net$sim(PSim)
			, columns=c("test", "elapsed", "relative"), order="relative", replications=10)

# [1] TRUE
#                            test elapsed relative
# 1 sim(netAMOREclassic, t(PSim))   1.914    1.000
# 2                               net$sim(PSim)   8.730    4.561


	xtrain <- runif(1000, min=-1, max=1)
	ytrain <- runif(1000, min=-1, max=1)
	Ptrain <- as.matrix( rbind(xtrain,ytrain) )
	targettrain <- as.matrix( rbind(xtrain^2, -ytrain^3, xtrain+ytrain))

	benchmark( train(netAMOREclassic, t(Ptrain), t(targettrain), error.criterium="LMS", report=TRUE, show.step=100, n.shows=2 )  ,
			net$train(list( algorithm="ADAPTgd", learningRate=1e-4, costFunction="LMS", numberOfEpochs=200, showStep=100, inputMatrix= Ptrain , targetMatrix=targettrain	)
			), columns=c("test", "elapsed", "relative"), order="relative", replications=10)

#	elapsed relative
#1   6.125    1.000
#2  31.683    5.173

################## As a package ###############################################

require(AMOREcpp)
AMOREnet <- NetworkRinterface
net <- new (AMOREnet)
#checkException(net$validate(), silent=TRUE)
net$createFeedForwardNetwork(c(2,40,3), "Tanh", "Identity")

xSim <- runif(100000, min=-1, max=1)
ySim <- runif(100000, min=-1, max=1)
PSim <- as.matrix( rbind(xSim,ySim) )
TSim <-  as.matrix( rbind(xSim^2,ySim^2, xSim+ySim) )
# system.time(net$train(list( inputMatrix = PSim, targetMatrix   = TSim, algorithm = "ADAPTgd", learningRate = 1e-4, costFunction  = "LMS", numberOfEpochs = 100,showStep=10)))

library(AMORE)
netAMOREclassic <- newff(n.neurons=c(2,40,3), learning.rate.global=1e-4,	error.criterium="LMS", Stao=NA, hidden.layer="tansig", output.layer="purelin", method="ADAPTgd")
# [1] TRUE


benchmark( sim(netAMOREclassic, t(PSim))  ,
		net$sim(PSim)
		, columns=c("test", "elapsed", "relative"), order="relative", replications=10)

# [1] TRUE
#                            test elapsed relative
# 1 sim(netAMOREclassic, t(PSim))   1.914    1.000
# 2                               net$sim(PSim)   8.730    4.561


xtrain <- runif(1000, min=-1, max=1)
ytrain <- runif(1000, min=-1, max=1)
Ptrain <- as.matrix( rbind(xtrain,ytrain) )
targettrain <- as.matrix( rbind(xtrain^2, -ytrain^3, xtrain+ytrain))

benchmark( train(netAMOREclassic, t(Ptrain), t(targettrain), error.criterium="LMS", report=TRUE, show.step=100, n.shows=2 )  ,
		net$train(list( algorithm="ADAPTgd", learningRate=1e-4, costFunction="LMS", numberOfEpochs=200, showStep=100, inputMatrix= Ptrain , targetMatrix=targettrain	)
		), columns=c("test", "elapsed", "relative"), order="relative", replications=10)

# 1   5.935    1.000
# 2  35.546    5.989


