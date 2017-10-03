# runCS.R
R function to run CIRCUITSCAPE from an R console on Mac/Linux

## Description

This R function will return a "resistance" matrix as a `dist` object provided a raster and a set of points are specfied. The raster needs to be a `raster` object read using the R package [raster](https://cran.r-project.org/web/packages/raster/index.html). The points can be given as `matrix` objects with "x" and "y" coordinates or as a `SpatialPoints*` object (see R package [sp](https://cran.r-project.org/web/packages/sp/index.html)). The script will not check if the `raster` and the `SpatialPoints` objects are in the same coordinate system, so please ensure that the are.

## Dependencies

This script has only been tested on Mac/linux and was designed to run on a Unix-based [CIRCUITSCAPE](http://www.circuitscape.org/downloads) installation.
