# ui <- fluidPage(
#     leafletOutput("map")
# )

shinyUI(dashboardPage(
    skin = "blue",

    # Application title
    dashboardHeader(title = "Forces of Gentrification: Nashville, 2000-2010"),

    # Sidebar
    dashboardSidebar(
        #
        # # Create a selector input for the statistic
        # selectInput(
        #     "stat",
        #     h4("Choose your desired statistic:"),
        #     choices = stat_choices,
        #     selected = stat_choices[1]
        # )
    ),

    # Body
    dashboardBody(
        tabsetPanel(
            tabPanel("Main Tab",
                     # Create boxes to style each plot
                     fluidRow(
                         # Left plot with the bar graph for the base dataset
                         column(width = 12,
                                box(width = NULL,
                                    leafletOutput("map")
                                )
                         )
                     )
            )
        )
    )
)
)
