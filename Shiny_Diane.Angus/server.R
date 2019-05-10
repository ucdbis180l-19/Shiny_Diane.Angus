library(shiny)
library(ggplot2)


library(tidyverse)

library(stringr)



plant_worm <- read_tsv("plant_vs_worm.blastout_v2.1.gz",col_names=FALSE)
worm_plant <- read_tsv("worm_vs_plant.blastout_v2.1.gz",col_names=FALSE)

colnames(plant_worm) <- c("query_id",
                          "subject_id",
                          "percent.identity",
                          "length",
                          "mismatch",
                          "gaps",
                          "qb",
                          "qe",
                          "sb",
                          "se",
                          "E.value",
                          "Score")



plant_worm_best <- plant_worm %>%
  arrange(query_id, E.value,desc(Score)) %>%
  filter(!duplicated(query_id))




# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$Plot <- renderPlot({
    
    # set up the plot


    pl <- ggplot(data=plant_worm_best,
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x="Score",
                            y="length",
             color=input$trait

                 ) 
    )
    
    # draw the boxplot for the specified trait
    pl + geom_point()
  })
})