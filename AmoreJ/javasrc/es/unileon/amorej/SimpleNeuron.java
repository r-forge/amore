package es.unileon.amorej;

public class SimpleNeuron implements Neuron {
	private int d_Id;
	
	public SimpleNeuron(int newId){
		this.d_Id = newId;
	}
	
	public int  getId() {
		return this.d_Id;
	}
	
	 public void setId(int newId){
		this.d_Id = newId; 
	 }
	 
}
