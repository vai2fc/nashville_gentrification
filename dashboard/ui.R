shinyUI(fluidPage(theme = shinytheme("sandstone"),
    
    navbarPage("Gentrifying Nashville",

    # Application title

    tabPanel("Introduction",
        mainPanel(
            fluidRow(
            column(12,
            includeMarkdown("pages/home.md")
            ))
        )
    ),
    
    tabPanel("Visualizing Gentrification",

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            h4('Select map layer(s):'),
            checkboxInput('gent_score', 'Gentrification Score', TRUE),
            h5('The Gentrification Score layer draws on US Census Bureau data to visualize demographic changes and susceptibility to gentrification between 2000 and 2010. The methodology is outlined on the Context & Caveats tab.'),
            h6('Scores are as follows:
               0 (pale yellow): "Not susceptible to gentrification",
               1: "susceptible to gentrification", and
               2-5 (orange to red): "1+ factors of gentrification identified"'),
            checkboxInput('holc', 'HOLC Neighborhoods', FALSE),
            h5('The HOLC Neighborhoods layer draws on the georectified 1935-1940 HOLC neighborhood risk maps from the University of Richmond Mapping Inequality Project to visualize how communities have historically had access to financial resources.'),
            h6('Historical HOLC grades are as follows:
               A (green): "Best",
               B (blue): "Still Desirable",
               C (yellow): "Definitely Declining",
               D (red): "Hazardous"'),
            checkboxInput('tornado', 'Tornado Tracks', FALSE),
            h5('The Tornado Tracks layer utilizes NOAA data to map where tornadoes of different magnitudes have struck the middle TN region between 1990 and 2018.'),
            h6('The popups on each tornado specify the date they occurred, as well as the Enhanced Fujita scale magnitude (a measure of tornado severity and impact ranging from 0 (low) to 5 (high).'),
            # Create checkbox for demographics
            selectInput(
                "demographic",
                h4("Select demographic statistic to visualize:"),
                choices = c("Race/Ethnicity" = "race",
                            "Monthly Rent" = "rent",
                            "Yearly Income" = "income",
                            "Educational Attainment" = "education"),
                multiple = FALSE
            ),
            h5('The demographic statistics above are derived from the 2000 Decennial Census and 2010 ACS 5-year Estimate datasets. See the Credits & Contact tab for additional data source information.')


        )
    ,
    
    # Body
    mainPanel(
        # # Set the dashboard theme
        # shinyDashboardThemes(theme = "grey_light"),
        
                fluidRow(
                    # Left Map for 2000 data
                    column(width = 6,
                        box(title = "2000",
                            width = NULL,
                            leafletOutput("map_2000"))
                    ),
                    # Right Map for 2010 data
                    column(width = 6,
                        box(title = "2010",
                            width = NULL,
                            leafletOutput("map_2010")),
                        textOutput("map_2000_id")
                    )
                ),
                fluidRow(
                    column(width = 6,
                           box(width = NULL,
                               plotOutput("bar_2000")
                           )),
                    column(width = 6,
                           box(width = NULL,
                               plotOutput("bar_2010")
                           ))
                )
        )
        
    )
    ),
    tabPanel("Context & Caveats",
             mainPanel(
                 fluidRow(
                     column(12,
                            includeMarkdown("pages/methods.md")
                     ))
             )
    ),
    
    tabPanel("Credits & Contact",
             mainPanel(
                 fluidRow(
                     column(12,
                            includeMarkdown("pages/references.md")
                     ))
             )
    )
)
))
