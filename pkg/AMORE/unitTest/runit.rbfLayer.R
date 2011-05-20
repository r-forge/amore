# Unit Tests for the neuralLayer class methods
# 
# Author: mcasl
###############################################################################



test.grbfLayer.new <- function() {
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(nl$is.regular())
	checkTrue(nl$validate())
	rm(nl)	
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(!nl$is.regular())
	checkEquals(nl$getId(), 1:5)
	checkEquals(nl$getFrom(), list(1:3,4:6,7:9,10:12,13:15))
	checkEquals(nl$getFrom(ID=3:4), list(7:9,10:12))
	checkEquals(nl$getWeight(), list(11:13,21:23,31:33,41:43,51:53))
	checkEquals(nl$getWeight(ID=1:2), list(11:13,21:23))
	nl$setId(15:11)
	checkEquals(nl$getId(), 15:11)
	checkTrue(nl$validate())
	checkEquals(nl$numOfCons(), c(3,3,3,3,3))
}	


test.grbfLayer.setIdAndGetId <- function() {
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl$setId(15:11)
	checkEquals(nl$getId(), 15:11)
	checkTrue(nl$validate())
	nl$setId(1:2,ID=15:14)
	checkEquals(nl$getId(), c(1,2,13:11))
	checkTrue(nl$validate())
}


test.grbfLayer.join <- function() {
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ln <- gListMLPneuron$new()
	ln$populate(ID=6:10, BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl$join(ln)
	checkEquals(nl$getId(),1:10)
	checkEquals(nl$getNumberOfNeurons(),10)
	checkException(nl$validate(), silent=TRUE) #   [listRBFneuron Validate]: Element is not an RBFneuron
	rm(ln, nl)
	
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ln <- gListRBFneuron$new()
	ln$populate(ID=6:10, WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl$join(ln)
	checkEquals(nl$getId(),1:10)
	checkEquals(nl$getNumberOfNeurons(),10)
	checkTrue(nl$validate())		
	nl2 <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl2$populate(ID=11:15, WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl$join(nl2)
	checkEquals(nl$getId(),1:15)
	checkEquals(nl$getNumberOfNeurons(),15)
	checkTrue(nl$validate())
}


test.grbfLayer.delete <- function() {
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl$delete(ID=4:5)
	checkEquals(nl$getId(),1:3)
	checkEquals(nl$getNumberOfNeurons(),3)
	checkTrue(nl$validate())
}


test.grbfLayer.is.regular <- function() {
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(!nl$is.regular())
	checkTrue(nl$validate())
	rm(nl)
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(nl$is.regular())
	checkTrue(nl$validate())
}


test.grbfLayer.numOfCons <- function() {
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(nl$validate())
	checkEquals(nl$numOfCons(), c(3,3,3,3,3))
}


test.grbfLayer.setAndGetFrom <- function() {
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(nl$validate())
	nl$setFrom(list(c(4,6,7),c(2,4,8),c(8,7,4),c(3,5,8),c(7,6,4)))
	checkEquals(nl$getFrom(), list(c(4,6,7),c(2,4,8),c(8,7,4),c(3,5,8),c(7,6,4)))
	checkEquals(nl$getFrom(ID=3:4),list(c(8,7,4),c(3,5,8)))
	nl$setFrom(list(c(4,6,7),c(2,4,8)), ID=4:5)
	checkEquals(nl$getFrom(), list(c(4,6,7),c(2,4,8),c(8,7,4),c(4,6,7),c(2,4,8)))
	checkEquals(nl$getFrom(ID=4:5),list(c(4,6,7),c(2,4,8)))
	checkTrue(nl$validate())
}


test.grbfLayer.setAndGetWeight <- function() {
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(nl$validate())
	nl$setWeight(list(c(4,6,7),c(2,4,8),c(8,7,4),c(3,5,8),c(7,6,4)))
	checkEquals(nl$getWeight(), list(c(4,6,7),c(2,4,8),c(8,7,4),c(3,5,8),c(7,6,4)))
	checkEquals(nl$getWeight(ID=3:4),list(c(8,7,4),c(3,5,8)))
	nl$setWeight(list(c(4,6,7),c(2,4,8)), ID=4:5)
	checkEquals(nl$getWeight(), list(c(4,6,7),c(2,4,8),c(8,7,4),c(4,6,7),c(2,4,8)))
	checkEquals(nl$getWeight(ID=4:5),list(c(4,6,7),c(2,4,8)))
	checkTrue(nl$validate())
}


test.grbfLayer.validate <- function() {
	nl <- grbfLayer$new(activationFunction="tanh", normalizationMethod="softmax", threshold=2.3, width=0.1, altitude=9.8)
	nl$populate(ID=list(1,2,3,4,5), WIDTH=list(1.1,3.4,5.4,9.8,5.6), ALTITUDE=list(1.9,8.4,8.7,3.5,7.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(nl$validate())
	nl$setNumberOfNeurons(4)
	checkException(nl$validate(), silent=TRUE)
	nl$setNumberOfNeurons(5/0)
	checkException(nl$validate(), silent=TRUE)
	nl$setActivationFunction("foo")
	checkException(nl$validate(), silent=TRUE)
}
