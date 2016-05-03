library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Illustrating Inputs"),
    sidebarPanel(
        numericInput("id1", "Numeric Input Labeled Id1", 0, min=0, max=10, step=1),
        checkboxGroupInput("id2", "Checkbox inputs", 
                           c("checkbox1", "checkbox 2", "checkbox 3")),
        dateInput("date1", "Date:"),
        h3('Sidebar Text')
    ),
    mainPanel(
        h3('Main Panel Text')
    )
))