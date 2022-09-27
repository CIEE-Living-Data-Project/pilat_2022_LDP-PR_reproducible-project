#install and load required packages
library(groundhog) #for package version controlling
#use groundhog.library to load packages and keep track of which version you used
groundhog.library('prereg', '2022-09-12') #to create a project preregistration
groundhog.library('markdown', '2022-09-12') #for creating documents and manuscripts
groundhog.library('tinytex', '2022-09-12') #for getting a .csl file in markdown
groundhog.library('tidyverse', '2022-09-12') #for cleaning up datasets
groundhog.library('rgbif', '2022-09-12') #for loading data from GBIF
groundhog.library('ggplot2', '2022-09-12') #for plotting and analysis

getwd()

#create a folder for data, scripts, analytic outputs, and literature
dir.create("data/")
dir.create("scripts/")
dir.create("outputs/")
dir.create("literature/")

#create subfolders for raw and clean data within the data folder
dir.create("data/raw")
dir.create("data/clean")

#create subfolders for different codes within the scripts folder
dir.create("scripts/data-download")
dir.create("scripts/outputs")
dir.create("scripts/manuscript")

#create a directory for the data source
dir.create("")

data.dest.file <- "/Users/hannahpilat/Documents/UBCO/Living Data Project/Productivity-reproducibility"
metadata.dest.file <- "/Users/hannahpilat/Documents/UBCO/Living Data Project/Productivity-reproducibility"

#create an object for the GBIF data for the species of interest
saskatoon_occ <- ("Amelanchier alnifolia")

# download GBIF occurrence records within a specified window of coordinates:
#list coordinates small first, large second
gbif_data <- occ_data(scientificName = saskatoon_occ, hasCoordinate = TRUE, limit = 20000,
                      decimalLongitude = "-110,-103", decimalLatitude = "52, 56")  

#take a look at the downloaded data
view(gbif_data)
head(gbif_data)

#get the columns that are relevant for mapping saskatoon's distribution
gbif_data_relevant <- gbif_data$data[ , c("decimalLongitude", "decimalLatitude","occurrenceStatus")]
head(gbif_data_relevant)
class(gbif_data_relevant)

#the relevant data are now in a dataframe, save it as a .csv file in the raw data folder
write.csv(gbif_data_relevant, file = "data/raw/gbif-saskatoon-occurrences.csv")


