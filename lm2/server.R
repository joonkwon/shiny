library(shiny)

buildFormula = function(predictors) {
    paste(c("mpg", paste(predictors, collapse = " + ")), collapse = " ~ ")
}

shinyServer(function(input, output) {
    lmModel <- reactive({
        if (length(input$predictors) != 0 ) {
            lm(buildFormula(input$predictors), data=mtcars)
        }
    })
    output$linearModel = renderText({
        if (length(input$predictors) != 0 ) {
            paste(c("lm(", buildFormula(input$predictors), ")"))
        }
    })
    output$coef_table = renderTable({
        if (length(input$predictors) != 0 ) {
            summary(lmModel())$coefficients
        }
    })
    output$pValue = renderText({
        if (length(input$predictors) != 0 ) {
            fs = summary(lmModel())$fstatistic
            pf(fs[1],fs[2],fs[3], lower.tail = FALSE)
        }
    })
    output$plot = renderPlot({
        if (length(input$predictors) != 0 ) {
            par(mfrow=c(2,2))
            plot(lmModel())
        }
    })    
})
