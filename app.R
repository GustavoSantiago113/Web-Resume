# Loading Libraries ----
library(shiny)
library(bslib)
library(shinyWidgets)
library(tidyverse)
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
        img(
          class = "image",
          src = "Profile.png"
        )
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
      ),
      div(
        class = "firstSectionButton",
        tags$h5("My hobbies"),
        img(
          class = "arrowDown",
          src = "arrow.svg"
        ),
        data_target = "myHobbies"
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
        img(
          class = "pop",
          style = "height: 30em;",
          src = "aboutMe/aboutMeImage.jpg"
        )
      ),
      column(
        class = "pop delay",
        width = 8,
        style = "text-align: justify; --delay-time:1s",
        tags$h5(
          "Hello world! I am Gustavo N. Santiago, an enthusiast of computers and electronics in agriculture, miniatures, and DIY projects."
        ),
        tags$h5(
          "My path started in 2017 when I started my Biosystems Engineering college at University of Sao Paulo, Brazil. During my college, I did many things, such as being part of a junior company, member of the academic secretary, and the three scientific initiations. Later on, I was an intern at three companies: IA Prisma, working with intelligent agronomy; IZAgro, working with mobile apps to help agronomists and regenerative agriculture; and 6th Grain, being part of the science and marketing research."
        ),
        tags$h5(
          "In 2022, I moved to the United States to be a scholar at Kansas State University with Ciampitti Lab, where I could develop many projects related to digital agriculture. "
        ),
        tags$h5(
          "Nowadays I am a master's student at Kansas State and Ciampitti Lab, moving forward with digital agriculture projects."
        ),
        tags$h5(
          style = "font-weight: bold",
          "Email for contact: gsantiago@ksu.edu"
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
                           "2023-Present",
                           "Agronomy master student at Kansas State University",
                           "My projects were basically develop a mobile app to estimate the sorghum panicle grain number at field scale. The basis of the project are neural networks and linear models."),
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
            class = "arrowDown",
            src = "arrow.svg"
          ),
          data_target = "myHobbies"
        ),
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
  
  ## 9. My hobbies ----
  div(
    id = "myHobbies",
    #style = "background-image: url('hobbies/background.png')",
    div(
      class = "sectionHeader",
      div(
        class = "headerTitle",
        img(
          class = "sectionIcon",
          src = "hobbies/icon.svg"
        ),
        tags$h4(
          "My hobbies",
          style = "color: black"
        )
      ),
      div(
        div(
          class = "directingArrow",
          img(
            class = "arrowUp",
            src = "arrow.svg"
          ),
          data_target = "myProjects"
        )
      )
    ),
    tags$h2(
      "This section is still under development, stay tunned for more!",
      style = "color: black; text-align: center"
    )
  )
  

)



# Server ----
server <- function(input, output, session) {
  
  ## Loading data ----
  skills <- read.csv("data/skills.csv")
  #projects <- read.csv("data/myprojects.csv")
  
  ## Skills ----
  output$skillBoxes <- renderUI({
    creating_skill_boxes(skills)
  })
  
}

shinyApp(ui, server)