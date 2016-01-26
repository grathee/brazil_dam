# Necessary imports
library(raster)

# Source necessary R scripts
source('R/preprocessing.R')

# Extents of the needed areas
ext_sea <- extent(338265,444828,-2219221,-2123875)
ext_river <- extent(204819, 392250, -2177909, -2078672)
ext_br <- extent(635305, 780405, -2259121,-2138545)
ext_br_zoom <- extent(648078,731153,-2258406,-2221620)
band_names <- c("band1", "band2", "band3", "band4", "band5", "band6" ,"band7", "fmask")

### Sea Before ###
sea_b <- crop_image('LC82150742015254LGN00_sea_before', band_names, ext_sea, "data/bricks/sea_b.grd")
### Sea After ###
sea_a <- crop_image('LC82150742015334LGN00_sea_after', band_names, ext_sea, "data/bricks/sea_a.grd")
### River Before ###
river_b <- crop_image('LC82160732015277LGN00_river_before', band_names, ext_river, "data/bricks/river_b.grd")
### River After
river_a <- crop_image('LC82160732015341LGN00_river_after', band_names, ext_river, "data/bricks/river_a.grd")
### Bento Rodrigues Before ###
br_b <- crop_image('LC82170742015284LGN00_br_before', band_names, ext_br, "data/bricks/br_b.grd")
### Bento Rodrigues After ###
br_a <- crop_image('LC82170742015316LGN00_br_after',band_names, ext_br, "data/bricks/br_a.grd")
### Bento Rodrigues Zoom Before ###
br_b_zoom <- crop_image('LC82170742015284LGN00_br_before', band_names, ext_br_zoom, "data/bricks/br_b_zoom.grd")
### Bento Rodrigues Zoom After ###
br_a_zoom <- crop_image('LC82170742015316LGN00_br_after', band_names, ext_br_zoom, "data/bricks/br_a_zoom.grd")
