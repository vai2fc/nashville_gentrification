ui <- fluidPage(
    
    # Page title
    titlePanel("Nashville Gentrification Map"),
    
    # Sidebar with controls
    sidebarLayout(sidebarPanel
                  (selectInput
                      (inputId = 'variable',
                          label = 'Choose a variable',
                          choices = c('yes', 'no')
                        )
    ),
    
    # Leaflet map
    mainPanel(leafletOutput
                (outputId = 'map')
                )
    )
)

shinyApp(ui = ui, server = server)