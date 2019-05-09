library(shiny)
library(ggplot2)


library(tidyverse)
library(tidyverse)
plant_worm <- read_tsv("plant_vs_worm.blastout_v2.1.gz",col_names=FALSE)
worm_plant <- read_tsv("worm_vs_plant.blastout_v2.1.gz",col_names=FALSE)
colnames(plant_worm) <- c("query_id",
                          "subject_id",
                          "pct_ident",
                          "len",
                          "mis",
                          "gaps",
                          "qb",
                          "qe",
                          "sb",
                          "se",
                          "E",
                          "Score")

colnames(worm_plant) <- c("query_id",
                          "subject_id",
                          "pct_ident",
                          "len",
                          "mis",
                          "gaps",
                          "qb",
                          "qe",
                          "sb",
                          "se",
                          "E",
                          "Score")

plant_worm_best <- plant_worm %>%
  arrange(query_id, E, desc(Score)) %>%
  filter(!duplicated(query_id))
worm_plant_best <- worm_plant %>%
  arrange(query_id, E, desc(Score)) %>%
  filter(!duplicated(query_id))


plant_worm.blast <- plant_worm_best %>%
  select(len, pct_ident, E)
worm_plant.blast <- worm_plant_best %>%
  select(len, pct_ident, E)




# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$boxPlot <- renderPlot({
    
    # set up the plot
    pl <- ggplot(data = plant_worm_best,
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x="Score",
                            y=input$len,
                            fill="pct_ident"
                 )
    )
    
    # draw the boxplot for the specified trait
    pl + geom_point()
  })
})