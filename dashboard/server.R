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
                        popup = paste("HOLC Neighborhood Score (A-D):", holc$holc_grade)) %>% 
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
                        popup = paste(tract_2000$NAMELSAD00, "<br>",
                                      "Gentrification Score (0-5):", tract_2000$Gentrification_Status))

        for (i in 1:nrow(tornadoes)) 
            nash_map <-
                nash_map %>%
                addPolylines(lat=c(tornadoes[i,]$slat,tornadoes[i,]$elat),
                             lng=c(tornadoes[i,]$slon,tornadoes[i,]$elon),
                             popup = paste("Date:", tornadoes[i,]$date, "<br>",
                                           "Magnitude: EF", tornadoes[i,]$mag),
                             opacity = tornado_hide())
        
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
                        popup = paste("HOLC Neighborhood Score (A-D):", holc$holc_grade)) %>% 
            
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
                        popup = paste(tract_2010$NAMELSAD10, "<br>",
                                      "Gentrification Score (0-5):", tract_2010$Gentrification_Status))
        
        for (i in 1:nrow(tornadoes)) 
            nash_map <-
                nash_map %>%
                addPolylines(lat=c(tornadoes[i,]$slat,tornadoes[i,]$elat),
                             lng=c(tornadoes[i,]$slon,tornadoes[i,]$elon),
                             popup = paste("Date:", tornadoes[i,]$date, "<br>",
                                           "Magnitude: EF", tornadoes[i,]$mag),
                             opacity = tornado_hide())
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
                        popup = paste("HOLC Neighborhood Score (A-D):", holc$holc_grade))
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
                             popup = paste("Date:", tornadoes[i,]$date, "<br>",
                                           "Magnitude: EF", tornadoes[i,]$mag))
        nash_map
    })
    
    map_data_2000 <- reactive({
            if (input$demographic == "race"){
                tract_race_2000
            }
            else if (input$demographic == "income"){
                tract_income_2000$Measure <-
                    factor(tract_income_2000$Measure,
                           levels = bar_order_income)
                tract_income_2000
                
            }
            else if (input$demographic == "rent") {
                tract_rent_2000$Measure <-
                    factor(tract_rent_2000$Measure,
                           levels = bar_order_rent)
                tract_rent_2000
            }
            else {
                tract_education_2000$Measure <-
                    factor(tract_education_2000$Measure,
                           levels = bar_order_edu)
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
                        geom_bar(stat="identity") +
            xlab('') +
            theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
    })
    
    
    
    map_data_2010 <- reactive({
        if (input$demographic == "race"){
            tract_race_2010
        }
        else if (input$demographic == "income"){
            tract_income_2010$Measure <-
                factor(tract_income_2010$Measure,
                       levels = bar_order_income)
            tract_income_2010
        }
        else if (input$demographic == "rent") {
            tract_rent_2010$Measure <-
                factor(tract_rent_2010$Measure,
                       levels = bar_order_rent)
            tract_rent_2010
        }
        else {
            tract_education_2010$Measure <-
                factor(tract_education_2010$Measure,
                       levels = bar_order_edu)
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
            geom_bar(stat="identity") +
            xlab('') +
            theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
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