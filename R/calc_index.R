library(raster)

change <- function(brick_b, brick_a, a, b, func){
	if (func == 'fe'){
		calc_index_before <- overlay(brick_b[[a]],brick_b[[b]], fun=function(x,y){y/x})
		calc_index_after <- overlay(brick_a[[a]], brick_a[[b]], fun=function(x,y){y/x})
		change <- overlay (calc_index_before, calc_index_after, fun=function(x,y){y-x})	
		#plot(change)
		raster_change <- calc(change, fun=function(x){x[x<0.025] <-NA; return(x)})
		} else {
		calc_index_before <- overlay(brick_b[[a]],brick_b[[b]], fun=function(x,y){(y-x)/y})
		calc_index_after <- overlay(brick_b[[a]], brick_a[[b]], fun=function(x,y){(y-x)/y})
		change <- overlay (calc_index_before, calc_index_after, fun=function(x,y){y-x})	
		plot(change)
		raster_change <- calc(change, fun=function(x){x[x<0.55] <-NA; return(x)})
		}
	#newraster <- raster(raster_change, filename=fileName, overwrite=TRUE)
	return(raster_change)
}


