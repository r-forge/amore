/// class Container - 
template <typename T>
class Container {
  // Attributes
public:
  typedef typename boost::shared_ptr<T> value_type;
  typedef boost::shared_ptr<T> const & const_reference;
  typedef typename std::vector< boost::shared_ptr<T> >::iterator iterator;
  typedef typename std::vector< boost::shared_ptr<T> >::const_iterator const_iterator;
protected:
  std::vector< boost::shared_ptr<T> > collection;
  // Operations
public:
  Container ();
  Container (typename std::vector< boost::shared_ptr<T> >::iterator first, typename std::vector< boost::shared_ptr<T> >::iterator last);
  template <typename Type1, typename Type2> void buildAndAppend (Type1 first1, Type1 last1, Type2 first2, Type2 last2);
  void push_back (value_type const & const_reference);
  void erase (iterator first, iterator last);
  iterator begin ();
  iterator end ();
  void reserve (int n);
  void resize (int n);
  void empty ();
  size_type size ();
  void clear ();
  void show ();
  bool validate ();
};

