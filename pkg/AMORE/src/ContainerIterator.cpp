#include "dia/ContainerIterator.h"

template<typename T>
  ContainerIterator<T>::ContainerIterator()
  {
  }

template<typename T>
  ContainerIterator<T>::~ContainerIterator()
  {
  }

template<typename T>
  void
  ContainerIterator<T>::first()
  {
    d_iterator = d_container->collection.begin();
  }

template<typename T>
  void
  ContainerIterator<T>::next()
  {
    ++d_iterator;
  }

template<typename T>
  bool
  ContainerIterator<T>::isDone()
  {
    bool IteratorIsDone(d_iterator == d_container->collection.end());
    return IteratorIsDone;
  }

template<typename T>
  T
  ContainerIterator<T>::currentItem()
  {
    return *d_iterator;
  }

