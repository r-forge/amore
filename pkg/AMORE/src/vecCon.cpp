/*
 * vecCon.cpp
 *
 *  Created on: 26/05/2011
 *      Author: mcasl
 */

//! Size of the vecCon object
/*!
 * This function returns the size of the vecCon object, that is to say, the number of Con objects it contains.
 * \return The size of the vector
 *
 *  \code
 *  //================
 *  //Usage example:
 *  //================
 *	// Data set up
 *				std::vector<int> result;
 *				std::vector<ConSharedPtr> vcA, vcB;
 *				vecAMOREneuronSharedPtr	ptShvNeuron( new vecAMORE<Neuron>() );
 *				vecConSharedPtr	ptShvCon( new vecCon() );
 *				ConSharedPtr	ptC;
 *				NeuronSharedPtr ptN;
 *				int ids[]= {10, 20, 30};
 *				double weights[] = {1.13, 2.22, 3.33 };
 *				for (int i=0; i<=2 ; i++) {				// Let's create a vector with three neurons
 *					ptN.reset( new Neuron( ids[i] ) );
 *					ptShvNeuron->push_back(ptN);
 *				}
 *	// Test
 *				for (int i=0; i<=2 ; i++) {				// and a vector with three connections
 *					result.push_back(ptShvCon->numOfCons());		// Append numOfCons to result, create new Con and push_back into MyvecCon
 *					ptC.reset( new Con( ptShvNeuron->getLdata().at(i), weights[i]) );
 *					ptShvCon->push_back(ptC);
 *				}
 *
 *	// Now, result contains a numeric vector with values 0, 1, 2, and 3.
 * \endcode
 *
 * \sa vecAMORE::size (alias)
 */
int  vecCon::numOfCons() {
	return ldata.size();
}



//! Getter of the Id values of the vector of Cons
/*!
 * This function returns the Id's of the neurons referred to by the vector of Cons.
 * \return An std::vector<int> that contains the Ids
 *
 * \code
 *  //================
 *  //Usage example:
 *  //================
 * 	// Data set up
 *			Neuron N1, N2, N3;
 *			vecCon MyvecCon;
 *			std::vector<int> result;
 *
 *			N1.setId(10);
 *			N2.setId(20);
 *			N3.setId(30);
 *
 *			ConSharedPtr ptCon( new Con(&N1, 1.13) );  	// Create new Con and initialize ptCon
 *			MyvecCon.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N2, 2.22) );		// create new Con and assign to ptCon
 *			MyvecCon.push_back(ptCon);				// push_back
 *			ptCon.reset(  new Con(&N3, 3.33) );		// create new Con and assign to ptCon
 *			MyvecCon.push_back(ptCon);				// push_back
 *
 *	// Test
 *			MyvecCon.show() ;
 *			MyvecCon.validate();
 *			result=MyvecCon.getFromId();
 *
 *	// Now result is a vector that contains the values 10, 20 and 30.
 * \endcode
 *
 * \sa getWeight and the unit test files, e.g. runit.Cpp.vecCon.R, for further examples.
 */
