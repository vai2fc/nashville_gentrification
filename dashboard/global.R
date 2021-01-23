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

# Order Things
bar_order_edu = c('No schooling completed',
                  'Nursery to 4th grade',
                  '5th and 6th grade',
                  '7th and 8th grade',
                  '9th grade',
                  '10th grade',
                  '11th grade',
                  '12th grade no diploma',
                  'High school graduate (includes equivalency)',
                  'Some college 1 or more years no degree',
                  'Some college less than 1 year',
                  'Associate degree',
                  'Bachelors degree',
                  'Masters degree',
                  'Professional school degree',
                  'Doctorate degree')
bar_order_income = c('Less than $10000',
                     '$10000 to $14999',
                     '$25000 to $29999',
                     '$30000 to $34999',
                     '$35000 to $39999',
                     '$40000 to $44999',
                     '$45000 to $49999',
                     '$50000 to $59999',
                     '$60000 to $74999',
                     '$75000 to $99999',
                     '$100000 to $124999',
                     '$125000 to $149999',
                     '$15000 to $19999',
                     '$150000 to $199999',
                     '$20000 to $24999',
                     '$200000 or more')
bar_order_rent = c('Monthly - Less than $100',
                   'Monthly - $100 to $149',
                   'Monthly - $150 to $199',
                   'Monthly - $200 to $249',
                   'Monthly - $250 to $299',
                   'Monthly - $300 to $349',
                   'Monthly - $350 to $399',
                   'Monthly - $400 to $449',
                   'Monthly - $450 to $499',
                   'Monthly - $500 to $549',
                   'Monthly - $550 to $599',
                   'Monthly - $600 to $649',
                   'Monthly - $650 to $699',
                   'Monthly - $700 to $749',
                   'Monthly - $750 to $799',
                   'Monthly - $800 to $899',
                   'Monthly - $900 to $999',
                   'Monthly - $1000 to $1249',
                   'Monthly - $1250 to $1499',
                   'Monthly - $1500 to $1999',
                   'Monthly - $2000 or more')