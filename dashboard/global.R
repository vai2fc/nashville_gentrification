library(shiny)
library(shinydashboard)
library(leaflet)
library(sf)
library(dashboardthemes)
library(markdown)
library(shinythemes)
library(treemap)
library(leafpop)
library(sp)
library(tidyverse)

# Read in the HOLC map shapefile
holc <- st_read("data/HOLC_BNA_shape_files/cartodb-query.shp")
holc <- st_transform(holc, CRS("+proj=longlat +datum=WGS84"))

# Read in the 2000 census tract shapefile
tract_2000 <- st_read("data/2000_census_tract_map/tl_2010_47037_tract00.shp")
tract_2000 <- st_transform(tract_2000, CRS("+proj=longlat +datum=WGS84 +no_defs"))
tract_2000_gent_status <- read_csv("data/tract_2000_gent_status.csv")
tract_2000 <- left_join(tract_2000, tract_2000_gent_status[,c('tract','Susceptible','Gentrification_Status')], by = c('TRACTCE00' = 'tract'))


# Read in the 2010 census tract shapefile
tract_2010 <- st_read("data/2010_census_tract_map/tl_2010_47037_tract10.shp")
tract_2010 <- st_transform(tract_2010, CRS("+proj=longlat +datum=WGS84 +no_defs"))
tract_2010_gent_status <- read_csv("data/tract_2010_gent_status.csv")
tract_2010 <- left_join(tract_2010, tract_2010_gent_status[,c('tract','Susceptible','Gentrification_Status')], by = c('TRACTCE10' = 'tract'))


# Read in tornado dataframe
tornadoes <- read_csv("data/tornadoes_for_mapping.csv")

# Gentrification status selector
gent_2010 <- tract_2010

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

bins <- c(0, 1, 2, 3, 4, 5)
gent_pal <- colorBin("YlOrRd", domain = tract_2010$Gentrification_Status, bins = bins)


holc_pal <- colorFactor(
  palette = c('#4ca64c', '#4d4dff', '#ffff7f', '#ff1a1a'),
  domain = holc$holc_grade
)

