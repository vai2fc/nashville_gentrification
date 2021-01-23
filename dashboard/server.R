server <- function(input, output, session) {
    
    #Create a map for gentrification
    output$map_2000 <- renderLeaflet({
        nash_map <- leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>%
            setView(lng=-86.7410562, lat=36.1682906, zoom = 9.5) %>%
            addPolygons(data = holc,
                        fillColor = ~holc_pal(holc_grade),
                        #color = "#FF7F50", # you need to use hex colors
                        fillOpacity = holc_hide(),
                        weight = 0,
                        smoothFactor = 0.2,
                        popup = holc$holc_grade) %>% 
            addPolygons(data = tract_2000,
                        fillColor = ~gent_pal(tract_2000$Gentrification_Status),
                        #color = "#FF7F50", # you need to use hex colors
                        fillOpacity = gent_hide(),
                        weight = 0,
                        smoothFactor = 0.2) %>% 
                        #popup = holc$holc_grade)
                        
            addPolygons(data=tract_2000,
                        weight=2,
                        #col = 'red',
                        fillColor = 'red',
                        fillOpacity = 0,
                        color = 'black',
                        layerId = tract_2000$TRACTCE00,
                        popup = tract_2000$TRACTCE00)

        for (i in 1:nrow(tornadoes)) 
            nash_map <-
                nash_map %>%
                addPolylines(lat=c(tornadoes[i,]$slat,tornadoes[i,]$elat),
                             lng=c(tornadoes[i,]$slon,tornadoes[i,]$elon),
                             popup = tornadoes[i,]$date, opacity = tornado_hide())
        
        nash_map
        

    })
    # observeEvent(input$map_2000_shape_click, {
    #     output$map_2000_id<-renderText(as.character(input$map_2000_shape_click$id))
    # })
    
    
    # Create a map for the 2010 census data
    output$map_2010 <- renderLeaflet({
        nash_map <- leaflet() %>%
            addProviderTiles("CartoDB.Positron") %>%
            setView(lng=-86.7410562, lat=36.1682906, zoom = 9.5) %>% 
            addPolygons(data = holc,
                        fillColor = ~holc_pal(holc_grade),
                        #color = "#FF7F50", # you need to use hex colors
                        fillOpacity = holc_hide(),
                        weight = 0,
                        smoothFactor = 0.2,
                        popup = holc$holc_grade) %>% 
            
            addPolygons(data = tract_2010,
                        fillColor = ~gent_pal(tract_2010$Gentrification_Status),
                        #color = "#FF7F50", # you need to use hex colors
                        fillOpacity = gent_hide(),
                        weight = 0,
                        smoothFactor = 0.2) %>% 
            #popup = holc$holc_grade)
            
            addPolygons(data=tract_2010,
                        weight=2,
                        #col = 'blue',
                        fillColor = 'blue',
                        fillOpacity = 0,
                        color = 'black',
                        layerId = tract_2010$TRACTCE10,
                        popup = tract_2010$GEOID10)
        
        for (i in 1:nrow(tornadoes)) 
            nash_map <-
                nash_map %>%
                addPolylines(lat=c(tornadoes[i,]$slat,tornadoes[i,]$elat),
                             lng=c(tornadoes[i,]$slon,tornadoes[i,]$elon),
                             popup = tornadoes[i,]$date, opacity = tornado_hide())
        nash_map
    })
    
    #Create a map for the HOLC data
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
    

    holc_hide <- reactive(
                if(input$holc == TRUE){
                    0.5
                }
                else {
                    0
                }
    )
    tornado_hide <- reactive(
                if(input$tornado == TRUE){
                    1
                }
                else {
                    0
                }
    )

    gent_hide <- reactive(
        if(input$gent_score == TRUE){
            0.5
        }
        else {
            0
        }
    )
    
}