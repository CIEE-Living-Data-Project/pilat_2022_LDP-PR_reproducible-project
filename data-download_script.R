#create a folder for data
dir.create("data/")

#create a folder for scripts
dir.create("scripts/")

#create a directory for the data source
dir.create("data/url")
dir.create("data/github")

#create a _README

#install the rgbif package for downloading data from GBIF 
#install ggplot2 for plotting data
#install groundhog package for version controlling
install.packages("rgbif")
install.packages("ggplot2")
install.packages("groundhog")

#load the packages
library(groundhog)
#use groundhog.library instead of library so that package versions are controlled
groundhog.library('rgbif', '2022-09-12')
groundhog.library('ggplot2', '2022-09-12')
groundhog.library('maps', '2022-09-12')
groundhog.library("tidyverse", "2022-09-12")


#create an object for the GBIF data for the species of interest
saskatoon_occ <- ("Amelanchier alnifolia")


# download GBIF occurrence records within a specified window of coordinates:
#list coordinates small first, large second
gbif_data <- occ_data(scientificName = saskatoon_occ, hasCoordinate = TRUE, limit = 20000, decimalLongitude = "-110,-103", decimalLatitude = "52, 56")  # note that coordinate ranges must be specified this way: "smaller, larger" (e.g. "-5, -2")

#take a look at the downloaded data
gbif_data
head(gbif_data)

# setting custom cache location
# https://github.com/ropensci/rdryad/pull/36
rdryad_cache <- rdryad::dryad_get_cache()
rdryad_cache$cache_path_set(full_path = normalizePath("/Users/sam/LDP/PROD_REPRO/Lesson3_tutorial/data/dryad", mustWork = FALSE))
# mustWork = F because path does not (yet) exist
rgbif_cache$cache_path_get()
dryad_download(dois = "https://doi.org/10.15468/dl.g356kv")

# github

dir.create("/Users/hannahpilat/Documents/UBCO/Living Data Project/Productivity-reproducibility/pilat_2022_LDP-PR_reproducible-project")
usethis::create_from_github(repo_spec = "https://github.com/hpilat/pilat_2022_LDP-PR_reproducible-project_repo.git",
                            destdir="/Users/hannahpilat/Documents/UBCO/Living Data Project/Productivity-reproducibility/pilat_2022_LDP-PR_reproducible-project")
system("cp -r /Users/sam/LDP/PROD_REPRO/Beta_div/betadiv-enp/data/* data/github/.")


#Footer
#© 2022 GitHub, Inc.
#Footer navigation
#Terms
#Privacy
#Security
#Status
#Docs
getwd()
