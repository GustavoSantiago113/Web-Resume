source("functions.R")

header <- function(){
  div(
    class = "header",
    h2("Gustavo Nocera Santiago"),
    div(
      actionButton(
        class = "header-button",
        inputId = "about",
        label = "About me",
        onclick = "scrollToSection('about-section'); return false;" 
      ),
      actionButton(
        class = "header-button",
        inputId = "projects",
        label = "Projects",
        onclick = "scrollToSection('projects-section'); return false;" 
      ),
      actionButton(
        class = "header-button",
        inputId = "skills",
        label = "Skills"
      ),
      actionButton(
        class = "header-button",
        inputId = "lifejourney",
        label = "Life journey"
      )
    )
  )
}

landingPage <- function(){
  div(
    class = "landing-page",
    div(
      img(
        class = "landing-page-image",
        src="Portraits-9666.jpg"
      )
    ),
    div(
      class = "landing-page-right",
      h3("Hello, I am"),
      h2("Gustavo Nocera Santiago"),
      h4("I work with Computers and Electronics in Agriculture"),
      div(
        class = "download-cv",
        "Download CV"
      ) %>% a(href = "https://docs.google.com/document/d/1hasS1xHCRxC3n7aBsK9_tabxLKmxEuh9/edit?usp=sharing&ouid=105674572987363156197&rtpof=true&sd=true"),
      div(
        class = "icons-redirect",
        tags$a(
          img(
            src = "redirect/Github.png",
            class = "redirect-image"
          ),
          href = "https://github.com/GustavoSantiago113"
        ),
        tags$a(
          img(
            src = "redirect/LinkedIn.png",
            class = "redirect-image"
          ),
          href = "www.linkedin.com/in/gustavo-nocera-santiago-00796616a"
        ),
        tags$a(
          img(
            src = "redirect/ThingIverse.svg",
            class = "redirect-image"
          ),
          href = "https://www.thingiverse.com/gnsantiago/designs"
        ),
        tags$a(
          img(
            src = "redirect/GoogleScholar.png",
            class = "redirect-image"
          ),
          href = "https://scholar.google.com/citations?user=7ueF09kAAAAJ&hl=en"
        )
      )
    )
  )
}

about_me <- function(){
  div(
    id = "about-section",
    h2("About me"),
    div(
      class = "animate-section",
      div(
        class = "about-me-content",
        div(
          class = "about-me-text",
          p("Hello world! I am Gustavo N. Santiago, a biosystems engineer who graduated from the University of Sao Paulo (USP) and pursuing a master's degree in agronomy at Kansas State University (KSU). I am an enthusiast of computers and electronics applied to rural science, miniatures, and DIY projects."),
          p("I have skills in different computational languages and frameworks; GIS, CAD, circuitry and database software; PCB, and 3D printing projects."),
          p("I have already worked in many different fields: biofuels in a chemical lab; microbiology to improve yield at a biological lab; image analysis and wastewater; precision agriculture and data science; development of digital tools for web and mobile; development of sensors for agriculture and last but not least, usage and creation of deep learning models."),
          p("Outside my work, I paint miniatures and dioramas, which require a lot of patience and attention to detail. I also work on personal projects that attract my attention and curiosity.")
        ),
        div(
          img(
            class = "about-me-image",
            src="https://lh3.googleusercontent.com/d/1JnkSfWPftEkIoHCcO41N-VVQ1qiu-Cy3"
          )
        )
      )
    )
  )
}
projects <- function(projectsData){
  div(
    id = "projects-section",
    h2("Projects"),
    project_sub_sections("Ongoing", projectsData),
    br(),
    project_sub_sections("Professional", projectsData),
    br(),
    project_sub_sections("Personal", projectsData),
    br(),
    project_sub_sections("Collaboration", projectsData),
  )
}