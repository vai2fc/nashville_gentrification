# Forces of Gentrification: Nashville, 2000-2010
### Introduction
Welcome to the GitHub repo for the [Forces of Gentrification: Nashville, 2000-2010](https://vai2fc.shinyapps.io/Forces_of_Gentrification_Nashville_TN_2000-2010/) R Shiny application. The [app](https://vai2fc.shinyapps.io/Forces_of_Gentrification_Nashville_TN_2000-2010/) is intended to offer visitors an interactive visualiation of how historic redlining of neighborhoods and natural disasters correlate with patterns of gentrification in Nashville, TN between 2000 and 2010.

The application enables visitors to compare the demographics of Nashville's neighborhoods in 2000 and 2010 at the US census tract level. In addition, it allows visitors to overlay historical maps from the [Home Owners' Loan Corporation](https://dsl.richmond.edu/panorama/redlining/#loc=5/39.542/-94.58) (georectified and curated by the University of Richmond Digital Scholarship Lab) and middle Tennessee tornado tracks (based on the [NOAA's data](https://oasishub.co/dataset/usa-tornado-historical-tracks-noaa)) to explore spatial correlations between patterns of gentrification and historical and natural forces.

### Repo Map
In this repo, you will find three data cleaning and exploration files:
* [01_get_census_data.Rmd](https://github.com/vai2fc/nashville_gentrification/blob/main/01_get_census_data.Rmd) contains the code used to retrieve [2000 Decennial Census](https://www.census.gov/data/datasets/2000/dec/summary-file-3.html) and [2010 American Community Survey 5-year](https://www.census.gov/data/developers/data-sets/acs-5year/2010.html) data from the US Census Bureau API.
* [02_data_cleanup.Rmd](https://github.com/vai2fc/nashville_gentrification/blob/main/02_data_cleanup.Rmd) contains the scripts for cleaning the demographic data for the project.
* [03_map_geospatial_and_demographic_data.Rmd](https://github.com/vai2fc/nashville_gentrification/blob/main/03_map_geospatial_and_demographic_data.Rmd) contains some exploratory mapping to prepare the layers utilized in the app.

In addition, there are two folders:
* The [dashboard](https://github.com/vai2fc/nashville_gentrification/tree/main/dashboard) folder contains the code for the app but not the data. See the [references.md](https://github.com/vai2fc/nashville_gentrification/blob/main/dashboard/pages/references.md) file for the data sources.
* The [data](https://github.com/vai2fc/nashville_gentrification/blob/main/data/schema.xlsx) folder contains an excel file which specifies the variables that were retrieved from the US Census Bureau APIs.

### Credits
The data sources for the [Forces of Gentrification: Nashville, 2000-2010](https://vai2fc.shinyapps.io/Forces_of_Gentrification_Nashville_TN_2000-2010/) project are linked on the `Credits & Contacts` page of the app itself. Additional context and resources may be found in the [slide deck](https://github.com/vai2fc/nashville_gentrification/blob/main/Nashville_Forces_of_Gentrification_Presentation.pdf) presented at the Nashville Software School Data Science Cohort 4 Mid-Course Demo Day on January 23, 2021.