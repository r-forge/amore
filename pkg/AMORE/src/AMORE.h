/*! \mainpage The AMORE++ package
 *
 * \section intro_sec Introduction
 *
 * Here you will find the documentation of the C++ component of the AMORE++ R package.
 * The AMORE++ package is a new version of the publicly available AMORE package for neural network training and simulation under R
 *
 * \section motiv_sec Motivation
 *
 * Since the release of the previous version of the AMORE many things have changed in the R programming world.
 * The advent of the Reference Classes and of packages like Rcpp, inline and RUnit compel us to write a better version of the package in order to provide a more useful framework for neural network training and simulation.
 *
 * \section RoadMap Road Map
 * This project is currently very active and the development team intends to provide a beta version as soon as this summer (2011)
 *
 */


#include <iostream>
#include <sstream>
#include <algorithm>
#include <vector>
#include <Rcpp.h>

using namespace Rcpp;

class Con;
template <typename T> class vecAMORE;
class vecCon;
class Neuron;

#ifndef INLINE_R

#include "Con.cpp"
#include "vecAMORE.cpp"
#include "vecCon.cpp"
#include "Neuron.cpp"

#endif /* INLINE_R_ */

