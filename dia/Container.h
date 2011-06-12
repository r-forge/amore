/// class Container - 
template < T>
class Container {
  // Attributes
public:
  typedef typename boost::shared_ptr<T> value_type;
  typedef value_type const & const_reference;
  typedef std::vector<boost::shared_ptr<T> >::iterator iterator;
  typedef typename std::vector<boost::shared_ptr<T> >::const_iterator const_iterator;
protected:
  std::vector<value_type> collection;
  // Operations
public:
  Container ();
  Container (std::vector<value_type>  collection);
  iterator begin ();
  iterator end ();
  void push_back (value_type const & const_reference);
  void reserve (int n);
  void resize (int n);
  void empty ();
  size_type size ();
  void clear ();
  void show ();
  bool validate ();
  template <typename Type1, typename Type2> void buildAndAppend (Type1 first1, Type1 last1, Type2 first2, Type2 last2);
};

