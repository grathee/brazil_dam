# Import necessary libraries
library(raster)
library(rgdal)

# Preprocessing functions

crop_image <- function(foldername, bandNames, extent, filename) {
  # Path to the folder where the data is located
  folderpath <- file.path('data',foldername)
  
  # Band 8 has a different extent and can therefore not be used. In order to  keep the file (just in 
  # case) we rename it so that it will not be listed when defining the stack.
  out_fn <- file.path(folderpath,"panchromatic_Band_8.TIF")
  fn <- list.files(folderpath, pattern = glob2rx('LC8*_B8.TIF'), full.names = TRUE)
  if (length(fn) != 0) {
    if (file.exists(fn)) file.rename(fn,out_fn)
  }
  
  # Listing landsatPath and cloudmaskPath and appending both together. We do not take all the bands
  # because we do not need band 9, 10, 11 and the BQA band.
  landsatPath <- list.files(folderpath, pattern = glob2rx('LC8*.TIF'), full.names = TRUE)
  cloudmaskPath <- list.files(folderpath, patter = glob2rx('LC8*cfmask.tif'), full.names = TRUE)
  totalPath <- append(landsatPath[3:9],cloudmaskPath)
  
  # Making the stack and giving them proper names
  landsat_stack <- stack(totalPath)
  names(landsat_stack) <- bandNames

  # Crop the image to the desired extent
  brick = crop(landsat_stack,extent,filename, overwrite=TRUE)
  return(brick)
}