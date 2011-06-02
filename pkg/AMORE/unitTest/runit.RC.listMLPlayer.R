# Unit Tests for the listMLPlayer class methods
# 
# Author: mcasl
###############################################################################

test.glistMLPlayer.validate <- function() {
# Set of mlpLayers 
	nl <- gmlpLayer$new(activationFunction="tanh")  # buildAndAppend will set the value of numberOfNeurons
	nl$buildAndAppend(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll <- gListMLPLayer$new()
	ll$push_back(nl)
	nl <- gmlpLayer$new(activationFunction="tanh")  # buildAndAppend will set the value of numberOfNeurons
	nl$buildAndAppend(ID=6:10, BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll$push_back(nl)
	checkEquals(ll$getId(), list(1:5, 6:10))
	checkTrue(ll$validate())  
	
# Mixture of mlp and rbf layers
	nl <- gmlpLayer$new(activationFunction="tanh")  # buildAndAppend will set the value of numberOfNeurons
	nl$buildAndAppend(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll <- gListMLPLayer$new()
	ll$push_back(nl)
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="simplemax", threshold=9.3, width=2, altitude=3.5)  # buildAndAppend will set the value of numberOfNeurons
	nl$buildAndAppend(ID=6:10, WIDTH=c(1.1,3.4,5.4,9.8,5.6),  ALTITUDE=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll$push_back(nl)
	checkException(ll$validate(), silent=TRUE)  #  mixture of rbfLayers and mlpLayer 
}