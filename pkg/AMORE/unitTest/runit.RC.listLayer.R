# TODO: Add comment
# 
# Author: mcasl
###############################################################################

test.gListLayer.new_fromIsNumeric <- function() {
	nl <- gmlpLayer$new(activationFunction="tanh")  # populate will set the value of numberOfNeurons
	nl$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll <- gListLayer$new()
	ll$push_back(nl)
	nl <- gmlpLayer$new(activationFunction="tanh")  
	nl$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll$push_back(nl)
	checkEquals(ll$getId(), list(1:5, 1:5))
	checkException(ll$validate(), silent=TRUE)
	#  Repeating ids makes validate fail
	# ------
	#  Now, different ids so that validate returns TRUE
	nl <- gmlpLayer$new(activationFunction="tanh")  
	nl$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll <- gListLayer$new()
	ll$push_back(nl)
	nl <- gmlpLayer$new(activationFunction="tanh")  
	nl$populate(ID=6:10, BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll$push_back(nl)
	checkEquals(ll$getId(), list(1:5, 6:10))
	checkTrue(ll$validate()) 
}

test.gListLayer.new_fromIsNeuron <- function() {	
	nl1 <- gmlpLayer$new(activationFunction="tanh")  # populate will set the value of numberOfNeurons
	nl1$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	checkTrue(nl1$validate())
	checkEquals(nl1$getId(), 1:5)
	ll <- gListLayer$new()
	ll$push_back(nl1)
	nl2 <- gmlpLayer$new(activationFunction="tanh")
	nl2$populate(ID=6:8, BIAS=c(1.1,3.4,5.4), FROM=replicate(3, nl1$getLdata(), simplify=FALSE), WEIGHT=list(11:15,21:25,31:35))
	checkTrue(nl2$validate())
	ll$push_back(nl2)
	checkTrue(ll$validate())
}


test.gListLayer.getId <- function() {
	nl <- gmlpLayer$new(activationFunction="tanh")  # populate will set the value of numberOfNeurons
	nl$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll <- gListLayer$new()
	ll$push_back(nl)
	nl <- gmlpLayer$new(activationFunction="tanh")  
	nl$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll$push_back(nl)
	checkEquals(ll$getId(), list(1:5, 1:5))
}


test.gListLayer.numOfLayers <- function() {	
	nl <- gmlpLayer$new(activationFunction="tanh")  # populate will set the value of numberOfNeurons
	nl$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll <- gListLayer$new()
	ll$push_back(nl)
	nl <- gmlpLayer$new(activationFunction="tanh")  # populate will set the value of numberOfNeurons
	nl$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll$push_back(nl)
	checkEquals(ll$numOfLayers(), 2)
}


test.gListLayer.select <- function() {
	nl <- gmlpLayer$new(activationFunction="tanh")  # populate will set the value of numberOfNeurons
	nl$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll <- gListLayer$new()
	ll$push_back(nl)
	nl <- gmlpLayer$new(activationFunction="tanh")  # populate will set the value of numberOfNeurons
	nl$populate(ID=6:10, BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll$push_back(nl)
	checkEquals(ll$select(POS=1)$getId(), list(1:5))
}


test.gListLayer.delete <- function() {
	nl <- gmlpLayer$new(activationFunction="tanh")  # populate will set the value of numberOfNeurons
	nl$populate(ID=c(1,2,3,4,5), BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll <- gListLayer$new()
	ll$push_back(nl)
	nl <- gmlpLayer$new(activationFunction="tanh")  # populate will set the value of numberOfNeurons
	nl$populate(ID=6:10, BIAS=c(1.1,3.4,5.4,9.8,5.6), FROM=list(1:3,4:6,7:9,10:12,13:15), WEIGHT=list(11:13,21:23,31:33,41:43,51:53))
	ll$push_back(nl)
	checkException(ll$delete(POS=1:3), silent=TRUE )
	ll$delete(POS=1)
	checkEquals(ll$getId(), list(6:10))
	ll$delete(POS=1)
	checkEquals(ll$numOfLayers(),0)
}
