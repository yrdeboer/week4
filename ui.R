library(shiny)

## This app is well documented,
## please see here: https://yrdeboer.shinyapps.io/week4_assignment/

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
