
#   TODO: I'm working at listLayer


require("RUnit")
rm(list=ls(all.names=TRUE))

KnownActivationFunctions <- c("threshold", "logistic", "tanh", "identity", "exponential", "reciprocal", "square", "Gauss", "sine", "cosine", "Elliott", "arctan", "radialBasis")
KnownNormalizationMethods <- c("none", "softmax", "simplemax")

source("pkg/AMORE/R/Con.R")
source("pkg/AMORE/R/listAMORE.R")
source("pkg/AMORE/R/listCon.R")
source("pkg/AMORE/R/Neuron.R")
source("pkg/AMORE/R/MLPneuron.R")
source("pkg/AMORE/R/RBFneuron.R")
source("pkg/AMORE/R/listNeuron.R")
source("pkg/AMORE/R/listMLPneuron.R")
source("pkg/AMORE/R/listRBFneuron.R")
source("pkg/AMORE/R/mlpLayer.R")
source("pkg/AMORE/R/rbfLayer.R")
source("pkg/AMORE/R/listLayer.R")


source("pkg/AMORE/unitTest/unitTestSuite.R")



#lapply(gListCon$methods(),FUN=function(x){cat("# TODO ",x, " unit test\n")}) -> DontMakeNoise
#lapply(gListAMORE$methods(),FUN=function(x){cat("# TODO ",x, " unit test\n")}) -> DontMakeNoise
#lapply(gNeuron$methods(),FUN=function(x){cat("# TODO ",x, " unit test\n")}) -> DontMakeNoise
#lapply(gMLPneuron$methods(),FUN=function(x){cat("# TODO ",x, " unit test\n")}) -> DontMakeNoise
#lapply(gRBFneuron$methods(),FUN=function(x){cat("# TODO ",x, " unit test\n")}) -> DontMakeNoise
#lapply(gListNeuron$methods(),FUN=function(x){cat("# TODO ",x, " unit test\n")}) -> DontMakeNoise
#lapply(gListMLPneuron$methods(),FUN=function(x){cat("# TODO ",x, " unit test\n")}) -> DontMakeNoise
#lapply(gListRBFneuron$methods(),FUN=function(x){cat("# TODO ",x, " unit test\n")}) -> DontMakeNoise
#lapply(gNeuralLayer$methods(),FUN=function(x){cat("# TODO ",x, " unit test\n")}) -> DontMakeNoise

# TODO silent =TRUE in every call	
