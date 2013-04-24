#pragma once
// Interface
/// class ActivationFunction - 
class ActivationFunction {
  // Attributes
protected:
  NeuronPtr d_neuron;
  Rcpp::XPtr<CppFunctionPointer> d_f0;
  Rcpp::XPtr<CppFunctionPointer> d_f1;
  // Operations
public:
  ActivationFunction (NeuronPtr neuronPtr, Rcpp::XPtr<CppFunctionPointer> f0, Rcpp::XPtr<CppFunctionPointer> f1);
  double f0 ();
  double f1 ();
protected:
  double getInducedLocalField ();
};

