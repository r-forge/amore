/*
 * Container.h
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

#ifndef CONTAINER_H_
#define CONTAINER_H_

/// class Container -
template<typename T>
  class Container
  {
    // Attributes
  public:
    typedef typename boost::shared_ptr<T> value_type;
    typedef boost::shared_ptr<T> const & const_reference;
    typedef typename std::vector<boost::shared_ptr<T> >::iterator iterator;
    typedef typename std::vector<boost::shared_ptr<T> >::const_iterator
        const_iterator;
  protected:
    std::vector<boost::shared_ptr<T> > collection;
    // Operations
  public:

    Container();

    Container(typename std::vector<boost::shared_ptr<T> >::iterator first,
        typename std::vector<boost::shared_ptr<T> >::iterator last);


    bool
    buildAndAppend(NeuronContainer_iterator firstNeuron,
        NeuronContainer_iterator lastNeuron,
        std::vector<double>::iterator firstWeight,
        std::vector<double>::iterator lastWeight);

    void
    push_back(value_type const & const_reference);

    void
    erase(iterator first, iterator last);

    iterator
    begin();

    iterator
    end();

    void
    reserve(int n);

    void
    resize(int n);

    void
    empty();

    size_type
    size();

    void
    clear();

    void
    insert(iterator position, const_iterator first, const_iterator last);

    void
    show();

    bool
    validate();
  };

#endif /* CONTAINER_H_ */

