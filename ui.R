library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  headerPanel("Hi friends, this is my first shiny application ! "),
  #h3(""),
  h4("Using the Motor Trend Car Road Tests dataset,  this application builds scatter plots of Mile Per Gallon values in fonction of a user selected variable
     , displaying cylinder categories with colors;"),
  h4("Then, it permits to predicted  miles per gallon in fonction of weight, using a simple linear model,
     with equation : mile per gallon = 37.28 - 5.34 * weight"),
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    h3('Choose the x variable to plot againts mpg:'),
    radioButtons("variable", "",
                 list(
                   "Weight"="wt",
                   "Displacement"="disp",
                   "HorsePower" = "hp",
                   "Rear"="drat",
                   "Qsec"="qsec",
                   "V/S"="vs",
                   "Transmission"="am",
                   "Gears" = "gear",
                   "Carburators"="carb"
                 )),
  
    h3('Prediction of Miles per Gallon in fonction of desired weight'),
    numericInput('WT', 'Enter the desired weight (lb/1000) between 1 and 6', 3, min = 1, max = 6, step = 0.1),
    #numericInput('id1', 'Numeric input, labeled id1', 0, min = 0, max = 10, step = 1),
    
    h5('Predicted miles per gallon (mpg) '),
    verbatimTextOutput("prediction")
    
    
  ),
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    h3(textOutput("")),
    plotOutput("mpgPlot")
   
  )
))
