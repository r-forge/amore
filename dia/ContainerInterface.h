/// class ContainerInterface - 
class ContainerInterface {
  // Operations
public:
  virtual void push_back () = 0;
  virtual void reserve () = 0;
  virtual void resize () = 0;
  virtual bool empty () = 0;
  virtual size_type const size () = 0;
  virtual void clear () = 0;
  virtual void show () = 0;
  virtual bool validate () = 0;
};

