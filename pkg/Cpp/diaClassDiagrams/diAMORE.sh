rm ../pkg/AMORE/src/classHeaders/*

ls *.dia | awk '{print "dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile " $0  }' | sh

mv ../pkg/AMORE/src/classHeaders/Con.h ../pkg/AMORE/src/classHeaders/Connection.h



sed -e 's/public Container {/public Container<T> {/g' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainer.h 
sed -e 's/public Iterator {/public Iterator<T> {/g' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainerIterator.h 
sed -e 's/public Iterator {/public Iterator<T> {/g' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainerReverseIterator.h 
sed -e '/public:/ a\
friend class SimpleContainerIterator<T>; ' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainer.h 
sed -e '/public:/ a\
friend class SimpleContainerReverseIterator<T>; ' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainer.h 
sed -e '/public:/ a\
friend class SimpleContainer<T>; ' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainerIterator.h 
sed -e '/public:/ a\
friend class SimpleContainer<T>; ' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainerReverseIterator.h 

echo "#include \"../Container.code\" " >> ../pkg/AMORE/src/classHeaders/Container.h
echo "#include \"../SimpleContainer.code\" " >> ../pkg/AMORE/src/classHeaders/SimpleContainer.h
echo "#include \"../Iterator.code\" " >> ../pkg/AMORE/src/classHeaders/Iterator.h
echo "#include \"../SimpleContainerIterator.code\" " >> ../pkg/AMORE/src/classHeaders/SimpleContainerIterator.h
echo "#include \"../SimpleContainerReverseIterator.code\" " >> ../pkg/AMORE/src/classHeaders/SimpleContainerReverseIterator.h


sed -e '/public:/ a\
friend class NeuronTrainBehavior; ' -i ""  ../pkg/AMORE/src/classHeaders/PredictBehavior.h 

sed -e '/#pragma once/ a\
#include "MLPbehavior.h"\
#include "ADAPTgdOutputNeuronTrainBehavior.h" \
#include "ADAPTgdHiddenNeuronTrainBehavior.h" \
' -i ""  ../pkg/AMORE/src/classHeaders/Neuron.h

sed -e '/public:/ a\
friend class MLPfactory; \
friend class NeuronTrainBehavior; \
friend void MLPbehavior::singlePatternForwardAction();\
friend void SimpleNetwork::readOutput (std::vector<double>::iterator& iterator, NeuronIteratorPtr outputNeuronIteratorPtr);\
friend void ADAPTgdOutputNeuronTrainBehavior::singlePatternBackwardAction();\
friend void ADAPTgdHiddenNeuronTrainBehavior::singlePatternBackwardAction();\
' -i ""  ../pkg/AMORE/src/classHeaders/Neuron.h


sed -e '/#pragma once/ a\
#include "MLPbehavior.h"\
#include "ADAPTgdOutputNeuronTrainBehavior.h"\
#include "ADAPTgdHiddenNeuronTrainBehavior.h" \
' -i ""  ../pkg/AMORE/src/classHeaders/Connection.h

sed -e '/public:/ a\
friend void MLPbehavior::singlePatternForwardAction(); \
friend void ADAPTgdOutputNeuronTrainBehavior::singlePatternBackwardAction();\
friend void ADAPTgdHiddenNeuronTrainBehavior::singlePatternBackwardAction();\
' -i ""  ../pkg/AMORE/src/classHeaders/Connection.h

sed -e '/public:/ a\
friend class MLPfactory; ' -i ""  ../pkg/AMORE/src/classHeaders/MLPbehavior.h 
sed -e '/public:/ a\
friend class SimpleNeuralCreator; ' -i ""  ../pkg/AMORE/src/classHeaders/NeuralNetwork.h






sed -e 's/virtual \/\/ /\/\/ virtual /g' -i ""  ../pkg/AMORE/src/classHeaders/Neuron.h
sed -e 's/virtual \/\/ /\/\/ virtual /g' -i ""  ../pkg/AMORE/src/classHeaders/Neuralfactory.h 
sed -e 's/virtual \/\/ /\/\/ virtual /g' -i ""  ../pkg/AMORE/src/classHeaders/MLPfactory.h 
sed -e 's/virtual \/\/ /\/\/ virtual /g' -i ""  ../pkg/AMORE/src/classHeaders/MLPNoNetworkTrainBehaviorFactory.h 
sed -e 's/virtual \/\/ /\/\/ virtual /g' -i ""  ../pkg/AMORE/src/classHeaders/NeuralNetwork.h 

