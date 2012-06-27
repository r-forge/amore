package es.unileon.amorej;

import java.util.ArrayList;

public class SimpleContainer<E extends Visible & Checkable> implements Container<E> {
	private ArrayList<E> collection;

	 public SimpleContainer() {
	 collection = new ArrayList<E>();
	 }

	 public SimpleContainer(int initialCapacity) {
	 collection = new ArrayList<E>(initialCapacity);
	 }

	 @Override
	public E get(int index) {
		return collection.get(index);
	}

	@Override
	public boolean add(E e) {
		return collection.add(e);		
	}

	@Override
	public void ensureCapacity(int n) {
		collection.ensureCapacity(n);
	}

	@Override
	public boolean isEmpty() {
		return collection.isEmpty();
	}

	@Override
	public int size() {
		return collection.size();
	}

	@Override
	public void clear() {
		collection.clear();
		
	}

	public  void show() {
		for (E e: collection) {
			e.show();
		}

	}

	@Override
	public boolean validate() throws AmoreJException {
		for (E e: collection) {
			e.validate();
		}
		return true;
	}

}
