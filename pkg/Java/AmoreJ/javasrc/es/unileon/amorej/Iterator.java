package es.unileon.amorej;

public interface Iterator<E extends Visible & Checkable> {
	  void first ();
	  void next ();
	  boolean isDone ();
	  E currentItem ();
}

