
library(shiny)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  

    headerPanel("Pick Predictors"),
    

    sidebarPanel(
        checkboxGroupInput('predictors', 'Select Predictors',
                           names(mtcars[,-1])),
                           
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
)