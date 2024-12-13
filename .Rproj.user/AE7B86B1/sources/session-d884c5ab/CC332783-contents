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
<<<<<<< HEAD
  
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
=======

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
>>>>>>> 0f2355446eb98df9717f6d710f5ae193a735ea31
)

# Define server logic required to draw a histogram
server <- function(input, output) {
<<<<<<< HEAD
  
  output$distPlot <- renderPlot({
    # Get the selected variable data from mtcars
    x <- mtcars[[input$variable]]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # Draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkturquoise', border = 'white',
         xlab = input$variable,
         main = paste("Histogram of", input$variable))
  })
=======

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
>>>>>>> 0f2355446eb98df9717f6d710f5ae193a735ea31
}

# Run the application 
shinyApp(ui = ui, server = server)
