#pragma once
#include "Container.h"

/// class SimpleContainer - 
template <typename T>
class SimpleContainer : public Container<T> {
  // Attributes
protected:
  std::vector< T > d_collection;
  // Operations
public:
friend class SimpleContainerIterator<T>; 
  SimpleContainer ();
  ~SimpleContainer ();
private:
  T at (size_type element);
   boost::shared_ptr< Iterator<T> > createIterator ();
  void push_back (T const & const_reference);
  void reserve (int n);
  bool empty ();
  size_type size ();
  void clear ();
  void show ();
  bool validate ();
};

#include "../SimpleContainer.code" 
