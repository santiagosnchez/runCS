runCS <- function(layer, sites){
	require(raster)
	cls <- cellFromXY(layer, sites)
	if (length(unique(cls)) != length(cls)){
		stop("sites are do not fall within unique cells")
	}
	sites <- rasterize(x = sites,y = layer)
	dir.create("CS")
	writeRaster(sites,"CS/sites_rast.asc",overwrite=TRUE)
	writeRaster(layer,"CS/resis_rast.asc",overwrite=TRUE)
	CS_ini <- c("[circuitscape options]",            
            "data_type = raster",
            "scenario = pairwise",
            paste(c("point_file =",
                    "habitat_file =",
                    "output_file ="),
            paste(c("CS/sites_rast.asc",
                            "CS/resis_rast.asc",
                            "CS/CS.out"))))
	cat(CS_ini, sep="\n", file="CS/myini.ini")
	CS_run <- paste("csrun.py", paste("CS/myini.ini"), paste("&> /dev/null"))
	system(CS_run)
	rdist <- as.dist(read.csv("CS/CS_resistances.out",sep=" ",row.names=1,header=1))
	return(rdist)
}