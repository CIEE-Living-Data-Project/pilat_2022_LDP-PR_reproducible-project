#get the columns that are relevant for mapping saskatoon's distribution
#since these are presence data, we can get rid of the occurrence status column
#select only the longitude and latitude columns
gbif_data_relevant <- gbif_data$data[ , c("decimalLongitude", "decimalLatitude")]

#check the data to confirm only the relevant columns are included
view(gbif_data_relevant)
head(gbif_data_relevant)

#check the class of the data to make sure it's a dataframe for analysis
class(gbif_data_relevant)

#the relevant data are now in a dataframe, save it as a .csv file in the clean data folder
write.csv(gbif_data_relevant, file = "data/clean/gbif-saskatoon-occurrences.csv")
