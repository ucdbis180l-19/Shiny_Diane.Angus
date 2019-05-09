library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("BLAST Data"),
  
  # Some helpful information
  helpText("This application creates a plot to how different traits might",
           "affect the sequence length vs score relationship.",
           "Please use the radio box below to choose a trait",
           "for plotting"),
  
  # Sidebar with a radio box to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
   

radioButtons("trait",
              "Choose a trait to display:",
             c("percent.identity", "mismatch", 
               "E.value", "gaps")



      )),

    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("Plot")
    )
  )
))