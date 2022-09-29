#plot the Saskatchewan data and create a polygon to outline and fill the province
ggplot(data = sask_map, mapping = aes(x = long, y = lat)) +
  geom_polygon(data = sask_map, mapping = aes(group = group), fill = "grey75", 
               colour = "black", show.legend = FALSE) +
#next step is to plot the occurrences of saskatoon plants, but need to adjust the...
#coordinate reference system so it's consistent between sask_map and the gbif_data_relevant data
  geom_jitter(data = gbif_data_relevant, aes(x = decimalLongitude, y = decimalLatitude), 
             alpha = 0.5, size = 2, colour = "forestgreen", show.legend = FALSE) +
  labs(x = 'Longitude', y = 'Latitude') + #create more informative axes labels