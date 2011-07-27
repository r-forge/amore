#pragma once
#include "Iterator.h"

/// class SimpleContainerIterator - 
template <typename T>
class SimpleContainerIterator : public Iterator<T> {
  // Attributes
private:
  Container<T>* d_container;
  size_type d_current;
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

#include "../SimpleContainerIterator.code" 
