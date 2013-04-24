#include "package.h"
#include "classHeaders/NetworkRinterface.h"


RCPP_MODULE(AMOREcpp)
  {
    class_<NetworkRinterface>( "NetworkRinterface" )
    .constructor()
    .method( "createFeedForwardNetwork",        &NetworkRinterface::createFeedForwardNetwork            )
    .method( "createCustomFeedForwardNetwork",  &NetworkRinterface::createCustomFeedForwardNetwork      )
    .method( "sim",                             &NetworkRinterface::sim                                 )
    .method( "train",                           &NetworkRinterface::train                               )
    .method( "inputSize",                       &NetworkRinterface::inputSize                           )
    .method( "outputSize",                      &NetworkRinterface::outputSize                          )
    .method( "show",                            &NetworkRinterface::show                                )
    .method( "validate",                        &NetworkRinterface::validate                            )
    ;
  }
;
