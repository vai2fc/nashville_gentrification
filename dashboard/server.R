server <- function(input, output, session) {
    
    # Create a map for gentrification
    output$map_2000 <- renderLeaflet({
        nash_map <- leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>%
            setView(lng=-86.7410562, lat=36.1682906, zoom = 9.5) %>% 
            addPolygons(data=tract_2000,
                        weight=2,
                        col = 'red',
                        popup = tract_2000$TRACTCE00)
        
        nash_map
    })
    
    # Create a map for the 2010 census data
    output$map_2010 <- renderLeaflet({
        nash_map <- leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>%
            setView(lng=-86.7410562, lat=36.1682906, zoom = 9.5) %>% 
            addPolygons(data=tract_2010,
                        weight=2,
                        col = 'blue',
                        popup = tract_2010$GEOID10)
        nash_map
    })
    
    # Create a map for the HOLC data
    output$holc_map <- renderLeaflet({
        nash_map <- leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>%
            setView(lng=-86.7410562, lat=36.1682906, zoom = 9.5) %>% 
            addPolygons(data = holc,
                        fillColor = ~holc_pal(holc_grade),
                        #color = "#FF7F50", # you need to use hex colors
                        fillOpacity = 0.5, 
                        weight = 0, 
                        smoothFactor = 0.2,
                        popup = holc$holc_grade)
        nash_map
    })
    
    # Create a map for tornadoes and floods
    output$tornado_map <- renderLeaflet({
        nash_map <- leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>%
            setView(lng=-86.7410562, lat=36.1682906, zoom = 9.5)
        
        for (i in 1:nrow(tornadoes)) 
            nash_map <-
                nash_map %>%
                addPolylines(lat=c(tornadoes[i,]$slat,tornadoes[i,]$elat),
                             lng=c(tornadoes[i,]$slon,tornadoes[i,]$elon),
                             popup = tornadoes[i,]$date)
        nash_map
    })
    
}