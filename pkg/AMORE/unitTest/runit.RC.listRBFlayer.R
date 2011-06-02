# Unit Tests for the listRBFlayer class methods
# 
# Author: mcasl
###############################################################################

test.gListRBFlayer.validate <- function() {
# mixture of mlp and rbf layers
	nl <- gmlpLayer$new(activationFunction="tanh")  # buildAndAppend will set the value of numberOfNeurons
	nl$buildAndAppend(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll <- gListRBFLayer$new()
	ll$push_back(nl)
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="simplemax", threshold=9.3, width=2, altitude=3.5)  # buildAndAppend will set the value of numberOfNeurons
	nl$buildAndAppend(ID=6:10, WIDTH=c(1.1,3.4,5.4,9.8,5.6),  ALTITUDE=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(nl$validate())
	checkEquals(nl$getId(), 6:10)
	ll$push_back(nl)
	checkEquals(ll$getId(), list(1:5, 6:10))
	checkException(ll$validate(), silent=TRUE)  #  mixture of rbfLayers and mlpLayer 
	checkEquals(ll$numOfLayers(), 2)
	rm(nl, ll)
	
	# rbfLayers 
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="simplemax", threshold=9.3, width=2, altitude=3.5)  # buildAndAppend will set the value of numberOfNeurons
	nl$buildAndAppend(ID=1:5, WIDTH=c(1.1,3.4,5.4,9.8,5.6),  ALTITUDE=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll <- gListRBFLayer$new()
	ll$push_back(nl)
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="simplemax", threshold=9.3, width=2, altitude=3.5)  # buildAndAppend will set the value of numberOfNeurons
	nl$buildAndAppend(ID=6:10, WIDTH=c(1.1,3.4,5.4,9.8,5.6),  ALTITUDE=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(nl$validate())
	checkEquals(nl$getId(), 6:10)
	ll$push_back(nl)
	checkEquals(ll$getId(), list(1:5, 6:10))
	checkTrue(ll$validate())  
	checkEquals(ll$numOfLayers(), 2)
}