rm ../pkg/AMORE/src/classHeaders/*

ls *.dia | awk '{print "dia2code -d ../pkg/AMORE/src/classHeaders -l licensefile " $0  }' | sh

mv ../pkg/AMORE/src/classHeaders/Con.h ../pkg/AMORE/src/classHeaders/Connection.h




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

