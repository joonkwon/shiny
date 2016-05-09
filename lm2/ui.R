
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  

    titlePanel("Build Linear Regression Model for MPG"),
    

    sidebarLayout(
        sidebarPanel(
            width=3,
            checkboxGroupInput('predictors', 'Select Predictors:',
                               names(mtcars[,-1])),
            submitButton("Build Linear Model")

        ),
    
        mainPanel(
            width=9,
            h2("Overview"),
            p("This application will build a simple linear regression model using", strong("mtcars"), 
              "dataset. You can select predictiors on the left panel and the application wiill build",  "
              a linear regression model with those as the predictiors",
              "and MPG (Miles Per Gallon) as the outcome."),
            p("The result will show the model formula, statistics of coefficients, F-statistic of the model", 
              "and model plots.", "These outputs will help in selecting predictros for linear regression."),
            h2("Instruction"),
            p("On the left panel, select columns dataset that you want to use as", 
              "the predictors from mtcars and then click \"Build Linear Model\" button."),
            p("The result will be displayed below."),
            br(),
    
            h2("Linear Regression Model"), 
            verbatimTextOutput("linearModel"),

            h4("Coefficients:"),
            tableOutput("coef_table"),
            h4("P-Value of F-statistic:"), 
            verbatimTextOutput("pValue"),
            h4("R-Squared:"),
            verbatimTextOutput("rsquared"),
            h4("Model Plots:"),
            plotOutput("plot")
               
        )
    )
))
