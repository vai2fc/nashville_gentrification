library(shiny)
library(shinydashboard)
library(leaflet)
library(sf)
library(dashboardthemes)
library(markdown)
library(shinythemes)

# Read in the HOLC map shapefile
holc <- st_read("data/HOLC_BNA_shape_files/cartodb-query.shp")
holc <- st_transform(holc, CRS("+proj=longlat +datum=WGS84"))

# Read in the 2000 census tract shapefile
tract_2000 <- st_read("data/2000_census_tract_map/tl_2010_47037_tract00.shp")
tract_2000 <- st_transform(tract_2000, CRS("+proj=longlat +datum=WGS84 +no_defs"))

# Read in the 2010 census tract shapefile
tract_2010 <- st_read("data/2010_census_tract_map/tl_2010_47037_tract10.shp")
tract_2010 <- st_transform(tract_2010, CRS("+proj=longlat +datum=WGS84 +no_defs"))

# Read in tornado dataframe
tornadoes <- read_csv("data/tornadoes_for_mapping.csv")

# Gentrification status selector

# Average household income selector

# Percent with a bachelor's degree selector

# Percent non-Latinx white selector

# Average rent selector