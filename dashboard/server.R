server <- function(input, output, session) {
    
    output$map <- renderLeaflet({
        nash_map <- leaflet() %>%
            leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>%
            setView(lng=-86.7410562, lat=36.1682906, zoom = 11) %>% 
            addPolygons(data=tract_2000,
                        weight=4,
                        col = 'red',
                        popup = tract_2000$TRACTCE00) %>% 
            addPolygons(data=tract_2010,
                        weight=2,
                        col = 'blue',
                        popup = tract_2010$GEOID10) %>% 
            addPolygons(data = holc,
                        fillColor = ~holc_pal(holc_grade),
                        #color = "#FF7F50", # you need to use hex colors
                        fillOpacity = 0.5, 
                        weight = 0, 
                        smoothFactor = 0.2,
                        popup = holc$holc_grade)
        
        for (i in 1:nrow(tornadoes)) 
            nash_map <-
                nash_map %>%
                addPolylines(lat=c(tornadoes[i,]$slat,tornadoes[i,]$elat),
                             lng=c(tornadoes[i,]$slon,tornadoes[i,]$elon),
                             popup = tornadoes[i,]$date)
        nash_map
    })
    
}