library(shiny)

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("BLAST Data"),
  
  # Some helpful information
  helpText("This application creates a plot to show difference between",
           "iris species.  Please use the radio box below to choose a trait",
           "for plotting"),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
<<<<<<< HEAD
      sliderInput("pct_ident", "Percent Identity:",
                  min = 0, max = 100,
                  value = c(20,50)
      )),
=======

      sliderInput("pct_ident", "Integer:", #the input variable that the value will go into
                  min = 0, max = 1000,

      sliderInput("len", "asdasd:",
                  min = 0, max = 2400,
                  value = 500)
      ),
>>>>>>> ba59fd662a668e040ac81739d9e3cf5f96664a07
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("Plot")
    )
  )
))

