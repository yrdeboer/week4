library(shiny)
library(leaflet)

server <- function(input, output, session) {
     
    ## Here we put the first map
    lat0 <- 52.3714529
    lng0 <- 4.9461885
    
    N <- 100
    df0 <- data.frame(
        lat = rnorm(N, lat0, 2),
        lng = rnorm(N, lng0, 2))
    
    output$mymap <- renderLeaflet({
        
        df0 %>% leaflet() %>%
            addTiles(
                options = providerTileOptions(noWrap = TRUE)
            ) %>%
            addMarkers(
                clusterOptions = markerClusterOptions()
            )
    })

    ## On slider update
    sd.degrees <- reactive({
        input$sd.degrees
    })
   
    ## On click
    observeEvent(input$mymap_click, {

        lat0 <- input$mymap_click$lat
        lng0 <- input$mymap_click$lng
        sd.degr <- sd.degrees()
        
        N <- 100
        df0 <- data.frame(
            lat = rnorm(N, lat0, sd.degr),
            lng = rnorm(N, lng0, sd.degr))
        
        output$mymap <- renderLeaflet({
            
            df0 %>% leaflet() %>%
                addTiles(
                    options = providerTileOptions(noWrap = TRUE)
                ) %>%
                addMarkers(
                    clusterOptions = markerClusterOptions()
                )
        })
        
        latlng.str <- sprintf('Last click: lat = %.4f lng = %.4f, sd = %.2f degrees',
                              lat0,
                              lng0,
                              sd.degr)
        output$latlng <- renderText(latlng.str)
    })
    
}
