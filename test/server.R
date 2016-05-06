library(shiny)

shinyServer(
    function(input, output) {

        output$text1 = renderText({input$goButton})
        output$text2 = renderText({input$text2})
        output$text3 = renderText({
            isolate(paste(input$text1, input$text2))
        })

    }
)
