#include "Iterator.h"

/// class SimpleContainerIterator - 
template <typename T>
class SimpleContainerIterator : public Iterator {
  // Attributes
private:
  Container<T> container;
  int current;
  // Operations
public:
  SimpleContainerIterator ();
  ~SimpleContainerIterator ();
private:
  void first ();
  void next ();
  bool isDone ();
  T currentItem ();
};

