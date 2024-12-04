############################################################################################################
############################################################################################################
############################################################################################################
# Date: Monday, February 1st, 2016 
# By: Cedric Chambru
# Descritpion: code GIS_data_France_1789
# Version of R used: 3.2.1

############################################################################################################
##### Packages installation
############################################################################################################

x <- c("sp", "rgeos", "maptools", "gstat", "rgdal", "lattice", "raster", "raster", "foreign", "ggplot2", "spam",
       "automap", "intamap", "shapefiles", "tiff", "plyr", "GISTools", "geosphere", "curl")
install.packages (x) # warning: this may take a number of minutes
lapply (x, library, character.only = TRUE) # load the required packages

############################################################################################################
##### Load the data
############################################################################################################
rm(list=ls())
setwd("/Path_to_file/france_subdelegation") # set the working directory
subd_shape <- readShapePoly("france_subdelegation.shp") # load the data
plot(subd_shape) # plot the data

############################################################################################################
##### Check the geometry validity of the data
############################################################################################################
gIsValid(subd_shape, byid = TRUE, reason=FALSE) # using gIsValid tool from rgeos package

require(devtools) # using another tool from an experimental R package
install_github("eblondel/cleangeo")
require(cleangeo)
report <- clgeo_CollectionReport(subd_shape)
summary <- clgeo_SummaryReport(report)
issues <- report[report$valid == FALSE,]
issues # no geometry validity errors in the data
