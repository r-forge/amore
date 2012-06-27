// Interface
/// class Iterator - 
template <typename T>
class Iterator {
  // Operations
public:
  virtual ~Iterator ();
  virtual void first () = 0;
  virtual void next () = 0;
  virtual bool isDone () = 0;
  virtual T currentItem () = 0;
};

