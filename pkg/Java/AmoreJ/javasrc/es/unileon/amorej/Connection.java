package es.unileon.amorej;

/**
 * @author mcasl
 *
 */
/**
 * @author mcasl
 * 
 */
public class Connection {
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
	 * @param newWeight
	 */
	public void setWeight(double newWeight) {
		this.weight = newWeight;
	}

	/**
	 * @return
	 */
	public double getWeight() {
		return this.weight;
	}

	/**
	 * @throws AmoreJException
	 */
	public void show() throws AmoreJException {
		System.out.println("Weight:" + weight);
	}

}
