rm pkg/AMORE/src/dia/*
dia2code -d pkg/AMORE/src/dia -l licensefile  AMORE-Con.dia
dia2code -d pkg/AMORE/src/dia -l licensefile  AMORE-Container.dia
dia2code -d pkg/AMORE/src/dia -l licensefile  AMORE-Neuron.dia
dia2code -d pkg/AMORE/src/dia -l licensefile  AMORE-NeuralFactory.dia
dia2code -d pkg/AMORE/src/dia -l licensefile  AMORE-NeuralCreator.dia
dia2code -d pkg/AMORE/src/dia -l licensefile  AMORE-PredictBehavior.dia
dia2code -d pkg/AMORE/src/dia -l licensefile  AMORE-TrainingBehavior.dia

sed -e 's/public Container {/public Container<T> {/g' -i ""  pkg/AMORE/src/dia/SimpleContainer.h 
sed -e 's/public Iterator {/public Iterator<T> {/g' -i ""  pkg/AMORE/src/dia/SimpleContainerIterator.h 
sed -e '/public:/ a\
friend class SimpleContainerIterator<T>; ' -i ""  pkg/AMORE/src/dia/SimpleContainer.h 
sed -e '/public:/ a\
friend class SimpleContainer<T>; ' -i ""  pkg/AMORE/src/dia/SimpleContainerIterator.h 

