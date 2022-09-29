#install and load required packages
library(groundhog) #for package version controlling
#use groundhog.library to load packages and keep track of which version you used
groundhog.library('prereg', '2022-09-12') #to create a project preregistration
groundhog.library('markdown', '2022-09-12') #for creating documents and manuscripts
groundhog.library('tinytex', '2022-09-12') #for getting a .csl file in markdown
groundhog.library('tidyverse', '2022-09-12') #for cleaning up datasets
groundhog.library('rgbif', '2022-09-12') #for loading data from GBIF
groundhog.library('ggplot2', '2022-09-12') #for plotting and analysis
groundhog.library('sf', '2022-09-12') #for plotting and analysis
groundhog.library('raster', '2022-09-12')
groundhog.library('geodata', '2022-09-12')
groundhog.library('mapcan', '2022-09-12') #for getting provincial boundary data
groundhog.library('remotes', '2022-09-12')

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
dir.create("scripts/data-cleaning")

#create an object for the GBIF data for the species of interest
saskatoon_occ <- ("Amelanchier alnifolia")

# download GBIF occurrence records within a specified window of coordinates:
#list coordinates small first, large second
gbif_data <- occ_data(scientificName = saskatoon_occ, hasCoordinate = TRUE,
                      limit = 20000, decimalLongitude = "-110,-103",
                      decimalLatitude = "52, 56")

#take a look at the downloaded data
view(gbif_data)
head(gbif_data)

#get a map of Saskatchewan from mapcan data by specifying the boundaries of the province
sask_map <- mapcan(boundaries = province,
                   province = SK,
                   type = standard)

