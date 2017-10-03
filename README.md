# runCS.R
R function to run CIRCUITSCAPE from an R console on Mac/Linux

## Description

This R function will return a "resistance" matrix as a `dist` object provided a raster and a set of points are specfied. The raster needs to be a `RasterLayer` object read using the R package [raster](https://cran.r-project.org/web/packages/raster/index.html). The points can be given as `matrix` objects with "x" and "y" coordinates or as a `SpatialPoints*` object (see R package [sp](https://cran.r-project.org/web/packages/sp/index.html)). The script will not check if the `RasterLayer` and the `SpatialPoints` objects are in the same coordinate system, so please ensure that they are.

## Dependencies

This script has only been tested on Mac/linux and was designed to run on a Unix-based [CIRCUITSCAPE](http://www.circuitscape.org/downloads) installation. This means that the `csrun.py` program should be in directory found in the `$PATH` variable; for example, `/usr/local/bin`. The script also requires that the `raster` and `sp` packages are installed.

### Install package dependencies:

    install.packages(c("raster","sp"))
    
### Source the code
    
    source("https://raw.githubusercontent.com/santiagosnchez/runCS/master/runCS.R")
    # the R code will need to be sourced every time a new session is opened.
    
### Run the code

    resistance <- runCS(layer, points)
    # "layer" needs to be a RasterLayer object and 
    # "points" a xy matrix or a SpatialPoints object
    
## Suggestions

* Make sure that cell sizes in the raster have the same width/length ratio. For example, if working on a UTM system the resolution should be something like `c(1000,1000)`.
    
      r <- layer
      res(r) <- 1000
      layer2 <- resample(layer, r)

* Make sure that you only have one coordinate point per cell. So if you have multiple points per cell, choose only one.

      r <- rasterize(layer, points)
      xy <- rasterToPoints(r)
      xy <- xy[ order(xy[,3]), ]
      rownames(xy) <- xy[,3]
      xy <- xy[,-3]


