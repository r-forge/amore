#pragma once
/// class IteratorInterface - 
template <typename T>
class IteratorInterface {
  // Operations
public:
  virtual ~IteratorInterface ();
  virtual void first () = 0;
  virtual void next () = 0;
  virtual bool isDone () = 0;
  virtual T currentItem () = 0;
protected:
  IteratorInterface ();
};

