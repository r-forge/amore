import es.unileon.amorej.AmoreJException;
import es.unileon.amorej.Con;
import es.unileon.amorej.Neuron;
import es.unileon.amorej.SimpleNeuron;

public class Principal {
	public static void main(String args[]) throws AmoreJException{
		Neuron neuron =  new SimpleNeuron(1);
		Con con = new Con(neuron, 10.5);
		con.show();
	}
}
