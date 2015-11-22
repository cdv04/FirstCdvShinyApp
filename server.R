library(shiny)
library(datasets)
library(xtable)


mpgPred<-function(WT) 37.28-5.34*WT


# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$mpgPlot <- renderPlot({
    plot(as.formula(formulaText()), 
         data = mtcars, col=factor(cyl, levels=c("4", "6", "8")), main=formulaText(), pch=16, cex=2)
    legend ("topright" ,c("cylinder=4", "cylinder=6","cylinder=8"), text.col=c(1:3))
  })
  output$inputValue <- renderPrint({input$WT})
  output$prediction <- renderPrint({mpgPred(input$WT)})
})