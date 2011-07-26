
RCPP_MODULE(mod_AMORE)
  {
    class_<NetworkRinterface>( "NetworkRinterface" )
    .constructor()
    .method( "createFeedForwardNetwork", &NetworkRinterface::createFeedForwardNetwork )
    .method( "predict",                  &NetworkRinterface::predict )
    .method( "inputSize",                &NetworkRinterface::inputSize )
    .method( "outputSize",               &NetworkRinterface::outputSize )
    .method( "show",                     &NetworkRinterface::show )
    .method( "validate",                 &NetworkRinterface::validate )
    ;
  }
;
