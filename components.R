header <- function(){
  div(
    class = "header",
    h2("Gustavo Nocera Santiago"),
    div(
      actionButton(
        class = "header-button",
        inputId = "about",
        label = "About me"
      ),
      actionButton(
        class = "header-button",
        inputId = "projects",
        label = "Projects"
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