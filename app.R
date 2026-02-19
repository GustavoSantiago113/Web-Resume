# Loading Libraries ----
library(shiny)
library(shinyWidgets)
library(tidyverse)
source("components.R")

# Loading data ----
skillsData <- read.csv("data/skills.csv")
projectsData <- read.csv("data/myprojects.csv")
journeyData <- read.csv("data/lifeJourney.csv")

# Creating page ----
ui <- fluidPage(
  
  ## Inserting CSS ----
  tags$head(
    tags$link(
      rel  = "stylesheet",
      type = "text/css",
      href = "styles.css")
  ),
  
  ## 1. Insert JavaScript ----
  includeScript("www/custom.js"),
  
  ## 2. Inserting Header ----
  header(),
  
  div(
    class = "main-wrapper",
    ## 3. Landing Page ----
    landingPage(),
    
    ## 4. About Me section ----
    about_me(),
    
    ## 5. My projects section ----
    projects(projectsData),
    
    ## 6. My skills section ----
    skills(skillsData),
    
    ## 7. Life journey ----
    life_journey(journeyData)
  )
  
)

# Server ----
server <- function(input, output, session) {
  
}

shinyApp(ui, server)
