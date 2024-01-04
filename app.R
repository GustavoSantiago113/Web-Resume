# Loading Libraries ----
library(shiny)
library(bslib)
library(shinyWidgets)
library(tidyverse)

# Creating page ----

ui <- fluidPage(
  
  ##  1. Insert theme ----
  theme = bslib::bs_theme(4),
  
  ## 2. Insert CSS ----
  tags$head(
    tags$link(rel  = "stylesheet",
              type = "text/css",
              href = "styles.css")
  ),
  
  ## 3. Creating Header ----
  fluidRow(
    class = "header",
    tags$a(
      img(
        src = "Github.png",
        height = 40,
        width = 40
      ),
      href = "https://github.com/GustavoSantiago113",
    ),
    tags$a(
      img(
        src = "LinkedIn.png",
        height = 40,
        width = 40
      ),
      href = "www.linkedin.com/in/gustavo-nocera-santiago-00796616a",
    ),
    tags$h1(
      "Web Resume"
    ),
    tags$a(
      img(
        src = "ThingIverse.png",
        height = 40,
        width = 40
      ),
      href = "https://www.thingiverse.com/gnsantiago/designs",
    ),
    tags$a(
      img(
        src = "GoogleScholar.png",
        height = 40,
        width = 40
      ),
      href = "https://scholar.google.com/citations?user=7ueF09kAAAAJ&hl=en",
    ),
  ),
  
  ## 4. Creating profile image ----
  fluidRow(
    column(
      12,
      align = "center",
      img(
        class = "image",
        src = "Profile.png",
      )
    )
  ),
  
  ## 5. Creating description box ----
  fluidRow(
    column(
      3
    ),
    column(
      class = "descriptionBox",
      6,
      align = "center",
      tags$p("Hello world! I am Gustavo N. Santiago, an enthusiast of computers and electronics in agriculture, miniatures, and DIY projects."),
      tags$p("My path started in 2017 when I started my Biosystems Engineering college at Universidade de Sao Paulo, Brazil. During my college, I did many things, such as being part of a junior company, member of the academic secretary, and the three scientific initiations. Later on, I was an intern at three companies: IA Prisma, working with intelligent agronomy; IZAgro, working with mobile apps to help agronomists and regenerative agriculture; and 6th Grain, being part of the science and marketing research."),
      tags$p("In 2022, I moved to the United States to be a scholar at Kansas State University with Ciampitti Lab, where I could develop many projects related to digital agriculture."),
      tags$p("Nowadays I am a master's student at Kansas State and Ciampitti Lab, moving forward with digital agriculture projects."),
      tags$p("Email for contact: gsantiago@ksu.edu"),
      ),
    column(
      3
    ),
  ),
  
  ## 6. Jumbotrons Work ----
  h2("Professional projects"),
  uiOutput("work_jumbotron"),
  
  ## 7. Jumbotrons Personal ----
  h2("Personal projects"),
  uiOutput("personal_jumbotron"),
  
  ## 8. Jumbotrons Collaboration ----
  h2("Collaboration projects"),
  uiOutput("colab_jumbotron"),
  
  ## 9. Making footer ----
  fluidRow(
    column(
      width = 12,
      align = "center",
      tags$p("This site was developed by the author using Shiny R Framework")
    )
  )
  
)

# Function to create Jumbotrons ----
creating_jumbotrons <- function(data){
  
  renderUI({
    
    jumbotron_list <- lapply(1:nrow(data), function(i) {
      
      title <- data[i, "Title"]
      link <- data[i, "Link"]
      image <- data[i, "Image"]
      
      column(
        width = 4,
        align = "center",
        tags$a(
          div(
            class = "divJumbotron",
            img(
              class = "imgJumbotron",
              src = image,
            ),
            tags$h5(
              title
            )
          ),
          href = link
        )
      )
      
    })
    
    fluidRow(do.call(tagList, jumbotron_list))
    
  })
  
}

# Server ----
server <- function(input, output, session) {
  
  ## Loading data ----
  data <- read.csv("myprojects.csv")
        
  ## Creating jumbotron work ----
  data_work <- data %>%
    filter(Category == "Work")
  output$work_jumbotron <- creating_jumbotrons(data = data_work)
  
  ## Creating jumbotron personal ----
  data_personal <- data %>%
    filter(Category == "Personal")
  output$personal_jumbotron <- creating_jumbotrons(data = data_personal)
  
  ## Creating jumbotron work ----
  data_colab <- data %>%
    filter(Category == "Collaboration")
  output$colab_jumbotron <- creating_jumbotrons(data = data_colab)
  
}

shinyApp(ui, server)