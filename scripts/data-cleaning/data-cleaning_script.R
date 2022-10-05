#Some new additions by Emily Black
#Sept 29 2022
#install some new packages for looking at spatial data
pkgs <- c("sp", "terra", "tmap", "sf", "spData")
install.packages
lapply(pkgs, library, character.only = TRUE)
rm(pkgs)

#get the columns that are relevant for mapping saskatoon's distribution
#since these are presence data, we can get rid of the occurrence status column
#select only the longitude and latitude columns
gbif_data_relevant <- gbif_data$data[ , c("decimalLongitude", "decimalLatitude")]

#check the data to confirm only the relevant columns are included
view(gbif_data_relevant)
head(gbif_data_relevant)

#check the class of the data to make sure it's a dataframe for analysis
class(gbif_data_relevant)

#Turn the points into spatial points data frame
#Essentially, this turns coordinates into spatial points that can be mapped\
#according to longitude and latitude with other spatial elements
coords <- gbif_data_relevant %>%
  dplyr::select(decimalLongitude, decimalLatitude)
sask_points <- SpatialPointsDataFrame(coords = coords, data = gbif_data_relevant,
                               proj4string = CRS("+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"))

#Plot the data to make sure everything worked
plot(sask_points)


#Get Saskatchewan shape
#The mapCan one wasn't generating a spatially compatible file
#This is a zip file of Canada geometry I uploaded a while ago
unzip("data/canada_maps.zip")
canada <- read_sf("gpr_000a11a_e.shp")
names <- c("Saskatchewan")
sask_vector <- canada %>%
  dplyr::filter(PRENAME %in% names)

#Plot it in tmap to show where in saskatchewan these are
tmap_mode("view") #set to interactive viewing
tm_shape(sask_vector$geometry)+ #add the shape of saskatchewan
  tm_borders(col="black", lwd=1)+ #plot saskatchewan as a black polygon
  tm_shape(sask_points)+ #add saskatoon berry observations
  tm_dots(size =0.1, #plot as saskatoon-coloured dots
             col = "#5d2b48", 
          shape = 21)

#By the way - this website has a lot of tree cover and species-specific info!
#It might be helpful: 
#https://ftp.maps.canada.ca/pub/nrcan_rncan/Forests_Foret/canada-forests-attributes_attributs-forests-canada/2011-attributes_attributs-2011/
#You can download them as a .tif file, and work with them as "rasters"

#the relevant data are now in a dataframe, save it as a .csv file in the clean data folder
write.csv(gbif_data_relevant, file = "data/clean/gbif-saskatoon-occurrences.csv")
