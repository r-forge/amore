package es.unileon.amorej;

public class SimpleContainerIterator<E extends Visible & Checkable> implements
		Iterator<E> {
	Container<E> container;
	int current;

	SimpleContainerIterator(Container<E> container) {
		this.container = container;
		this.current = 0;
	}

	@Override
	public void first() {
		this.current = 0;
	}

	@Override
	public void next() {
		this.current++;
	}

	@Override
	public boolean isDone() {
		return (this.current == this.container.size());
	}

	@Override
	public E currentItem() throws AmoreJException {
		if (this.isDone())
			throw new AmoreJException(
					"SimpleContainerIterator.currentItem  Error: IteratorOutOfBounds");
		return this.container.get(current);

	}

}
