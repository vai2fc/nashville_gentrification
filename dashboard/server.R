server <- function(input, output) {
    
    output$map <- renderLeaflet({
        
        leaflet() %>%  addTiles() %>% 
            setView(lng=-86.7410562, lat=36.1682906, zoom = 11)
        
    })
    
}

shinyApp(ui = ui, server = server)