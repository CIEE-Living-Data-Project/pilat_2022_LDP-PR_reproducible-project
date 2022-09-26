##very short R script to create some new directories and folders for better file structure
##written by Olivia Rahn 26/09/2022

#creating folders for scripts, outputs, manuscript, cleaned and raw data
getwd()
dir.create("data/raw")
dir.create("Data/cleaned")
dir.create("manuscript")
dir.create("output")
dir.create("scripts")

#save this file to the scripts folder