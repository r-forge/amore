package es.unileon.amorej;

public interface Container<E extends Visible & Checkable> extends Visible, Checkable {

	Iterator<E> createIterator();

	Iterator<E> createReverseIterator();

	E get(int index);

	boolean add(E e);

	void ensureCapacity(int n);

	boolean isEmpty();

	int size();

	void clear();

	void show();

	boolean validate() throws AmoreJException;

}
