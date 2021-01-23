shinyUI(fluidPage(theme = shinytheme("sandstone"),
    
    navbarPage("Forces of Gentrification",

    # Application title

    tabPanel("About",
        mainPanel(
            fluidRow(
            column(width = 12,
            includeMarkdown("pages/home.md")
            ))
        )
    ),
    
    tabPanel("Maps",

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            # Create selector for demographic for bar chart
            selectInput(
                "demographic",
                h4("Select Demographic Detail To View:"),
                choices = c("",
                            "Race/Ethnicity" = "race",
                            "Educational Achievement" = "education",
                            "Yearly Income" = "income",
                            "Monthly Rent" = "rent"
                            ),
                multiple = FALSE
            ),
        
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
                            leafletOutput("map_2010"))
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
    tabPanel("Credits",
             mainPanel(
                 fluidRow(
                     column(width = 12,
                            includeMarkdown("pages/references.md")
                     ))
             )
    )
)
))
