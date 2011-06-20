rm pkg/AMORE/src/dia/*
dia2code -d pkg/AMORE/src/dia -l licensefile  AMORE.dia
sed -e 's/public ContainerInterface {/public ContainerInterface<T> {/g' -i ""  pkg/AMORE/src/dia/Container.h 
sed -e 's/public IteratorInterface {/public IteratorInterface<T> {/g' -i ""  pkg/AMORE/src/dia/ContainerIterator.h 
sed -e '/public:/ a\
friend class ContainerIterator<T>; ' -i ""  pkg/AMORE/src/dia/Container.h 
sed -e '/public:/ a\
friend class Container<T>; ' -i ""  pkg/AMORE/src/dia/ContainerIterator.h 

