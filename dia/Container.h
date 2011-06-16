#include "ContainerInterface.h"

/// class Container - 
template <typename T>
class Container : public ContainerInterface {
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
  template <typename Type1, typename Type2> void buildAndAppend (std::vector<int>::iterator firstId, std::vector<int>::iterator lastId, ConContainer_iterator firstCon, ConContainer_iterator lastCon);
  void push_back (value_type const & const_reference);
  void insert (iterator position, iterator first, iterator last);
  void erase (iterator first, iterator last);
  iterator begin ();
  iterator end ();
  void reserve (int n);
  void resize (int n);
  bool empty ();
  size_type size ();
  void clear ();
  void show ();
  bool validate ();
  bool buildAndAppend (NeuronContainer_iterator firstNeuron, NeuronContainer_iterator lastNeuron);
  bool buildAndAppend (NeuronContainer_iterator firstNeuron, NeuronContainer_iterator lastNeuron, std::vector<double>::iterator firstWeight, std::vector<double>::iterator lastWeight);
};

