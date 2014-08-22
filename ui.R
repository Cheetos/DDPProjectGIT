library(shiny)
library(shinyapps)

shinyUI(pageWithSidebar(
    headerPanel("Overfitting Example"),
    sidebarPanel(
        h4("Instructions"),
        p("This application illustrates with a simple example the important concept of overfitting. In order to do this we used the mtcars data set to fit a 
          regression model to estimate the mpg using the horsepower as a predictor. In the sidebar panel the user can enter the degree of the polyomial of 
          model that will be used and see the results in the main panel, here the scatterplot and the regression line will be plotted, also another picture 
          will show the MSE of the training and test set. Also, for a given number of horsepower the prediction of mpg will be shown."),
        
        p("The porpose of this is to show how using a more complex model, the training error goes down, but the test error increases, this happens 
          because the regression model differs from the original trying to minimize the training error. This phenomenon is known as overfitting."),
        
        h4("Input"),
        
        sliderInput('degree','Enter Polynomial Degree [1,7]:',value=1,min=1,max=7,step=1),
        sliderInput('hpvalue','Enter Horsepower Value [50,200]:',value=100,min=50,max=200,step=0.5)
    ),
    mainPanel(
        h4('Degree of the Polynomial'),
        verbatimTextOutput("odegree"),
        h4('Horsepower Value'),
        verbatimTextOutput("hpvalue"),
        h4('Estimated MPG Value'),
        verbatimTextOutput("mpgvalue"),
        plotOutput("lmPlot"),
        plotOutput("msePlot"),
        h4("MSE Training Set"), 
        textOutput("mseTrain"),
        h4("MSE Test Set"),
        textOutput("mseTest")
    )
))
