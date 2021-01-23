# Context, Credits, and Caveats

### Background
When I first set out to explore and visualize patterns of gentrification in Nashville, TN, I came across a 2018 paper by Rachel Bogardus Drew entitled "[Gentrification: Framing Our Perceptions](https://www.enterprisecommunity.org/resources/gentrification-framing-our-perceptions-7602)." Drew's paper helped orient me to the history and historiography of gentrification and drew my attention to the diversity of perspectives on what constitutes gentrification in the modern American city.

The [Mapping Inequality](https://dsl.richmond.edu/panorama/redlining/#loc=5/39.542/-94.58) project, led by Robert K. Nelson of the University of Richmond Digital Scholarship Lab, was also helpful for gaining an historical perspective on government-sponsored red-lining of US neighborhoods in the 1930s. Having previously tried my hand at georectifying historical maps, I can say with confidence that there are simply not enough accolades for the work the team did to create high-quality, open-access shapefiles out of dozens of historic maps. The team's work sets the stage for the chilling story of just how deeply-rooted and *systemic* racial bias and inequities are in the US - and it seems that [their work has just begun](https://dsl.richmond.edu/socialvulnerability/).

Finally, this project is borne as much from a desire to look forward as it is to look back. The morning after the [March 2-3, 2020 tornadoes](https://en.wikipedia.org/wiki/Tornado_outbreak_of_March_2%E2%80%933,_2020) swept through middle Tennessee, I walked through my neighborhood and was overwhelmed by the sheer breadth and depth of destruction wrought on so many communities in a single night. I began to wonder what would happen to all of the people displaced by the tornadoes - and who would *be able to* return and rebuild. Richard Florida's 2019 write-up of [recent research on how Hurricane Katrina drove widespread gentrification and displacement of black residents in New Orleans](https://www.bloomberg.com/news/articles/2019-02-12/new-orleans-gentrification-tied-to-hurricane-katrina) was a particularly influential piece in my early research on the topic of gentrification in Nashville.

### Methods

The quantitative definition of gentrification applied in the *Forces of Gentrification: Nashville, 2000-2010* project is a hybrid of two widely-recognized scholarly definitions. The first comes from [Bostic & Martin's 2003 paper](https://journals.sagepub.com/doi/10.1080/0042098032000136147) in which they examine gentrification across 50 US metropolitan areas' between 1970 and 2000. The second comes from [Ellen & Ding's 2016](https://www.huduser.gov/portal/periodicals/cityscpe/vol18num3/guest.pdf) assessment of gentrification in major metropolitan areas between 1980 and 2010. The current project's hybrid approach was driven, in part, by the availability of open-source data, but also by a desire to define clear heuristics of gentrification that can be explored independently on this dashboard.

To identify areas that are susceptible to gentrification, I apply Bostic & Martin's (2003) definition: any tract whose median income is less than 50% of the metropolitan area's median income is considered at risk. In 2000, approximately XX% of Nashville's census tracts would have been considered susceptible to gentrification based on this criterion.

To identify areas that have been gentrified, I apply Ellen and Ding's (2016) definition: a tract is considered gentrified if it sees a 10+ percentage point increase in tract-to-county ratio of average household income, share of white residents, share of college-educated residents, or median rent. Given that Ellen and Ding suggest that gentrification can be quantified by any one of these four metrics, I have added a "strength of gentrification" indicator to the data on this dashboard to illustrate how many of these four gentrification indicators have changed by 10+ percentage points in relation to the county average between 2000 and 2010.

The code for this app, as well as for the API calls and data cleaning, are available in [this GitHub Repo](https://github.com/vai2fc/nashville_gentrification).

### Data Sources
The data for the *Forces of Gentrification: Nashville, 2000-2010* project were collected from the following sources:
* 2000 demographic data were retrieved from the US Census Bureau's [Decennial Census, Summary File 3 API](https://www.census.gov/data/datasets/2000/dec/summary-file-3.html)
* 2010 demographic data were retrieved from the US Census Bureau's [5-year American Community Survey API](https://www.census.gov/data/developers/data-sets/acs-5year/2010.html)
* Tornado data were downloaded from the National Oceanic and Atmospheric Administration data repository on [Oasis Hub](https://oasishub.co/dataset/usa-tornado-historical-tracks-noaa)
* The georectified 1935-1940 HOLC map of Nashville's neighborhoods was downloaded from the University of Richmond Digital Scholarship Lab's [Mapping Inequality](https://dsl.richmond.edu/panorama/redlining/#loc=11/36.053/-86.8&city=nashville-tn&text=downloads) project website

### R Libraries and Tools
Not all heroes wear capes - some write R code and share it with the world. I would like to acknowledge the creators of the following R packages in particular for making this project feasible:
* [censusapi](https://cran.r-project.org/web/packages/censusapi/vignettes/getting-started.html)
* [leaflet](https://rstudio.github.io/leaflet/)
* [mapview](https://r-spatial.github.io/mapview/)
* [raster](https://cran.r-project.org/web/packages/raster/index.html)
* [sf](https://cran.r-project.org/web/packages/sf/index.html)
* [shinythemes](https://rstudio.github.io/shinythemes/)
* The [tidyverse](https://www.tidyverse.org/) collection of packages

### Caveats
There are a [multitude of ways to define 'gentrification'](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7241805/). Taking a quantitative approach based on US Census data, and utilizing the methods outlined above to identify susceptible and gentrified tracts, is a 

### Personal Acknowledgements
Last but not least, thank you to my amazing colleagues and instructors in the Data Science 4 cohort at Nashville Software School for their patience, good humor, and bug-squashing expertise. Thanks are owed to my long-suffering partner, too, for commiserating about data cleaning all while offering constructive feedback on the project. Any remaining bugs, errors, and questionable design choices are my own.

*Veronica Ikeshoji-Orlati*  
*January 2021*