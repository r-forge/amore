# TODO: Add comment
# 
# Author: mcasl
###############################################################################

setClassUnion("listRBFlayerOrlistMLPlayer", c("rbfLayer","mlpLayer"))

gNeuralNetwork <- setRefClass("neuralNetwork",
		fields=list(
				Layers="listRBFlayerOrlistMLPlayer"


				),
		methods= list()
)
