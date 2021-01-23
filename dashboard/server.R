server <- function(input, output, session) {
    
    # Create a map for gentrification
    output$map_2000 <- renderLeaflet({
        nash_map <- leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>%
            setView(lng=-87.0654323, lat=36.186314, zoom = 9.5) %>%
            addPolygons(data=tract_2000,
                        weight=2,
                        col = 'red',
                        layerId = tract_2000$TRACTCE00,
                        popup = tract_2000$TRACTCE00)
        
        nash_map
    })
    
    # Create a map for the 2010 census data
    output$map_2010 <- renderLeaflet({
        nash_map <- leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>%
            setView(lng=-87.0654323, lat=6.186314, zoom = 9.5) %>% 
            addPolygons(data = holc,
                        fillColor = ~holc_pal(holc_grade),
                        #color = "#FF7F50", # you need to use hex colors
                        fillOpacity = 0.5,
                        weight = 0,
                        smoothFactor = 0.2,
                        popup = holc$holc_grade) %>% 
            addPolygons(data=tract_2010,
                        weight=2,
                        col = 'blue',
                        layerId = tract_2010$TRACTCE10,
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
        tornado_map <- leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>%
            setView(lng=-86.7410562, lat=36.1682906, zoom = 9.5)
        
        for (i in 1:nrow(tornadoes)) {
            tornado_map <-
                tornado_map %>%
                addPolylines(lat=c(tornadoes[i,]$slat,tornadoes[i,]$elat),
                             lng=c(tornadoes[i,]$slon,tornadoes[i,]$elon),
                             popup = paste("Date:", tornadoes[i,]$date, "<br>",
                                           "Magnitude:", tornadoes[i,]$mag, "EF"))
        }
        tornado_map
    })
    
    map_data_2000 <- reactive({
        if (input$demographic == "race"){
            tract_race_2000
        }
        else if (input$demographic == "income"){
            tract_income_2000
        }
        else if (input$demographic == "rent") {
            tract_rent_2000
        }
        else {
            tract_education_2000
        }
    })
    
    map_data_2000_filter <- reactive({
        req(input$map_2000_shape_click$id)
        map_data_2000() %>% 
            filter(tract == input$map_2000_shape_click$id)
    })
    
    
    output$bar_2000 <- renderPlot({
        
        map_data_2000_filter() %>%
            ggplot( aes(x=Measure, y=Percent)) +
            geom_bar(stat="identity")
    })
    
    
    
    map_data_2010 <- reactive({
        if (input$demographic == "race"){
            tract_race_2010
        }
        else if (input$demographic == "income"){
            tract_income_2010
        }
        else if (input$demographic == "rent") {
            tract_rent_2010
        }
        else {
            tract_education_2010
        }
    })
    
    map_data_2010_filter <- reactive({
        req(input$map_2010_shape_click$id)
        map_data_2010() %>% 
            filter(tract == input$map_2010_shape_click$id)
    })
    
    
    output$bar_2010 <- renderPlot({
        
        map_data_2010_filter() %>%
            ggplot( aes(x=Measure, y=Percent)) +
            geom_bar(stat="identity")
    })
    
}