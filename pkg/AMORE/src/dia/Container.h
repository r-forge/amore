#pragma once
// Interface
/// class Container - 
template <typename T>
class Container {
  // Operations
public:
  virtual ~Container ();
  virtual boost::shared_ptr< Iterator<T> >  createIterator () = 0;
  virtual T at (size_type element) = 0;
  virtual void push_back (T const & const_reference) = 0;
  virtual void reserve (int n) = 0;
  virtual bool empty () = 0;
  virtual size_type size () = 0;
  virtual void clear () = 0;
  virtual void show () = 0;
  virtual bool validate () = 0;
protected:
  Container ();
};

