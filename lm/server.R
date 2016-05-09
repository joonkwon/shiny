library(shiny)

buildFormula = function(predictors) {
    paste(c("mpg", paste(predictors, collapse = " + ")), collapse = " ~ ")
}

shinyServer(function(input, output) {
   
    output$linearModel = renderText({
        n_predictors = length(input$predictors)
        if (n_predictors != 0 ) {
            paste(c("lm(", buildFormula(input$predictors), ")"))
        }
    })
    
    output$coef_table = renderTable({
        n_predictors = length(input$predictors)
        if (n_predictors != 0 ) {
            lm.fit = lm(buildFormula(input$predictors), data=mtcars)
            summary(lm.fit)
        }
    })
    output$pValue = renderText({
        n_predictors = length(input$predictors)
        if (n_predictors != 0 ) {
            lm.fit = lm(buildFormula(input$predictors), data=mtcars)
            fs = summary(lm.fit)$fstatistic
            pf(fs[1], fs[2], fs[3], lower.tail = FALSE)
        }
    })

    output$plot = renderPlot({
        n_predictors = length(input$predictors)
        if (n_predictors != 0 ) {
            lm.fit = lm(buildFormula(input$predictors), data=mtcars)
            par(mfrow=c(2,2))
            plot(lm.fit)
        }
    })    
})
