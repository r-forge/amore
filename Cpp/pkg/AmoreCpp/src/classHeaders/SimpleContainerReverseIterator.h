#pragma once
#include "Iterator.h"

/// class SimpleContainerReverseIterator - 
template <typename T>
class SimpleContainerReverseIterator : public Iterator<T> {
  // Attributes
private:
  Container<T>* d_container;
  int d_current;
  // Operations
public:
friend class SimpleContainer<T>; 
  SimpleContainerReverseIterator ();
  ~SimpleContainerReverseIterator ();
private:
  void first ();
  void next ();
  bool isDone ();
  T currentItem ();
};

#include "../SimpleContainerReverseIterator.code" 
