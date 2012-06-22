package es.unileon.amorej;


/**
 * @author mcasl
 *
 */
/**
 * @author mcasl
 *
 */
public class Con {
 private Neuron d_neuron;
 private double d_weight;


 /**
 * @param neuron
 */
public Con(Neuron neuron) {
	 d_neuron = neuron;
	 d_weight = 0;
 }
 
 /**
 * @param neuron
 * @param weight
 */
public Con(Neuron neuron, double weight) {
	 d_neuron = neuron;
	 d_weight = weight;
 }
 
 /**
 * @param newWeight
 */
public void setWeight(double newWeight) {
	 d_weight = newWeight;
 }
 
 /**
 * @return
 */
public double getWeight() {
	 return d_weight;
 }
 
 public void show () throws AmoreJException{
	 System.out.println("Weight:" + d_weight );
 }
 
}
