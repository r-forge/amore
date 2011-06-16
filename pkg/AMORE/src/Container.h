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
    typedef T value_type;
    typedef T const & const_reference;
    typedef typename std::vector< T >::iterator iterator;
    typedef typename std::vector< T >::const_iterator
        const_iterator;
  protected:
    std::vector< T > collection;
    // Operations
  public:

    Container();

    Container(typename std::vector< T >::iterator first,
        typename std::vector< T >::iterator last);
#if 0
    bool
    buildAndAppend(NeuronContainer_iterator firstNeuron,
        NeuronContainer_iterator lastNeuron,
        std::vector<double>::iterator firstWeight,
        std::vector<double>::iterator lastWeight);

    bool
      buildAndAppend(NeuronContainer_iterator firstNeuron,
          NeuronContainer_iterator lastNeuron);


    bool
    buildAndAppend(std::vector<int>::iterator firstId,
        std::vector<int>::iterator lastId, ConContainer_iterator firstCon,
        ConContainer_iterator lastCon);




    bool
    buildAndAppend(std::vector<int>::iterator firstId,
        std::vector<int>::iterator lastId);

#endif


    void
    push_back(value_type  reference);

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

