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

# Create the colorscheme map for the HOLC map
holc_pal <- colorFactor(
  palette = c('#4ca64c', '#4d4dff', '#ffff7f', '#ff1a1a'),
  domain = holc$holc_grade)

# Read in the 2000 census tract shapefile
tract_2000 <- st_read("data/2000_census_tract_map/tl_2010_47037_tract00.shp")
tract_2000 <- st_transform(tract_2000, CRS("+proj=longlat +datum=WGS84 +no_defs"))

# Read in the 2010 census tract shapefile
tract_2010 <- st_read("data/2010_census_tract_map/tl_2010_47037_tract10.shp")
tract_2010 <- st_transform(tract_2010, CRS("+proj=longlat +datum=WGS84 +no_defs"))

# Read in the 1990-2010 tornado dataframe
tornadoes <- read_csv("data/tornadoes_for_mapping.csv")

# Gentrification status selector

# Household income
tract_income_2000 <- read_csv("data/demographics/tract_income_2000.csv")
tract_income_2010 <- read_csv("data/demographics/tract_income_2010.csv")

# Educational Attainment
tract_education_2000 <- read_csv("data/demographics/tract_education_2000.csv")
tract_education_2010 <- read_csv("data/demographics/tract_education_2010.csv")

# Race / Ethnicity
tract_race_2000 <- read_csv("data/demographics/tract_race_2000.csv")
tract_race_2010 <- read_csv("data/demographics/tract_race_2010.csv")

# Rent
tract_rent_2000 <- read_csv("data/demographics/tract_rent_2000.csv")
tract_rent_2010 <- read_csv("data/demographics/tract_rent_2010.csv")
