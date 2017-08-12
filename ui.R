library(shiny)

ui <- fluidPage(
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("sd.degrees",
                        "Standard deviation in degrees:",
                        min = 0.01,
                        max = 10,
                        value = 1,
                        step = .01)
        ),
        mainPanel(
            
            leafletOutput("mymap"),
            textOutput('latlng')
        )
    )
)
