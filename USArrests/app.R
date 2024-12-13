#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("USArrests Data Visualization"),
  
  # Sidebar layout with dropdown menu
  sidebarLayout(
    sidebarPanel(
      selectInput("variable", 
                  "Select a variable to visualize:",
                  choices = setdiff(colnames(USArrests), "UrbanPop"),
                  selected = "Assault")
    ),
    
    # Main panel for displaying the plot and summary statistics
    mainPanel(
      plotOutput("scatterPlot"),
      
      # Text output to display summary statistics
      verbatimTextOutput("summaryStats")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  output$scatterPlot <- renderPlot({
    # Extract selected variable
    y <- USArrests[[input$variable]]
    x <- USArrests$UrbanPop  # Urban Population as the default x-axis
    
    # Create the scatterplot
    plot(x, y,
         xlab = "Urban Population",
         ylab = input$variable,
         main = paste(input$variable, "vs Urban Population"),
         col = "cadetblue", pch = 20)
  })
  
  # Render summary statistics
  output$summaryStats <- renderPrint({
    selected_data <- USArrests[[input$variable]]
    cat("Summary Statistics for", input$variable, ":\n")
    cat("----------------------------\n")
    cat("Mean:", mean(selected_data, na.rm = TRUE), "\n")
    cat("Median:", median(selected_data, na.rm = TRUE), "\n")
    cat("Standard Deviation:", sd(selected_data, na.rm = TRUE), "\n")
    cat("----------------------------\n")
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
