
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  

    titlePanel("Pick Predictors"),
    

    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput('predictors', 'Select Predictors:',
                               names(mtcars[,-1])),
            submitButton("Build Linear Model")

        ),
    
        mainPanel(
            h4("Your selection: ", textOutput("text1", inline=TRUE)),
            tableOutput("coef_table")
        )
    )
))
