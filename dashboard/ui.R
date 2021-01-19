shinyUI(dashboardPage(

    # Application title
    dashboardHeader(title = "Forces of Gentrification: Nashville, 2000-2010"),
    
    # Sidebar
    dashboardSidebar(
        div(class = "sidebar", "2010 Stats"),
        # Create selector for gentrification status
        selectInput(
            "gentrification_status",
            h4("How gentrified was an area in 2010?"),
            choices = c("", "Gentrified", "Susceptible", "Not Gentrified", "Unknown"),
            selected = ""
        ),
        # Create slider for race/ethnicity
        sliderInput(
            "race_ethnicity",
            h4("What percent of the population identify as people of color?"),
            min = 0,
            max = 100,
            value = 30
        ),
        # Create slider for educational attainment
        sliderInput(
            "education",
            h4("What percent of the population 25+ held a bachelor's degree?"),
            min = 0,
            max = 100,
            value = 40
        ),
        # Create slider for income
        sliderInput(
            "income",
            h4("What is the average household income?"),
            min = 0,
            max = 250000,
            value = 45000
        ),
        # Create slider for rent
        sliderInput(
            "rent",
            h4("What is the average rent?"),
            min = 0,
            max = 5000,
            value = 1500
        )
    ),
    
    # Body
    dashboardBody(
        # Set the dashboard theme
        shinyDashboardThemes(theme = "grey_dark"),
        
        # Create some tabs
        tabsetPanel(
            tabPanel("Demographic Data",
            # Create boxes to style each plot
                fluidRow(
                    # Left Map for 2000 data
                    column(width = 6,
                        box(width = NULL,
                        leafletOutput("map_2000"))
                    ),
                    # Right Map for 2010 data
                    column(width = 6,
                        box(width = NULL,
                        leafletOutput("map_2010"))
                    )
                )
            ),
            
            tabPanel("Historical and Natural Forces",
                     # Create boxes to style each plot
                     fluidRow(
                         # Left Map for 2000 data
                         column(width = 6,
                                box(width = NULL,
                                    leafletOutput("holc_map"))
                         ),
                         # Right Map for 2010 data
                         column(width = 6,
                                box(width = NULL,
                                    leafletOutput("tornado_map"))
                         )
                     )
            )
        )
        
        
    )
))
