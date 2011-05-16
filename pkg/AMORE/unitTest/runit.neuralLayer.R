# Unit Tests for the neuralLayer class methods
# 
# Author: mcasl
###############################################################################

test.gNeuralLayer <- function() {
	
# new  unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="tanh", neuron=ln )
	checkTrue(nl$validate())
	checkEquals(nl$getId(), 1:5)
	checkEquals(nl$getFrom(), list(1:3,4:6,7:9,10:12,13:15))
	checkEquals(nl$getFrom(ID=3:4), list(7:9,10:12))
	checkEquals(nl$getWeight(), list(11:13,21:23,31:33,41:43,51:53))
	checkEquals(nl$getWeight(ID=1:2), list(11:13,21:23))
	nl$setId(15:11)
	checkEquals(nl$getId(), 15:11)
	checkTrue(nl$validate())
	checkEquals(nl$numOfCons(), c(3,3,3,3,3))
	rm(ln, nl)
	
#   setId  unit test
# & getId  unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="tanh", neuron=ln )
	checkTrue(nl$validate())
	nl$setId(15:11)
	checkEquals(nl$getId(), 15:11)
	checkTrue(nl$validate())
	nl$setId(1:2,ID=15:14)
	checkEquals(nl$getId(), c(1,2,13:11))
	checkTrue(nl$validate())
	rm(ln, nl)
	
# joinNeuron unit test	
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="tanh", neuron=ln )
	ln <- gListMLPneuron$new()
	ln$populate(ID=6:10, BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl$joinNeuron(ln)
	checkEquals(nl$getId(),1:10)
	checkEquals(nl$getNumberOfNeurons(),10)
	checkTrue(nl$validate())
	rm(ln, nl)
	
#  delete  unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="tanh", neuron=ln )
	nl$delete(ID=4:5)
	checkEquals(nl$getId(),1:3)
	checkEquals(nl$getNumberOfNeurons(),3)
	checkTrue(nl$validate())
	rm(ln, nl)
	
	
# is.regular  unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="tanh", neuron=ln )
	checkTrue(!nl$is.regular())
	checkTrue(nl$validate())
	rm(ln)
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,1:3,1:3,1:3,1:3), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="tanh", neuron=ln )
	checkTrue(nl$is.regular())
	checkTrue(nl$validate())
	rm(ln, nl)
	
# numOfCons  unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="tanh", neuron=ln )
	checkTrue(nl$validate())
	checkEquals(nl$numOfCons(), c(3,3,3,3,3))
	rm(ln, nl)
	
#   setFrom  unit test
# & getFrom  unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="tanh", neuron=ln )
	checkTrue(nl$validate())
	nl$setFrom(list(c(4,6,7),c(2,4,8),c(8,7,4),c(3,5,8),c(7,6,4)))
	checkEquals(nl$getFrom(), list(c(4,6,7),c(2,4,8),c(8,7,4),c(3,5,8),c(7,6,4)))
	checkEquals(nl$getFrom(ID=3:4),list(c(8,7,4),c(3,5,8)))
	nl$setFrom(list(c(4,6,7),c(2,4,8)), ID=4:5)
	checkEquals(nl$getFrom(), list(c(4,6,7),c(2,4,8),c(8,7,4),c(4,6,7),c(2,4,8)))
	checkEquals(nl$getFrom(ID=4:5),list(c(4,6,7),c(2,4,8)))
	checkTrue(nl$validate())
	rm(ln, nl)
	
#   setWeight  unit test
# & getWeight  unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="tanh", neuron=ln )
	checkTrue(nl$validate())
	nl$setWeight(list(c(4,6,7),c(2,4,8),c(8,7,4),c(3,5,8),c(7,6,4)))
	checkEquals(nl$getWeight(), list(c(4,6,7),c(2,4,8),c(8,7,4),c(3,5,8),c(7,6,4)))
	checkEquals(nl$getWeight(ID=3:4),list(c(8,7,4),c(3,5,8)))
	nl$setWeight(list(c(4,6,7),c(2,4,8)), ID=4:5)
	checkEquals(nl$getWeight(), list(c(4,6,7),c(2,4,8),c(8,7,4),c(4,6,7),c(2,4,8)))
	checkEquals(nl$getWeight(ID=4:5),list(c(4,6,7),c(2,4,8)))
	checkTrue(nl$validate())
	rm(ln, nl)
	
# validate unit test
	ln <- gListMLPneuron$new()
	ln$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="tanh", neuron=ln )
	checkTrue(nl$validate())
	nl <- gNeuralLayer$new(numberOfNeurons=4, activationFunction="tanh", neuron=ln )
	checkException(nl$validate(), silent=TRUE)
	nl <- gNeuralLayer$new(numberOfNeurons=5/0, activationFunction="tanh", neuron=ln )
	checkException(nl$validate(), silent=TRUE)
	nl <- gNeuralLayer$new(numberOfNeurons=5, activationFunction="foo", neuron=ln )
	checkException(nl$validate(), silent=TRUE)
	
}
