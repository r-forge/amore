
#   TODO: I'm working at listLayer


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
# Mensajes de aviso perdidos
# In .removePreviousCoerce(class1, class2, where, prevIs) :
#   methods currently exist for coercing from "Neuron" to "numericOrNeuron"; they will be replaced.
# 
# 
# Executing test function test.Con.Cpp.class  ... From:	 1 	 Weight= 	 1.400000 
#  done successfully.
# 
# 
# 
# Executing test function test.gCon.getFrom.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gCon.getFrom.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gCon.getWeight  ...  done successfully.
# 
# 
# 
# Executing test function test.gCon.new.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gCon.new.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gCon.setFrom  ...  done successfully.
# 
# 
# 
# Executing test function test.gCon.setWeight  ...  done successfully.
# 
# 
# 
# Executing test function test.gCon.show  ... 
#  From:  1 	 Weight:  14.5 done successfully.
# 
# 
# 
# Executing test function test.gCon.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gMLPneuron.new  ...  done successfully.
# 
# 
# 
# Executing test function test.gMLPneuron.show  ... 
# ------------------------------
#  Id:  1
# -----------------
#  Bias:  9.9
# ------------------------------
#  From:  1 	 Weight:  11
#  From:  2 	 Weight:  12
#  From:  3 	 Weight:  13
#  From:  4 	 Weight:  14
#  From:  5 	 Weight:  15
# ------------------------------ done successfully.
# 
# 
# 
# Executing test function test.gMLPneuron.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.addCon  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.deleteCon  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.getCon  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.getFrom.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.getFrom.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.getFromId.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.getFromId.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.getWeight  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.new  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.numOfCons  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.setAndGetId  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.setCon  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.setFrom  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.setWeight  ...  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.show  ... 
# ------------------------
# 
#  Id:  1
# ------------------------
# 
#  From:  1 	 Weight:  11
#  From:  2 	 Weight:  12
#  From:  3 	 Weight:  13
#  From:  4 	 Weight:  14
#  From:  5 	 Weight:  15
# ------------------------
#  done successfully.
# 
# 
# 
# Executing test function test.gNeuron.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gRBFneuron.new  ... 
# ------------------------------
#  Id:  1
# -----------------
#  Width:  9.9
# -----------------
#  Altitude:  29.3
# ------------------------------
#  From:  1 	 Weight:  11
#  From:  2 	 Weight:  12
#  From:  3 	 Weight:  13
#  From:  4 	 Weight:  14
#  From:  5 	 Weight:  15
# ------------------------------ done successfully.
# 
# 
# 
# Executing test function test.gRBFneuron.show  ... 
# ------------------------------
#  Id:  1
# -----------------
#  Width:  9.9
# -----------------
#  Altitude:  29.3
# ------------------------------
#  From:  1 	 Weight:  11
#  From:  2 	 Weight:  12
#  From:  3 	 Weight:  13
#  From:  4 	 Weight:  14
#  From:  5 	 Weight:  15
# ------------------------------ done successfully.
# 
# 
# 
# Executing test function test.gRBFneuron.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gListAMORE.addToLdata  ...  done successfully.
# 
# 
# 
# Executing test function test.gListAMORE.getLdata  ...  done successfully.
# 
# 
# 
# Executing test function test.gListAMORE.join  ...  done successfully.
# 
# 
# 
# Executing test function test.gListAMORE.new  ...  done successfully.
# 
# 
# 
# Executing test function test.gListAMORE.setLdata  ...  done successfully.
# 
# 
# 
# Executing test function test.gListAMORE.show  ... 
#  From:  1 	 Weight:  14.5
#  From:  2 	 Weight:  24.5
#  From:  3 	 Weight:  34.5 done successfully.
# 
# 
# 
# Executing test function test.gListAMORE.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.addToLdata  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.delete  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.getFrom.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.getFrom.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.getFromId.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.getFromId.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.getWeight.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.getWeight.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.new  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.numOfCons  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.populate.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.select  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.setFrom  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.setWeight  ...  done successfully.
# 
# 
# 
# Executing test function test.gListCon.show  ... 
#  From:  1 	 Weight:  10
#  From:  2 	 Weight:  9
#  From:  3 	 Weight:  8
#  From:  4 	 Weight:  7
#  From:  5 	 Weight:  6
#  From:  6 	 Weight:  5
#  From:  7 	 Weight:  4
#  From:  8 	 Weight:  3
#  From:  9 	 Weight:  2
#  From:  10 	 Weight:  1 done successfully.
# 
# 
# 
# Executing test function test.gListCon.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gListLayer.delete  ...  done successfully.
# 
# 
# 
# Executing test function test.gListLayer.getId  ...  done successfully.
# 
# 
# 
# Executing test function test.gListLayer.new.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gListLayer.new.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gListLayer.numOfLayers  ...  done successfully.
# 
# 
# 
# Executing test function test.gListLayer.select  ...  done successfully.
# 
# 
# 
# Executing test function test.glistMLPlayer.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gListMLPneuron.new  ...  done successfully.
# 
# 
# 
# Executing test function test.gListMLPneuron.populate.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gListMLPneuron.populate.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gListMLPneuron.setAndGetBias  ...  done successfully.
# 
# 
# 
# Executing test function test.gListMLPneuron.show  ... 
# ------------------------------
#  Id:  1
# -----------------
#  Bias:  1.1
# ------------------------------
#  From:  1 	 Weight:  11
#  From:  2 	 Weight:  12
#  From:  3 	 Weight:  13
# ------------------------------
# ------------------------------
#  Id:  2
# -----------------
#  Bias:  3.4
# ------------------------------
#  From:  1 	 Weight:  21
#  From:  2 	 Weight:  22
#  From:  3 	 Weight:  23
# ------------------------------
# ------------------------------
#  Id:  3
# -----------------
#  Bias:  5.4
# ------------------------------
#  From:  1 	 Weight:  31
#  From:  2 	 Weight:  32
#  From:  3 	 Weight:  33
# ------------------------------
# ------------------------------
#  Id:  4
# -----------------
#  Bias:  9.8
# ------------------------------
#  From:  1 	 Weight:  41
#  From:  2 	 Weight:  42
#  From:  3 	 Weight:  43
# ------------------------------
# ------------------------------
#  Id:  5
# -----------------
#  Bias:  5.6
# ------------------------------
#  From:  1 	 Weight:  51
#  From:  2 	 Weight:  52
#  From:  3 	 Weight:  53
# ------------------------------ done successfully.
# 
# 
# 
# Executing test function test.gListMLPneuron.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.delete  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.getFrom.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.getFromId.fromIsNeuron  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.getFromId.fromIsNumeric  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.is.regular  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.new.addToLdata.numberOfNeurons.numOfCons  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.select  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.setAndGetFrom  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.setAndGetId  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.setAndGetWeight  ...  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.show  ... 
# ------------------------
# 
#  Id:  1
# ------------------------
# 
#  From:  1 	 Weight:  11
#  From:  2 	 Weight:  12
#  From:  3 	 Weight:  13
#  From:  4 	 Weight:  14
#  From:  5 	 Weight:  15
# ------------------------
# 
# ------------------------
# 
#  Id:  2
# ------------------------
# 
#  From:  1 	 Weight:  1
#  From:  2 	 Weight:  2
#  From:  3 	 Weight:  3
#  From:  4 	 Weight:  4
#  From:  5 	 Weight:  5
# ------------------------
#  done successfully.
# 
# 
# 
# Executing test function test.gListNeuron.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gListRBFlayer.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gListRBFneuron.new  ...  done successfully.
# 
# 
# 
# Executing test function test.gListRBFneuron.populate  ...  done successfully.
# 
# 
# 
# Executing test function test.gListRBFneuron.setAndGetAltitude  ...  done successfully.
# 
# 
# 
# Executing test function test.gListRBFneuron.setAndGetWidth  ...  done successfully.
# 
# 
# 
# Executing test function test.gListRBFneuron.show  ... 
# ------------------------------
#  Id:  1
# -----------------
#  Width:  1.1
# -----------------
#  Altitude:  1.9
# ------------------------------
#  From:  1 	 Weight:  11
#  From:  2 	 Weight:  12
#  From:  3 	 Weight:  13
# ------------------------------
# ------------------------------
#  Id:  2
# -----------------
#  Width:  3.4
# -----------------
#  Altitude:  8.4
# ------------------------------
#  From:  4 	 Weight:  21
#  From:  5 	 Weight:  22
#  From:  6 	 Weight:  23
# ------------------------------
# ------------------------------
#  Id:  3
# -----------------
#  Width:  5.4
# -----------------
#  Altitude:  8.7
# ------------------------------
#  From:  7 	 Weight:  31
#  From:  8 	 Weight:  32
#  From:  9 	 Weight:  33
# ------------------------------
# ------------------------------
#  Id:  4
# -----------------
#  Width:  9.8
# -----------------
#  Altitude:  3.5
# ------------------------------
#  From:  10 	 Weight:  41
#  From:  11 	 Weight:  42
#  From:  12 	 Weight:  43
# ------------------------------
# ------------------------------
#  Id:  5
# -----------------
#  Width:  5.6
# -----------------
#  Altitude:  7.6
# ------------------------------
#  From:  13 	 Weight:  51
#  From:  14 	 Weight:  52
#  From:  15 	 Weight:  53
# ------------------------------ done successfully.
# 
# 
# 
# Executing test function test.gListRBFneuron.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.gmlpLayer.delete  ...  done successfully.
# 
# 
# 
# Executing test function test.gmlpLayer.is.regular  ...  done successfully.
# 
# 
# 
# Executing test function test.gmlpLayer.join  ...  done successfully.
# 
# 
# 
# Executing test function test.gmlpLayer.new  ...  done successfully.
# 
# 
# 
# Executing test function test.gmlpLayer.numOfCons  ...  done successfully.
# 
# 
# 
# Executing test function test.gmlpLayer.setAndGetFrom  ...  done successfully.
# 
# 
# 
# Executing test function test.gmlpLayer.setAndGetWeight  ...  done successfully.
# 
# 
# 
# Executing test function test.gmlpLayer.setAngGetId  ...  done successfully.
# 
# 
# 
# Executing test function test.gmlpLayer.validate  ...  done successfully.
# 
# 
# 
# Executing test function test.grbfLayer.delete  ...  done successfully.
# 
# 
# 
# Executing test function test.grbfLayer.is.regular  ...  done successfully.
# 
# 
# 
# Executing test function test.grbfLayer.join  ...  done successfully.
# 
# 
# 
# Executing test function test.grbfLayer.new  ...  done successfully.
# 
# 
# 
# Executing test function test.grbfLayer.numOfCons  ...  done successfully.
# 
# 
# 
# Executing test function test.grbfLayer.setAndGetFrom  ...  done successfully.
# 
# 
# 
# Executing test function test.grbfLayer.setAndGetWeight  ...  done successfully.
# 
# 
# 
# Executing test function test.grbfLayer.setIdAndGetId  ...  done successfully.
# 
# 
# 
# Executing test function test.grbfLayer.validate  ...  done successfully.
# 
# Mensajes de aviso perdidos
# 1: In isValidTestSuite(testSuites) :
#   'testSuite' object is not of class 'RUnitTestSuite'.
# 2: In asMethod(object) : NAs introducidos por coerci'on
# 3: In asMethod(object) : NAs introducidos por coerci'on
# 4: In asMethod(object) : NAs introducidos por coerci'on
# 5: In asMethod(object) : NAs introducidos por coerci'on
# 6: In asMethod(object) : NAs introducidos por coerci'on
# 7: In class(value) <- "integer" : NAs introducidos por coerci'on