std::vector<int>  vecCon::getFromId() {
	std::vector<int> result;
	result.reserve(numOfCons());
	for(std::vector<ConSharedPtr>::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{ result.push_back((*itr)->getFromId()); }
	return result;
}



//! Builds Con objects and appends them to ldata.
/*!
 * This function provides a convenient way of populating a vecCon object by building and apending Con objects to ldata.
 * \param FROM  A vector of smart pointers to the neurons to be used in the Con::from fields
 * \param WEIGHT A vector of values to be set in the Con::weight fields
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<int> result;
 *		vecCon MyvecCon;
 *		std::vector<NeuronSharedPtr> vNeuron;
 *		std::vector<double> vWeight;
 *
 *
 *	// Test
 *		NeuronSharedPtr ptNeuron( new Neuron(11) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(22) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(33) );
 *		vNeuron.push_back(ptNeuron);
 *
 *		vWeight.push_back(12.3);
 *		vWeight.push_back(1.2);
 *		vWeight.push_back(2.1);
 *
 *		MyvecCon.buildAndAppend(vNeuron, vWeight);
 *
 *		result=MyvecCon.getFromId();
 *
 *	// Now result is a vector that contains the values 11, 22 and 32.
 * \endcode
 *
 * \sa append and the unit test files, e.g. runit.Cpp.vecCon.R, for further examples.
 */
bool vecCon::buildAndAppend	( std::vector<NeuronSharedPtr> FROM, std::vector<double> WEIGHT){
	BEGIN_RCPP
	if (FROM.empty()) { throw std::range_error("[vecCon::append]: Error, FROM is empty"); }
	if (FROM.size() != WEIGHT.size() ) { throw std::range_error("[vecCon::buildAndAppend]: Error, FROM.size() != WEIGHT.size()"); }
	ldata.reserve(ldata.size() + FROM.size());
	ConSharedPtr ptCon;
	std::vector<double>::iterator itrWEIGHT = WEIGHT.begin();
	for(  std::vector<NeuronSharedPtr>::iterator itrFROM=FROM.begin();  itrFROM != FROM.end();	itrFROM++ , itrWEIGHT++)	{
	 		ptCon.reset(  new Con( *itrFROM, *itrWEIGHT) );
	 		ldata.push_back(ptCon);
	}
	return true;
	END_RCPP
}




//! Getter of the weight field of the Con objects related to vecCon
/*!
 * This function provides a convenient way of getting the values of the weight field of those Con object pointed to by the smart pointer stored in the vecCon object.
 * \return A numeric (double) vector with the weights
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<double> result;
 *		vecCon MyvecCon;
 *		std::vector<NeuronSharedPtr> vNeuron;
 *		std::vector<double> vWeight;
 *
 *
 *	// Test
 *		NeuronSharedPtr ptNeuron( new Neuron(11) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(22) );
 *		vNeuron.push_back(ptNeuron);
 *		ptNeuron.reset( new Neuron(33) );
 *		vNeuron.push_back(ptNeuron);
 *
 *		vWeight.push_back(12.3);
 *		vWeight.push_back(1.2);
 *		vWeight.push_back(2.1);
 *
 *		MyvecCon.buildAndAppend(vNeuron, vWeight);
 *
 *		result=MyvecCon.getWeight();
 *
 *	// Now result is a vector that contains the values 12.3, 1.2 and 2.1 .
 * \endcode
 *
 * \sa getFromId and the unit test files, e.g. runit.Cpp.vecCon.R, for further examples.
 */
std::vector<double>	vecCon::getWeight ( ) {
	std::vector<double> result;
	result.reserve(numOfCons());
	for(std::vector<ConSharedPtr>::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{ result.push_back((*itr)->getWeight()); }
	return result;
}


//! Setter of the weight field of the Con objects related to vecCon
/*!
 * This function provides a convenient way of setting the values of the weight field of those Con objects pointed to by the smart pointer stored in the vecCon object.
 *
 * \param w A numeric (double) vector with the weights to be set in the Con objects contained in the vecCon object.
 *
 * \return true in case no exception is thrown
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<double> result;
 *			int ids[]= {1, 2, 3};
 *			double weights[] = {12.3, 1.2, 2.1 };
 *			vecCon MyvecCon;
 *			std::vector<NeuronSharedPtr> vNeuron;
 *			std::vector<double> vWeight;
 *			NeuronSharedPtr ptNeuron;
 *
 *			for (int i=0; i<=2; i++) {
 *			ptNeuron.reset( new Neuron(ids[1]) );
 *	 		vNeuron.push_back(ptNeuron);
 *			vWeight.push_back(0);					// weights are set to 0
 *			}
 *			MyvecCon.buildAndAppend(vNeuron, vWeight);
 *			MyvecCon.show();
 *
 *			for (int i=0; i<=2; i++) {
 *				vWeight.at(i)=weights[i];
 *			}
 *	// Test
 *			MyvecCon.setWeight(vWeight);			// weights are set to 12.3, 1.2 and 2.1
 *			result=MyvecCon.getWeight();
 *
 *	// Now result is a vector that contains the values 12.3, 1.2 and 2.1 .
 *
 * \endcode
 *
 * \sa getWeight and the unit test files, e.g. runit.Cpp.vecCon.R, for further examples.
 */
bool vecCon::setWeight (std::vector<double> vWeight)  {
	BEGIN_RCPP
	if (vWeight.empty()) { throw std::range_error("[ C++ vecCon::setWeight]: Error, vWeight is empty"); }
	if (vWeight.size() != ldata.size() ) { throw std::range_error("[C++ vecCon::setWeight]: Error, vWeight.size() != ldata.size()"); }
	std::vector<double>::iterator itrWeight = vWeight.begin();
	for(std::vector<ConSharedPtr>::iterator itr = ldata.begin();   itr != ldata.end();   itr++, itrWeight++)	{
		(*itr)->setWeight( *itrWeight );
	}
	return true;
	END_RCPP
}





//! Getter of the from field of the Con objects related to vecCon
/*!
 * This function provides a convenient way of getting the values of the weight field of those Con object pointed to by the smart pointer stored in the vecCon object.
 *
 * \return An std::vector<NeuronSharedPtr> with the pointer to the incoming neurons.
 *
 * \code
 * 	//================
 * 	//Usage example:
 * 	//================
 *	// Data set up
 *		std::vector<double> result;
 *		int ids[]= {1, 2, 3};
 *		double weights[] = {12.3, 1.2, 2.1 };
 *		vecCon MyvecCon;
 *		std::vector<NeuronSharedPtr> vNeuron;
 *		std::vector<double> vWeight;
 *		NeuronSharedPtr ptNeuron;
 *
 *			for (int i=0; i<=2; i++) {
 *				ptNeuron.reset( new Neuron(ids[i]) );
 *				vNeuron.push_back(ptNeuron);
 *				vWeight.push_back(weights[i]);
 *			}
 *			MyvecCon.buildAndAppend(vNeuron, vWeight);
 *		// Test
 *			vNeuron=MyvecCon.getFromNeuron();
 *			for (int i=0; i<=2; i++) {
 *				result.push_back(vNeuron.at(i)->getId());
 *			}
 *
 *	// Now result is a vector that contains the values 1, 2 and 3 .
 *
 * \endcode
 *
 * \sa getFromId and the unit test files, e.g. runit.Cpp.vecCon.R, for further examples.
 */
std::vector<NeuronSharedPtr> vecCon::getFromNeuron 	( ) {
	std::vector<NeuronSharedPtr> result;
	result.reserve(numOfCons());
	for(std::vector<ConSharedPtr>::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{
		result.push_back((*itr)->getFromNeuron());
	}
	return result;
}




bool	vecCon::setFromNeuron	( std::vector<NeuronSharedPtr> vFrom){
	BEGIN_RCPP
		if (vFrom.empty()) { throw std::range_error("[ C++ vecCon::setFromNeuron]: Error, w is empty"); }
		if (vFrom.size() != ldata.size() ) { throw std::range_error("[C++ vecCon::setFromNeuron]: Error, w.size() != ldata.size()"); }
		std::vector<NeuronSharedPtr>::iterator itrFrom = vFrom.begin();
	/*	for(std::vector<ConSharedPtr>::iterator itr = ldata.begin();   itr != ldata.end();   itr++, itrFrom++)	{
			(*itr)->setFromNeuron( *itrFrom );
		}
	*/
		return true;
		END_RCPP
}



/*				erase = function(FROM, ...) {
					fromIds <- getFromId(...)
					delIds  <- seq(along=fromIds)[fromIds %in% FROM]
					if (length(delIds)>0) {
						ldata <<- ldata[-delIds]
					}
				},

				select=function(FROM, ...){
					fromObject <- getFromId(...)
					myMatch <- match(FROM,  fromObject)
					if (any(is.na(myMatch))) {stop("[listCon select Error]: Your FROM vector contains values that were not found by the .self$getFrom() call.")}
					idx <- seq(along=ldata) [- myMatch]
					selfClone <- copy(shallow=FALSE)
					selfClone$delete(FROM=fromObject[idx])
					return(selfClone)
				},


validate=function(...){
					'Object validator for internal coherence.
							'
					lapply(ldata, function(x){if (!is(x,"Con")) {stop("[listAMORE validate]: Element is not an AMORElistElement")}  })
					if (anyDuplicated(lapply(ldata, function(x){x$getFrom(...)}))>0) {stop("[listCon: Validation] Con@from duplication error")} else {}
					lapply(ldata, function(x){x$validate(...)})
					return(TRUE)
 *
 *
 */


//! Internal Object validator
/*! This method checks the object for internal coherence.
 *  This method calls the validate method for each element in ldata,
 * \sa The unit test files, e.g., runit.Cpp.vecCon.R, for usage examples.
 */
/*
bool vecCon<>::validate() {
	BEGIN_RCPP
	std::vector<int> vIds;
	for(typename std::vector< boost::shared_ptr<T>  >::iterator itr = ldata.begin();   itr != ldata.end();   itr++)	{
		(*itr)->validate();
		vIds.push_back( (*itr)->getFromId() )
	}
	unique(vIds)
	return true;
	END_RCPP
};
*/
//! Object validator
/*! This method checks the object for internal coherence.
 *  A try / catch mechanism exits normal execution and returns control to the R terminal in case the contents of the vecCon object are identified as corrupted.
 * \return true in case the checks are Ok.
 * \throw An std::range error if weight or from are not finite.
 */


