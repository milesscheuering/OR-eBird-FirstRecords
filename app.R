#install.packages("shiny")
setwd("C:/Users/miles/Box/Classes/Data Visualization/Week 10/OR-Counties")
library(shiny)
library(bslib)

birdData <- read_csv("birdData.csv")

# Define UI for app that draws a histogram ----
ui <- page_sidebar(
  # App title ----
  title = "Assignment 4!",

  # Output: Histogram ----
  plotOutput(outputId = "distPlot")
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    ggplot(birdData) +
      geom_vline(xintercept = c(-123.8,-122.2),  linewidth = 1) +
      geom_point(aes(longitude,elevation, fill = elevation), shape =21) +
      xlim(-125,-116) +
      annotate(geom = "text", -124.5, 10000, label = "Coast") +
      annotate(geom = "text", -123, 10000, label = "West\nSide") +
      annotate(geom = "text", -120, 10000, label = "East Side") +
      scale_fill_gradientn(colors = terrain.colors(100), "Elevation") +
      labs(x = "Longitude",
           y = "Elevation",
           title = "How does elevation of a record vary across region?") +
      theme_bw()
    
  })
  
}
shinyApp(ui = ui, server = server)
