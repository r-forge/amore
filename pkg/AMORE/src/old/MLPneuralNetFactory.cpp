MLPneuralNet
CreateMLPneuralNet(std::vector<int> numberOfNeuronsPerLayer)
{

  net = new MLPNeuralNet();

  MLPlayerPtr mlpLayerPtr;

  std::vector<int> idx;

foreach (int n, numberOfNeuronsPerLayer)
  {
    for (int i=1; i<=n; ++i)
      {
        idx.push_back(i);
      }
    mlpLayerPtr.reset(new MLPlayer( idx ) );
    net.nLayers.push_back(mlpLayerPtr);
  }



for (int i=1; i<=; ++i)
  {

    mlpPtr->buildAndAppend();

  }

}
