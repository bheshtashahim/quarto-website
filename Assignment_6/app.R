#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Histogram of mtcars Data"),
  
  # Sidebar with a dropdown to select a variable and slider for number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", 
                  "Select variable:",
                  choices = names(mtcars),
                  selected = "mpg"),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 10)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # Get the selected variable data from mtcars
    x <- mtcars[[input$variable]]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # Draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkturquoise', border = 'white',
         xlab = input$variable,
         main = paste("Histogram of", input$variable))
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
