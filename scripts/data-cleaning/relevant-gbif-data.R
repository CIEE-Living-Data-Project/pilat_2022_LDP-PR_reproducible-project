
#get the columns that are relevant for mapping saskatoon's distribution
gbif_data_relevant <- gbif_data$data[ , c("decimalLongitude", "decimalLatitude","occurrenceStatus")]

view(gbif_data_relevant)
head(gbif_data_relevant)
class(gbif_data_relevant)
class(gbif_data)

setNames(gbif_data_relevant, c("long","lat","occurrence"))

#the relevant data are now in a dataframe, save it as a .csv file in the raw data folder
write.csv(gbif_data_relevant, file = "data/raw/gbif-saskatoon-occurrences.csv")
