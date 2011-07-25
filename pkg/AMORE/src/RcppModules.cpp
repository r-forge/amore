
RCPP_MODULE(mod_AMORE)
  {
    class_<NetworkRinterface>( "NetworkRinterface" )
    .constructor()
    .method( "show", &NetworkRinterface::show )
    .method( "createFeedForwardNetwork", &NetworkRinterface::createFeedForwardNetwork )
    ;
  }
;
