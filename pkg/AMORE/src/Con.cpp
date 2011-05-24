#include <iostream>
#include <sstream>

#include <Rcpp.h>
using namespace Rcpp;

#define  MyPrintf  Rprintf


	class Neuron;
	class Con;

	class Neuron{
		int Id;
		std::vector<Con> listCon;
		double outputValue;
	public:
		Neuron() {};
		int  getId	()			{return Id;};
		void setId	(int id)	{Id=id;};
	};

	class Con {
			Neuron * from;
			double weight;
		public:
			Neuron *	getFromNeuron	()   			{return(from);};
			void 		setFromNeuron	(Neuron * f)   	{from = f;};
			int			getFromId		()   			{return(from->getId() );};
			double 		getWeight		() 				{return(weight);};
			void 		setWeight		(double w) 		{weight = w;};
			bool		show			()				{
															Rprintf("From:\t %d \t Weight= \t %lf \n", getFromId() , getWeight());
															return(true);
														};
		};




	RCPP_MODULE(AMORE_module) {
	class_<Con>( "Con" )
			.constructor ()
			.property( "from", 		&Con::getFromId,  	"The access to the from field (read only) is performed through accessors.")
			.property( "weight", 	&Con::getWeight, 	&Con::setWeight, 	"To access the weight field is performed through accessors." )
			.method("show", &Con::show)
			;

	class_<Neuron>( "Neuron" )
			.constructor ()
			.property( "Id", 		&Neuron::getId,  	"The access to the id field is performed through accessors.")
	;


	};



/*
		int main(){
			Con myCon;
			myCon.setFrom(1);
			myCon.setWeight(3.4);

			cout << "La conexion tiene from=" << myCon.getFrom() << " y weight=" << myCon.getWeight() << endl ;
			return 0;

		}

 */
