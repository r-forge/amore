#pragma once
#include "ContainerInterface.h"

/// class Container - 
template <typename T>
class Container : public ContainerInterface<T> {
  // Attributes
protected:
  std::vector< T > collection;
  // Operations
public:
friend class ContainerIterator<T>; 
  Container ();
  ~Container ();
private:
   boost::shared_ptr< IteratorInterface<T> > createIterator ();
  void push_back (T const & const_reference);
  void reserve (int n);
  bool empty ();
  size_type size ();
  void clear ();
  void show ();
  bool validate ();
};

