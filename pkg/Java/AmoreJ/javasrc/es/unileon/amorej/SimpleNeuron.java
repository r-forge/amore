package es.unileon.amorej;

public class SimpleNeuron implements Neuron {

	private String id;

	public SimpleNeuron(String newId) {
		this.id = newId;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String newId) {
		this.id = newId;
	}


}
