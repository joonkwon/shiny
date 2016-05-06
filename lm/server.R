library(shiny)

buildFormula = function(predictors) {
    pds = NULL
    for ( i in 1:length(predictors)) {
        if (i == 1) { pds = paste("mpg ~ ", predictors[i]) }
        else { pds = paste(pds, " + ", predictors[i]) }
    }
    pds
}

shinyServer(function(input, output) {
   
    output$text1 = renderText({
        input$predictors
    })
    getLm = reactive({
        n_predictors = length(input$predictors)
        lm.fit = NULL
        if (n_predictors != 0) {
            lm.fit = lm(buildFormula(input$predictors), data=mtcars)
        }
        lm.fit
    })
    
    output$coef_table = renderTable({
        if (length(input$predictors) != 0) {
            summary(lm.fit())$coefficients
        }

    })
    # output$coef_table = renderTable({
    #     n_predictors = length(input$predictors)
    #     if (n_predictors != 0 ) {
    #         lm.fit = lm(buildFormula(input$predictors), data=mtcars)
    #         summary(lm.fit)$coefficients
    #     }
    # }) 
    
})
