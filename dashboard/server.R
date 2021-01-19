server <- function(input, output, session) {
    
    output$map <- renderLeaflet({
        leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>% 
            setView(lng=-86.7410562, lat=36.1682906, zoom = 11)
    })
    
}