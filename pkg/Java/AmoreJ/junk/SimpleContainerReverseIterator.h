#include "Iterator.h"

/// class SimpleContainerReverseIterator - 
template <typename T>
class SimpleContainerReverseIterator : public Iterator {
  // Attributes
private:
  Container<T> container;
  int current;
  // Operations
public:
  SimpleContainerReverseIterator ();
  ~SimpleContainerReverseIterator ();
private:
  void first ();
  void next ();
  bool isDone ();
  T currentItem ();
};

