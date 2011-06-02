

require("inline")
require("Rcpp")

require("RUnit")
# Loading required package: RUnit

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
source("pkg/AMORE/R/listMLPlayer.R")
source("pkg/AMORE/R/listRBFlayer.R")
source("pkg/AMORE/R/neuralNetwork.R")
source("pkg/AMORE/R/MLPneuralNetwork.R")
source("pkg/AMORE/R/RBFneuralNetwork.R")


source("pkg/AMORE/unitTest/unitTestSuite.R")



#lapply(gListCon$methods(),FUN=function(x){cat("# TODO ",x, " unit test\n")}) -> DontMakeNois


# Lista de Fixme's

###############################################
# FIXME Javi: Unit tests for Con class constructor methods
# STATUS: Pending
###############################################

###############################################
# FIXME Javi: Implement vecCon::Validate  
# STATUS: Pending
###############################################

###############################################
# FIXME Manolo: vecCon::getWeight
# STATUS: writing
###############################################




