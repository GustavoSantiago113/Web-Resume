# Loading Libraries ----
library(shiny)
library(shinyWidgets)
library(dplyr)
source("components.R")

# Creating page ----

ui <- fluidPage(
  
  ## 1. Insert JavaScript ----
  includeScript("www/custom.js"),
  
  ## 2. Insert CSS ----
  tags$head(
    tags$link(rel  = "stylesheet",
              type = "text/css",
              href = "styles.css")
  ),
  
  ## 3. Inserting Header ----
  header(),
  
  ## 4. Landing Page ----
  landingPage(),
  
  ## 5. About Me section ----
  about_me()
)

# Server ----
server <- function(input, output, session) {
  
  ## Loading data ----
  skills <- read.csv("data/skills.csv")
  projects <- read.csv("data/myprojects.csv")
  
}

shinyApp(ui, server)