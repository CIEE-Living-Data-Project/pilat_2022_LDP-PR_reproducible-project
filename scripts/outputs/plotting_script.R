world <- map_data("world")

sask_map <- mapcan(boundaries = province,
                   province = SK,
                   type = standard) %>% 
  ggplot(data = sask_map, mapping = aes(x = long, y = lat)) +
  geom_polygon(data = sask_map, mapping = aes(fill = "grey75", 
                                              colour = "black", size = 0.2)) +
  geom_point(data = gbif_data_relevant, aes(x = decimalLongitude, y = decimalLatitude, 
             alpha = 0.5, size = 2, colour = "forestgreen")) +
  ggtitle("Amelanchier alnifolia occurrences in central Saskatchewan")
sask_map
class(sask_map)
class(saskatoon_occ)

# add better labels
p <- p + labs(x = 'Longitude', y = 'Latitude') 
p
p <-
  ggplot(penguins) +
  geom_point(aes(bill_length_mm, bill_depth_mm, color = species))
p


p 


view(gbif_data_relevant)
