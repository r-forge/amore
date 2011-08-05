#include "package.h"
#include "classHeaders/NetworkRinterface.h"


RCPP_MODULE(modAMORE)
  {
    class_<NetworkRinterface>( "NetworkRinterface" )
    .constructor()
    .method( "createFeedForwardNetwork",        &NetworkRinterface::createFeedForwardNetwork )
    .method( "createCustomFeedForwardNetwork",  &NetworkRinterface::createCustomFeedForwardNetwork )
    .method( "predict",                         &NetworkRinterface::predict )
    .method( "inputSize",                       &NetworkRinterface::inputSize )
    .method( "outputSize",                      &NetworkRinterface::outputSize )
    .method( "show",                            &NetworkRinterface::show )
    .method( "validate",                        &NetworkRinterface::validate )
    ;
  }
;
