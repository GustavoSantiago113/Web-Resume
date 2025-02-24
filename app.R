# Loading Libraries ----
library(shiny)
library(shinyWidgets)
library(dplyr)
source("components.R")

# Loading data ----
skills <- read.csv("data/skills.csv")
projectsData <- read.csv("data/myprojects.csv")

# Creating page ----
ui <- fluidPage(
  
  ## Inserting CSS ----
  tags$head(
    tags$link(
      rel = "stylesheet",
      type = "text/css",
      href = "https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"),
    tags$link(
      rel  = "stylesheet",
      type = "text/css",
      href = "styles.css")
  ),
  
  ## 1. Insert JavaScript ----
  includeScript("www/custom.js"),
  
  ## 2. Inserting Header ----
  header(),
  
  ## 3. Landing Page ----
  landingPage(),
  
  ## 4. About Me section ----
  about_me(),
  
  ## 5. My projects section ----
  projects(projectsData),
  
  ## Inserting Carousel JS ----
  tags$script(src = "https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js")
)

# Server ----
server <- function(input, output, session) {
  
}

shinyApp(ui, server)