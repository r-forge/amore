#pragma once
/// class NeuralNetwork - 
class NeuralNetwork {
  // Attributes
protected:
  LayerPtr d_inputLayer;
  boost::shared_ptr< Container< LayerPtr > > d_hiddenLayers;
  LayerPtr d_outputLayer;
  // Operations
public:
  void show ();
  bool validate ();
};

