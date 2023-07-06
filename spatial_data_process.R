### Some Code For Working with Spatial Data ###

{
library(tidyverse)
library(readxl)
library(sf)
library(mapview)
library(tmap)
}

## Read in table of coordinates and make spatial data

# Read data
dat <- read_csv("dat/Nolan_2023_planned_DDH_collars.csv")
dat

# Make sf
dat_sf <- dat %>% 
  st_as_sf(coords = c("Easting", "Northing"), crs = 26907)

mapview(dat_sf)
# or
tmap_mode("view")
tm_shape(dat_sf) +
  tm_dots()


# CRS ref
# UTM Zone 7N = 26907



# Export
st_write(dat_sf, "dat/nolan_drill_holes.kml")
