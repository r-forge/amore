package es.unileon.amorej;

public class SimpleContainerReverseIterator<E extends Visible & Checkable>
		implements Iterator<E> {
	Container<E> container;
	int current;

	SimpleContainerReverseIterator(Container<E> container) {
		this.container = container;
		current = -1 + this.container.size();
	}

	@Override
	public void first() {
		this.current = -1 + this.container.size();
		;
	}

	@Override
	public void next() {
		this.current--;
	}

	@Override
	public boolean isDone() {
		return (this.current == -1);
	}

	@Override
	public E currentItem() throws AmoreJException {
		if (this.isDone())
			throw new AmoreJException(
					"SimpleContainerIterator.currentItem  Error: IteratorOutOfBounds");
		return this.container.get(current);

	}

}
