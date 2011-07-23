#pragma once
/// class NeuralNetwork - 
class NeuralNetwork {
  // Attributes
protected:
  LayerPtr d_inputLayer;
  LayerContainerPtr d_hiddenLayers;
  LayerPtr d_outputLayer;
  // Operations
public:
friend class SimpleNeuralCreator; 
  virtual void show () = 0;
  virtual bool validate () = 0;
protected:
  NeuralNetwork (NeuralFactory& neuralFactory);
};

