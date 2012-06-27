package es.unileon.amorej;

/**
 * @author mcasl
 * 
 */
public class Connection implements Visible, Checkable {
	private Neuron nextNeuron;
	private double weight;

	/**
	 * @param neuron
	 */
	public Connection(Neuron neuron) {
		this.nextNeuron = neuron;
		this.weight = 0;
	}

	/**
	 * @param neuron
	 * @param weight
	 */
	public Connection(Neuron neuron, double weight) {
		this.nextNeuron = neuron;
		this.weight = weight;
	}

	/**
	 * @return
	 */
	public Neuron getNextNeuron() {
		return this.nextNeuron;
	}

	/**
	 * @param neuron
	 */
	public void setNextNeuron(Neuron neuron) {
		this.nextNeuron = neuron;
	}

	/**
	 * @return
	 */
	public String getId() {
		return  (this.nextNeuron!=null)?this.nextNeuron.getId():"NA";
	}

	/**
	 * @return
	 */
	public double getWeight() {
		return this.weight;
	}

	/**
	 * @param value
	 */
	public void setWeight(double value) {
		this.weight = value;
	}

	// public double getInputValue () { return this.nextNeuron.getOutput(); }

	/**
	 * @param value
	 */
	public void addToWeight(double value) {
		this.weight += value;
	}

	// public void addToDelta(double value) { neuron.addToDelta(value); }

	/**
	 * 
	 */
	public void show() {
		System.out.print("\nFrom:\t" + this.getId() + "\t Weight= \t"
				+ this.weight);
	}

	/**
	 * @return
	 * @throws AmoreJException
	 */
	public boolean validate() throws AmoreJException {
		if (Double.isInfinite(this.weight)) {
			throw new AmoreJException("weight is infinite.");
		}
		if (this.getId().equals("")) {
			throw new AmoreJException("Empty id field.");
		}
		if (this.getId().equals("NA")) {
			throw new AmoreJException("getId provided a Null reference.");
		}

		return true;
	}

}
