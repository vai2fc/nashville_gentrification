# Credits

### Background
When I first set out to explore and visualize patterns of gentrification in Nashville, TN, I came across a 2018 paper by Rachel Bogardus Drew entitled "[Gentrification: Framing Our Perceptions](https://www.enterprisecommunity.org/resources/gentrification-framing-our-perceptions-7602)." Drew's paper helped orient me to the history and historiography of gentrification and drew my attention to the diversity of perspectives on what constitutes gentrification in the modern American city.

The [Mapping Inequality](https://dsl.richmond.edu/panorama/redlining/#loc=5/39.542/-94.58) project, led by Robert K. Nelson of the University of Richmond Digital Scholarship Lab, was also helpful for gaining an historical perspective on government-sponsored red-lining of US neighborhoods in the 1930s. Having previously tried my hand with georectifying historical maps, I can say with confidence that there are simply not enough accolades for the work the team did to create high-quality, open-access shapefiles out of dozens of historic maps which tell a chilling story about just how deeply-rooted and *systemic* racial bias and inequities are in the US. Their recent work [mapping historical HOLC grades to Social Vulnerability Indices for census tracts in the 2000s](https://dsl.richmond.edu/socialvulnerability/) speaks to the ...[TODO]

Finally, walking through my own neighborhood after the March 3, 2020 tornadoes ...[TODO] 

### Methods

The quantitative definition of gentrification applied in the *21st century Nashville Gentrification* project is a hybrid of two widely-recognized scholarly definitions. The first comes from Bostic & Martin's 2003 paper in which they examine gentrification across 50 US metropolitan areas' between 1970 and 2000. The second comes from [Ellen & Ding's 2016](https://www.huduser.gov/portal/periodicals/cityscpe/vol18num3/guest.pdf) assessment of gentrification in major metropolitan areas between 1980 and 2010. The current project's hybrid approach was driven, in part, by the availability of open-source data, but also by a desire to define clear heuristics of gentrification that can be explored independently.

To identify areas that are susceptible to gentrification, I apply Bostic & Martin's (2003) definition: any tract whose median income is less than 50% of the metropolitan area's median income is considered at risk. To identify areas that have been gentrified, I apply Ellen and Ding's (2016) definition: a tract is considered gentrified if it sees a 10+ percentage point increase in tract-to-county ratio of average household income, share of white residents, share of college-educated residents, or median rent. In addition, I have added a "strength of gentrification" indicator to the data to illustrate how many of these four gentrification indicators have changed between 2000 and 2010.

### Data Sources
The data for the *21st century Nashville Gentrification* project were collected from the following sources:
* 2000 demographic data were retrieved from the US Census Bureau's [Decennial Census, Summary File 3 API](https://www.census.gov/data/datasets/2000/dec/summary-file-3.html)
* 2010 demographic data were retrieved from the US Census Bureau's [5-year American Community Survey API](https://www.census.gov/data/developers/data-sets/acs-5year/2010.html)
* Tornado data were downloaded from the National Oceanic and Atmospheric Administration data repository on [Oasis Hub](https://oasishub.co/dataset/usa-tornado-historical-tracks-noaa).

### Libraries and Tools
Not all heroes wears capes - some write code. I would like to acknowledge the creators of the following R packages in particular for making this project feasible:
* [censusapi](https://cran.r-project.org/web/packages/censusapi/vignettes/getting-started.html)
* [shinythemes](https://rstudio.github.io/shinythemes/)
* [leaflet](https://rstudio.github.io/leaflet/)
* [mapview](https://r-spatial.github.io/mapview/)
* [raster](https://cran.r-project.org/web/packages/raster/index.html)
* [sf](https://cran.r-project.org/web/packages/sf/index.html)
* The [tidyverse](https://www.tidyverse.org/) collection of packages

### Additional Resources

### Personal Acknowledgements
Last but not least, thank you to my amazing colleagues and instructors in the Data Science 4 cohort at Nashville Software School for their patience, good humor, and bug-squashing expertise. Thanks are owed to my long-suffering partner, too, for listening to many data rants, offering constructive feedback, and delivering remarkably timely and delicious snacks throughout the development process. All remaining bugs, errors, and questionable design choices are my own.

*Veronica Ikeshoji-Orlati*  
*January 2021*