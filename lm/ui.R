
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  

    titlePanel("Build Linear Regression Model for MPG"),
    

    sidebarLayout(
        sidebarPanel(
            checkboxGroupInput('predictors', 'Select Predictors:',
                               names(mtcars[,-1])),
            submitButton("Build Linear Model")

        ),
    
        mainPanel(
            h2("Linear Regression Model:"), 
            verbatimTextOutput("linearModel"),

            br(),
            h3("Coefficients:"),
            tableOutput("coef_table"),
            h3("P-Value of F-statistic: "), 
            verbatimTextOutput("pValue"),
            h3("Model Plots:"),
            plotOutput("plot")
               
        )
    )
))
