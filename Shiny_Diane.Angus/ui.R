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
      sliderInput("pct_ident", "Percent Identity:",
                  min = 0, max = 100,
                  value = c(20,50)
      )),

radioButtons("trait",
              "Choose a trait to display:",
             c("percent.identity", "mismatch", 
               "E.value", "gaps"),


      sliderInput("len", "asdasd:",
                  min = 0, max = 2400,
                  value = 500)
      ),

    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("Plot")
    )
  )
))