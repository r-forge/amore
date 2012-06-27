#include "Container.h"

/// class SimpleContainer - 
template <typename T>
class SimpleContainer : public Container {
  // Attributes
protected:
  ArrayList< T > collection;
  // Operations
public:
  SimpleContainer ();
  ~SimpleContainer ();
private:
  T at (size_type element);
  Iterator<T>* createIterator ();
  Iterator<T>* createReverseIterator ();
  void push_back (T const & const_reference);
  void reserve (int n);
  bool empty ();
  size_type size ();
  void clear ();
  void show ();
  bool validate ();
};

