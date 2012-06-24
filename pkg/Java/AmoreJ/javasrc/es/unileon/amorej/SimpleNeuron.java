package es.unileon.amorej;

public class SimpleNeuron implements Neuron {

	private String id;

	
//	  NeuralNetwork neuralNetwork;
//	  PredictBehavior predictBehavior;
//	  ActivationFunction activationFunction;
//	  NeuronTrainBehavior neuronTrainBehavior;
	//  ConContainer nCons;
	  double inducedLocalField;
	  double output;
	  double outputDerivative;
	  double target;
	 // ConIteratorPtr conIterator;

	
	
	
	public SimpleNeuron(String newId) {
		this.id = newId;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String newId) {
		this.id = newId;
	}

	
//
//	SimpleNeuron::SimpleNeuron(NeuralFactory* ptNeuralFactory) :
//	  Neuron(ptNeuralFactory)
//	{
//	}

//	double
//	SimpleNeuron::getInducedLocalField()
//	{
//	  return d_inducedLocalField;
//	}

	
//	void
//	SimpleNeuron::setInducedLocalField(double inducedLocalField)
//	{
//	  d_inducedLocalField = inducedLocalField;
//	}
//
	
	
//	inline
//	double
//	SimpleNeuron::getOutput()
//	{
//	  return d_output;
//	}
//
	
	
//	void
//	SimpleNeuron::setOutput(double output)
//	{
//	  d_output = output;
//	}
//
//
//
//	double
//	SimpleNeuron::getTarget()
//	{
//	  return d_target;
//	}
//
//	void
//	SimpleNeuron::setTarget(double target)
//	{
//	  d_target = target;
//	}
//
//
//	double
//	SimpleNeuron::getOutputDerivative()
//	{
//	  return d_outputDerivative ;
//	}
//
//
//
//	void
//	SimpleNeuron::setOutputDerivative(double outputDerivative)
//	{
//	  d_outputDerivative = outputDerivative;
//	}
//
//
//	Handler
//	SimpleNeuron::getId()
//	{
//	  return d_Id;
//	}
//
//
//	void
//	SimpleNeuron::setId(Handler Id)
//	{
//	  d_Id = Id;
//	}
//
//	ConIteratorPtr&
//	SimpleNeuron::getConIterator()
//	{
//	  return d_conIterator;
//	}
//
//	void
//	SimpleNeuron::addCon(ConPtr& conPtr)
//	{
//	  d_nCons->push_back(conPtr);
//	}
//
//
//	void
//	SimpleNeuron::setActivationFunction(ActivationFunctionPtr& activationFunctionPtr)
//	{
//	  d_activationFunction = activationFunctionPtr;
//	}
//
//
//	void
//	SimpleNeuron::setPredictBehavior(PredictBehaviorPtr& predictBehaviorPtr)
//	{
//	  d_predictBehavior = predictBehaviorPtr;
//	}
//
//
//
//	void
//	SimpleNeuron::setNeuronTrainBehavior(NeuronTrainBehaviorPtr& neuronTrainBehaviorPtr)
//	{
//	  d_neuronTrainBehavior = neuronTrainBehaviorPtr;
//	}
//
//
//
//	std::string
//	SimpleNeuron::getNeuronTrainBehaviorName()
//	{
//	  return d_neuronTrainBehavior->getName();
//	}
//
//
//	NeuralNetwork*
//	SimpleNeuron::getNeuralNetwork( )
//	{
//	  return d_neuralNetwork;
//	}
//
//
//	void
//	SimpleNeuron::setNeuralNetwork( NeuralNetworkPtr& neuralNetworkPtr)
//	{
//	  d_neuralNetwork = neuralNetworkPtr.get();
//	}
//
//
//
//	double
//	SimpleNeuron::useActivationFunctionf0()
//	{
//	  return d_activationFunction->f0();
//	}
//
//
//	double
//	SimpleNeuron::useActivationFunctionf1()
//	{
//	  return d_activationFunction->f1();
//	}
//
//
//
//	void
//	SimpleNeuron::singlePatternForwardAction()
//	{
//	  d_predictBehavior->singlePatternForwardAction();
//	}
//
//
//	void
//	SimpleNeuron::singlePatternBackwardAction()
//	{
//	  d_neuronTrainBehavior->singlePatternBackwardAction();
//	}
//
//
//	void
//	SimpleNeuron::show()
//	{
//	  if (d_nCons->size() == 0)
//	    {
//
//	      int id = getId();
//	      Rprintf("\n\n-----------------------------------");
//	      if (id == NA_INTEGER)
//	        {
//	          Rprintf("\n Id: NA, Invalid neuron Id");
//	        }
//	      else
//	        {
//	          Rprintf("\n Id: %d", id);
//	        }
//	      Rprintf("\n-----------------------------------");
//	      Rprintf("\n output: %lf", d_output);
//	      Rprintf("\n-----------------------------------");
//	      Rprintf("\n Neuron Train Behavior: %s", getNeuronTrainBehaviorName().c_str() );
//	      Rprintf("\n-----------------------------------");
//
//	    }
//	  else
//	    {
//	      int id = getId();
//	      Rprintf("\n\n-----------------------------------");
//	      if (id == NA_INTEGER)
//	        {
//	          Rprintf("\n Id: NA, Invalid neuron Id");
//	        }
//	      else
//	        {
//	          Rprintf("\n Id: %d", id);
//	        }
//	      Rprintf("\n-----------------------------------");
//	      d_predictBehavior->show();
//	      Rprintf("\n output: %lf", d_output);
//	      Rprintf("\n target: %lf", d_target);
//	      Rprintf("\n-----------------------------------");
//	      d_nCons->show();
//	      Rprintf("\n-----------------------------------");
//	      Rprintf("\n Neuron Train Behavior: %s", getNeuronTrainBehaviorName().c_str() );
//	      Rprintf("\n-----------------------------------");
//	    }
//	}
//
//	bool
//	SimpleNeuron::validate()
//	{
//	  BEGIN_RCPP
//	  if (getId() == NA_INTEGER ) throw std::range_error("[C++ SimpleNeuron::validate]: Error, Id is NA.");
//	    d_nCons->validate();
//	  return (TRUE);
//	END_RCPP}
//
//
//	int
//	SimpleNeuron::numberOfConnections()
//	{
//	  return static_cast<int>(d_nCons->size());
//	}
//
//
//
//	double
//	SimpleNeuron::costFunctionf0(double output, double target)
//	{
//	  return d_neuralNetwork->costFunctionf0( output, target );
//	}
//
//
//	double
//	SimpleNeuron::costFunctionf1(double output, double target)
//	{
//	  return d_neuralNetwork->costFunctionf1( output, target );
//	}
//
//
//
//	void
//	SimpleNeuron::addToBias(double value)
//	{
//	  d_predictBehavior->addToBias(value);
//	}
//
//
//	void
//	SimpleNeuron::addToDelta(double value)
//	{
//	  d_neuronTrainBehavior->addToDelta(value);
//	}
//
//	void
//	SimpleNeuron::setLearningRate(double learningRate)
//	{
//	  d_neuronTrainBehavior->setLearningRate(learningRate);
//	}
//
//
//
//


}
