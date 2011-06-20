#pragma once
#include "IteratorInterface.h"

/// class ContainerIterator - 
template <typename T>
class ContainerIterator : public IteratorInterface<T> {
  // Attributes
private:
  Container<T>* d_container;
  typename std::vector<T>::iterator d_iterator;
  // Operations
public:
friend class Container<T>; 
  ContainerIterator ();
  ~ContainerIterator ();
private:
  void first ();
  void next ();
  bool isDone ();
  T currentItem ();
};

