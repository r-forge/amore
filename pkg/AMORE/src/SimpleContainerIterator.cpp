#include "dia/SimpleContainerIterator.h"

template<typename T>
  SimpleContainerIterator<T>::SimpleContainerIterator()
  {
  }

template<typename T>
  SimpleContainerIterator<T>::~SimpleContainerIterator()
  {
  }

template<typename T>
  void
  SimpleContainerIterator<T>::first()
  {
    d_current = 0;
  }

template<typename T>
  void
  SimpleContainerIterator<T>::next()
  {
    ++d_current;
  }

template<typename T>
  bool
  SimpleContainerIterator<T>::isDone()
  {
    bool IteratorIsDone(d_current == d_container->size());
    return IteratorIsDone;
  }

template<typename T>
  T
  SimpleContainerIterator<T>::currentItem()
  {
      if (isDone()) throw std::range_error("SimpleContainerIterator::currentItem  Error: IteratorOutOfBounds");
      return d_container->at(d_current);
  }

