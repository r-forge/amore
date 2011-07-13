#pragma once
#include "Iterator.h"

/// class SimpleContainerIterator - 
template <typename T>
class SimpleContainerIterator : public Iterator<T> {
  // Attributes
private:
  Container<T>* d_container;
  typename std::vector<T>::iterator d_iterator;
  // Operations
public:
friend class SimpleContainer<T>; 
  SimpleContainerIterator ();
  ~SimpleContainerIterator ();
private:
  void first ();
  void next ();
  bool isDone ();
  T currentItem ();
};

