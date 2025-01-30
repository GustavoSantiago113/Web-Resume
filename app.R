# Loading Libraries ----
library(shiny)
library(bslib)
library(shinyWidgets)
library(tidyverse)
library(slickR)
source("functions.R")

projects <- read.csv("data/myprojects.csv")

# Creating page ----

ui <- fluidPage(
  
  ## Bootstrap ----
  tags$head(
    
    tags$link(rel = "stylesheet", type = "text/css", href = "https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"),
    tags$link(rel = "stylesheet", type = "text/css", href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"),
    
    tags$script(src = "https://code.jquery.com/jquery-3.6.0.min.js"),
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"),
    tags$script(src = "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"),
    tags$script(src = "https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js")
  ),
  
  ## JavaScript ----
  includeScript("www/custom.js"),
  
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
    id = "firstSection",
    class = "header",
    tags$h1(
      "Web Resume",
      style = "margin: auto"
    )
  ),
  
  br(),
  
  ## 4. First section ----
  div(
    class = "firstSection",
    div(
      style = "display: flex",
      div(
        tags$h2("Hello World!", style = "font-weight: bold; margin-left: 10%; margin-top: 10%"),
        tags$h2("I am Gustavo N. Santiago", style = "font-weight: bold; margin-left: 10%;"),
        br(),
        tags$h3("I’m into Computers & Electronics in Agriculture", style = "margin-left: 10%; margin-right: 5%"),
        div(
          class = "iconsRedirect",
          tags$a(
            img(
              src = "redirect/Github.png",
              class = "redirectImage"
            ),
            href = "https://github.com/GustavoSantiago113"
          ),
          tags$a(
            img(
              src = "redirect/LinkedIn.png",
              class = "redirectImage"
            ),
            href = "www.linkedin.com/in/gustavo-nocera-santiago-00796616a"
          ),
          tags$a(
            img(
              src = "redirect/ThingIverse.svg",
              class = "redirectImage"
            ),
            href = "https://www.thingiverse.com/gnsantiago/designs"
          ),
          tags$a(
            img(
              src = "redirect/GoogleScholar.png",
              class = "redirectImage"
            ),
            href = "https://scholar.google.com/citations?user=7ueF09kAAAAJ&hl=en"
          )
        )
      ),
      div(
        style= "margin:auto",
        HTML('<img src="https://lh3.googleusercontent.com/d/1LwidRBpqCmXGK2lvmCrzhYoveSSDv7kC">')
      )
    ),
    div(
      class = "buttonSections",
      div(
        class = "firstSectionButton",
        tags$h5("About me"),
        img(
          class = "arrowDown",
          src = "arrow.svg"
        ),
        data_target = "aboutMe"
      ),
      div(
        class = "firstSectionButton",
        tags$h5("Life journey"),
        img(
          class = "arrowDown",
          src = "arrow.svg"
        ),
        data_target = "lifeJourney"
      ),
      div(
        class = "firstSectionButton",
        tags$h5("My skills"),
        img(
          class = "arrowDown",
          src = "arrow.svg"
        ),
        data_target = "mySkills"
      ),
      div(
        class = "firstSectionButton",
        tags$h5("My projects"),
        img(
          class = "arrowDown",
          src = "arrow.svg"
        ),
        data_target = "myProjects"
      )
    )
  ),
  
  ## 5. About me ----
  div(
    id = "aboutMe",
    div(
      class = "sectionHeader",
      div(
       class = "headerTitle",
        img(
          class = "sectionIcon",
          src = "aboutMe/icon.svg"
        ),
        tags$h4(
          "About me"
        )
      ),
      div(
        style = "display: flex",
        div(
          class = "directingArrow",
          img(
            class = "arrowDown",
            src = "arrow.svg"
          ),
          data_target = "lifeJourney"
        ),
        div(
          class = "directingArrow",
          img(
            class = "arrowUp",
            src = "arrow.svg"
          ),
          data_target = "firstSection"
        )
      )
    ),
    fluidRow(
      column(
        width = 4,
        HTML('<img style = "height: 30em" src="https://lh3.googleusercontent.com/d/1JnkSfWPftEkIoHCcO41N-VVQ1qiu-Cy3">')
      ),
      column(
        width = 8,
        style = "text-align: justify; --delay-time:1s",
        tags$h5(
          "Hello world! I am Gustavo N. Santiago, a biosystems engineer who graduated from the University of Sao Paulo (USP) and pursuing a master's degree in agronomy at Kansas State University (KSU). I am an enthusiast of computers and electronics applied to rural science, miniatures, and DIY projects."
        ),
        tags$h5(
          "I have skills in different computational languages and frameworks; GIS, CAD, circuitry and database software; PCB, and 3D printing projects."
        ),
        tags$h5(
          "I have already worked in many different fields: biofuels in a chemical lab; microbiology to improve yield at a biological lab; image analysis and wastewater; precision agriculture and data science; development of digital tools for web and mobile; development of sensors for agriculture and last but not least, usage and creation of deep learning models."
        ),
        tags$h5(
          "Outside my work, I paint miniatures and dioramas, which require a lot of patience and attention to detail. I also work on personal projects that attract my attention and curiosity."
        ),
        tags$h5(
          style = "font-weight: bold",
          "Email for contact: gnoceras@purdue.edu"
        )
      )
    )
  ),
  
  ## 6. Life Journey ----
  div(
    id = "lifeJourney",
    div(
      class = "sectionHeader",
      div(
        class = "headerTitle",
        img(
          class = "sectionIcon",
          src = "lifeJourney/icon.svg"
        ),
        tags$h4(
          "Life Journey"
        )
      ),
      div(
        style = "display: flex",
        div(
          class = "directingArrow",
          img(
            class = "arrowDown",
            src = "arrow.svg"
          ),
          data_target = "mySkills"
        ),
        div(
          class = "directingArrow",
          img(
            class = "arrowUp",
            src = "arrow.svg"
          ),
          data_target = "aboutMe"
        )
      )
    ),
    div(
      class = "lifeJourney",
      tags$ul(
        life_journey_items("pop",
                           "--accent-color:#E27D5F;",
                           "2012",
                           "National Physics Olympics finalist",
                           "In my 8th grade I was finalist in the National Physics Olympics even though just having physics class that year"),
        life_journey_items("pop delay",
                           "--accent-color:#85CDCA; --delay-time:1s",
                           "2013-2015",
                           "Approved in many universities",
                           "During my High School I was approved in many public universities (at Brazil they are the best). First year: Librarianship. Second Year: Business schol. Third Year: Mechanics Engineering and the Brazil's Military Academy"),
        life_journey_items("pop delay",
                           "--accent-color:#E8A87D; --delay-time:1.5s",
                           "2016",
                           "Brazil's Military Academy",
                           "Entering there is through a test. Over 17 thousand people did that year. I was 17 years old and was approved in 70th place. Over there, I learned a lot about leadership, companionship and duty."),
        life_journey_items("pop delay",
                           "--accent-color:#DA7592; --delay-time:2s",
                           "2017-2022",
                           "Biosystems Engineering student at the University of Sao Paulo - Brazil",
                           "University of Sao Paulo is currently the best university in Latin America, and I had the pleasure to be the student with the highest grades of within my class. Besides that, I was part of the junior company, did 3 scientific projects and was a member of the academic secretary."),
        life_journey_items("pop delay",
                           "--accent-color:#55B4A3; --delay-time:2.5s",
                           "2021-2022",
                           "Internships in 3 companies",
                           "I was intern at Prisma Inteligencia Agronomica, a very modern precision agriculture company located in the Brazil's barn.
                           My Second internship was at IZAgro, a start up developing mobile apps and a market place aiming regenerative agriculture. I was the bridge between the agriculture and the computational development.
                           My last internship was at 6thGrain/Nogtan, where I did literature and marketing research"),
        life_journey_items("pop delay",
                           "--accent-color:#E27D5F; --delay-time:3s",
                           "2022-2023",
                           "Research scholar at Kansas State University in Ciampitti Lab",
                           "During this period, I developed a lot of different projects. I also had the possibility to publish my first paper."),
        life_journey_items("pop delay",
                           "--accent-color:#85CDCA; --delay-time:3.5s",
                           "2023-2024",
                           "Agronomy master student at Kansas State University",
                           "My projects were basically develop a mobile app to estimate the sorghum panicle grain number at field scale. The basis of the project are neural networks and linear models."),
        life_journey_items("pop delay",
                           "--accent-color:#E27D5F; --delay-time:3.5s",
                           "2025-Present",
                           "Agronomy PhD student at Purdue University",
                           "My projects are to develop a tool to predict harvest readiness for corn and nutrient deficiencies in leaves using machine learning."),
      )
    )
  ),
  
  ## 7. My skills ----
  div(
    id = "mySkills",
    div(
      class = "sectionHeader",
      div(
        class = "headerTitle",
        img(
          class = "sectionIcon",
          src = "skills/icon.svg"
        ),
        tags$h4(
          "My skills"
        )
      ),
      div(
        style = "display: flex",
        div(
          class = "directingArrow",
          img(
            class = "arrowDown",
            src = "arrow.svg"
          ),
          data_target = "myProjects"
        ),
        div(
          class = "directingArrow",
          img(
            class = "arrowUp",
            src = "arrow.svg"
          ),
          data_target = "lifeJourney"
        )
      )
    ),
    div(
      class = "boxSkills",
      uiOutput(outputId = "skillBoxes")
    )
  ),
  
  ## 8. My projects ----
  div(
    id = "myProjects",
    div(
      class = "sectionHeader",
      div(
        class = "headerTitle",
        img(
          class = "sectionIcon",
          src = "projects/icon.svg"
        ),
        tags$h4(
          "My projects"
        )
      ),
      div(
        style = "display: flex",
        div(
          class = "directingArrow",
          img(
            class = "arrowUp",
            src = "arrow.svg"
          ),
          data_target = "mySkills"
        )
      )
    ),
    # Ongoing
    div(
      class = "projectSection",
      "Ongoing"
    ),
    div(
      class = "slider",
      div(
        class = "owl-carousel",
        HTML(creating_project_carousel(projects, "Ongoing", FALSE))
      )
    ),
    # Professional
    div(
      class = "projectSection",
      "Professional"
    ),
    div(
      class = "slider",
      div(
        class = "owl-carousel",
        HTML(creating_project_carousel(projects, "Work", TRUE))
      )
    ),
    # Personal
    div(
      class = "projectSection",
      "Personal"
    ),
    div(
      class = "slider",
      div(
        class = "owl-carousel",
        HTML(creating_project_carousel(projects, "Personal", TRUE))
      )
    ),
    # # ARA projects
    # div(
    #   class = "projectSection",
    #   "ARA Project"
    # ),
    # div(
    #   class = "slider",
    #   div(
    #     class = "owl-carousel",
    #     HTML(creating_project_carousel(projects, "ARA", TRUE))
    #   )
    # ),
    # Collaborative
    div(
      class = "projectSection",
      "Collaboration"
    ),
    div(
      class = "slider",
      div(
        class = "owl-carousel",
        HTML(creating_project_carousel(projects, "Collaboration", TRUE))
      )
    ),
  ),
  br(),
  

)

# Server ----
server <- function(input, output, session) {
  
  ## Loading data ----
  skills <- read.csv("data/skills.csv")
  
  ## Skills ----
  output$skillBoxes <- renderUI({
    creating_skill_boxes(skills)
  })
  
  ## Classified Projects ----
  observeEvent(input$classifiedProject, {
    showModal(
      modalDialog(
        title = "Classified project",
        div(
          tags$p("I'm sorry, but this is part of a bigger project that will be released anytime in the future..."),
          tags$p("It will be amazing and revolutionary!"),
          tags$p("Stay tunned for more updates.")
        ),
        fade = TRUE,
        footer = modalButton("Dismiss"),
        size = "m"
      )
    )
  })
  
}

shinyApp(ui, server)