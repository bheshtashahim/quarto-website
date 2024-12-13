#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)
library(plotly)
library(datasets)

# Convert the time-series dataset to a data frame with proper column names
data(uspop)

# Create a data frame with 'year' and 'pop' columns
uspop_df <- data.frame(
  year = time(uspop),
  pop = as.numeric(uspop)
)

# Define UI
ui <- fluidPage(
  titlePanel("U.S. Population Data Visualization"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Select a Year:", choices = unique(uspop_df$year), selected = 1970)
    ),
    
    mainPanel(
      plotlyOutput("scatterPlot"),
      plotOutput("linePlot"),
      verbatimTextOutput("summaryStats")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Filter data based on the selected year
  filtered_data <- reactive({
    subset(uspop_df, year == input$year)
  })
  
  # Interactive Scatter Plot using Plotly
  output$scatterPlot <- renderPlotly({
    p <- ggplot(uspop_df, aes(x = year, y = pop)) +
      geom_point(color = "deeppink4", size = 3) +
      labs(title = "Population Data Over Time")
    
    ggplotly(p)  # Make it interactive with Plotly
  })
  
  # Line Plot showing population trends over time
  output$linePlot <- renderPlot({
    ggplot(uspop_df, aes(x = year, y = pop)) +
      geom_line(color = "darkolivegreen3", size = 1.2) +
      labs(title = "U.S. Population Trend Over Time")
  })
  
  # Output summary statistics
  output$summaryStats <- renderPrint({
    data <- filtered_data()
    cat("\nPopulation Statistics for Year", input$year, "\n")
    cat("--------------------------------------\n")
    cat("Mean Population:", mean(data$pop), "\n")
    cat("Standard Deviation:", sd(data$pop), "\n")
  })
}

# Run the Shiny application
shinyApp(ui, server)
