/// class IteratorInterface - 
class IteratorInterface {
  // Operations
public:
  virtual void first () = 0;
  virtual void next () = 0;
  virtual bool isDone () = 0;
  virtual currentItem () = 0;
};

