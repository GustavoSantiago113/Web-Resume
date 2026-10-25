source("functions.R")

nav_link <- function(label, target){
  tags$a(
    class = "header-button",
    href = paste0("#", target),
    `data-target` = target,
    label
  )
}

header <- function(){
  div(
    class = "header",
    tags$a(
      class = "header-brand",
      href = "#top",
      h2("Gustavo Nocera Santiago"),
      span(class = "header-role", "Biosystems Engineer · PhD Researcher")
    ),
    tags$nav(
      class = "header-nav",
      `aria-label` = "Sections",
      nav_link("About me", "about-section"),
      nav_link("Projects", "projects-section"),
      nav_link("Skills", "skills-section"),
      nav_link("Life journey", "life-journey-section")
    )
  )
}

landingPage <- function(){
  div(
    id = "top",
    class = "landing-page",
    div(
      class = "landing-page-image-wrap",
      img(
        class = "landing-page-image",
        src = "Portraits-9666.jpg",
        alt = "Portrait of Gustavo Nocera Santiago"
      )
    ),
    div(
      class = "landing-page-right",
      span(class = "eyebrow", "Hello, I am"),
      h1(class = "landing-name", "Gustavo Nocera Santiago"),
      h4("I work with Computers and Electronics in Agriculture"),
      div(
        class = "cta-row",
        tags$a(
          class = "download-cv",
          href = "https://drive.google.com/uc?export=download&id=1hasS1xHCRxC3n7aBsK9_tabxLKmxEuh9",
          "Download CV"
        ),
        tags$a(
          class = "youtube-cta",
          href = "https://www.youtube.com/channel/UCZhTiJvv2n9EvaVY3kF3p3Q",
          target = "_blank",
          rel = "noopener",
          img(src = "redirect/YouTube.png", class = "youtube-cta-icon", alt = ""),
          "Watch my videos"
        )
      ),
      div(
        class = "contact-line",
        "Email for contact: ",
        tags$a(href = "mailto:gnoceras@purdue.edu", "gnoceras@purdue.edu")
      ),
      social_links()
    ),
    tags$a(
      class = "scroll-cue",
      href = "#about-section",
      `data-target` = "about-section",
      `aria-label` = "Scroll to About me",
      HTML("&darr;")
    )
  )
}

social_links <- function(){
  links <- list(
    c("GitHub", "redirect/Github.png", "https://github.com/GustavoSantiago113"),
    c("LinkedIn", "redirect/LinkedIn.png", "https://www.linkedin.com/in/gustavo-nocera-santiago-00796616a"),
    c("Google Scholar", "redirect/GoogleScholar.png", "https://scholar.google.com/citations?user=7ueF09kAAAAJ&hl=en")
  )
  div(
    class = "icons-redirect",
    lapply(links, function(l){
      tags$a(
        img(src = l[2], class = "redirect-image", alt = ""),
        href = l[3],
        target = "_blank",
        rel = "noopener",
        title = l[1],
        `aria-label` = l[1],
        class = "redirect-image-link"
      )
    })
  )
}

about_me <- function(){
  tags$section(
    id = "about-section",
    class = "page-section",
    span(class = "eyebrow", "Get to know me"),
    h2("About me"),
    div(
      class = "animate-section",
      div(
        class = "about-me-content",
        div(
          class = "about-me-text",
          p(class = "about-me-lead", "Hello world! I am Gustavo N. Santiago, a biosystems engineer who graduated from the University of São Paulo (USP), hold a master’s degree in agronomy from Kansas State University (KSU), and am pursuing a PhD in agronomy at Purdue University. I am an enthusiast of computers and electronics applied to rural sciences, miniatures, and DIY projects."),
          p("I have skills in various programming languages and frameworks; GIS, CAD, circuitry, and database software; PCB design; and 3D printing projects."),
          p("I have worked in many different fields: biofuels in a chemical lab; microbiology to improve yield in a biological lab; image analysis and wastewater management; precision agriculture and data science; development of digital tools for web and mobile platforms; development of sensors for agriculture; and last but not least, the use and creation of deep learning models."),
          p("Outside of work, I paint miniatures and dioramas, which require a lot of patience and attention to detail. I also enjoy working on personal projects that spark my curiosity and interest.")
        ),
        div(
          class = "about-me-image-wrap",
          img(
            class = "about-me-image",
            src = "aboutMeImage.jpg",
            alt = "Gustavo outside of work"
          )
        )
      )
    )
  )
}

projects <- function(projectsData){
  categories <- c("Ongoing", "Professional", "Personal", "Collaboration")
  tags$section(
    id = "projects-section",
    class = "page-section",
    span(class = "eyebrow", "Selected work"),
    h2("Projects"),
    project_filters(categories, projectsData),
    lapply(categories, project_sub_sections, data = projectsData)
  )
}

skills <- function(skillsData){
  tags$section(
    id = "skills-section",
    class = "page-section",
    span(class = "eyebrow", "Toolbox"),
    h2("Skills"),
    p(
      class = "section-subheading",
      "The dots show how comfortable I am with each one, out of 5."
    ),
    skills_sub_sections("Language", skillsData, "Languages"),
    skills_sub_sections("Framework", skillsData, "Frameworks"),
    skills_sub_sections("Tools", skillsData, "Tools"),
    skills_sub_sections("Hability", skillsData, "Abilities")
  )
}

life_journey <- function(data){
  tags$section(
    id = "life-journey-section",
    class = "page-section",
    span(class = "eyebrow", "Timeline"),
    h2("Life Journey"),
    tags$ol(
      class = "journey-container animate-section",
      HTML(render_life_journey(data))
    )
  )
}

footer <- function(){
  tags$footer(
    class = "site-footer",
    p(
      "Want to talk about a project? ",
      tags$a(href = "mailto:gnoceras@purdue.edu", "Send me an email")
    ),
    social_links(),
    p(class = "footer-note", paste0("© ", format(Sys.Date(), "%Y"), " Gustavo Nocera Santiago")),
    tags$button(
      class = "back-to-top",
      type = "button",
      `aria-label` = "Back to top",
      HTML("&uarr;")
    )
  )
}
