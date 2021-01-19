shinyUI(dashboardPage(

    # Application title
    dashboardHeader(title = "Forces of Gentrification: Nashville, 2000-2010"),
    
    # Sidebar
    dashboardSidebar(
        # Create selector for gentrification status
        # selectInput(
        #     "gentrification_status",
        #     h4("Show t:"),
        #     choices = stat_choices,
        #     selected = stat_choices[1]
        # ),
        # Create a selector input for the statistic
        # selectInput(
        #     "gentrification_status",
        #     h4("Show t:"),
        #     choices = stat_choices,
        #     selected = stat_choices[1]
        # )
        ),
    
    # Body
    dashboardBody(
        # Set the dashboard theme
        shinyDashboardThemes(theme = "grey_light"),
        
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
