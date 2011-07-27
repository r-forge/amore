rm ../pkg/AMORE/src/classHeaders/*
dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile  AMORE-Con.dia
mv ../pkg/AMORE/src/classHeaders/Connection.h ../pkg/AMORE/src/classHeaders/Connection.h

dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile  AMORE-Container.dia
dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile  AMORE-Neuron.dia
dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile  AMORE-NeuralFactory.dia
dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile  AMORE-NeuralCreator.dia
dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile  AMORE-PredictBehavior.dia
dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile  AMORE-TrainingBehavior.dia
dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile  AMORE-ActivationFunction.dia
dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile  AMORE-NeuralNetwork.dia
dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile  AMORE-NetworkRinterface.dia

sed -e 's/public Container {/public Container<T> {/g' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainer.h 
sed -e 's/public Iterator {/public Iterator<T> {/g' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainerIterator.h 
sed -e '/public:/ a\
friend class SimpleContainerIterator<T>; ' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainer.h 
sed -e '/public:/ a\
friend class SimpleContainer<T>; ' -i ""  ../pkg/AMORE/src/classHeaders/SimpleContainerIterator.h 




echo "#include \"../Container.code\" " >> ../pkg/AMORE/src/classHeaders/Container.h
echo "#include \"../SimpleContainer.code\" " >> ../pkg/AMORE/src/classHeaders/SimpleContainer.h
echo "#include \"../Iterator.code\" " >> ../pkg/AMORE/src/classHeaders/Iterator.h
echo "#include \"../SimpleContainerIterator.code\" " >> ../pkg/AMORE/src/classHeaders/SimpleContainerIterator.h


sed -e '/public:/ a\
friend class MLPfactory; ' -i ""  ../pkg/AMORE/src/classHeaders/Neuron.h 
sed -e '/public:/ a\
friend class MLPfactory; ' -i ""  ../pkg/AMORE/src/classHeaders/MLPbehavior.h 
sed -e '/public:/ a\
friend class SimpleNeuralCreator; ' -i ""  ../pkg/AMORE/src/classHeaders/NeuralNetwork.h 

sed -e 's/virtual \/\/ /\/\/ virtual /g' -i ""  ../pkg/AMORE/src/classHeaders/Neuron.h 

