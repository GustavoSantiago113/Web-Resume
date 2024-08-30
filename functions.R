# Function for life Journey ----
life_journey_items <- function(class, backGroundColor, year, title, descr){
  tags$li(
    class = class,
    style = backGroundColor,
    div(
      class = "date",
      year
    ),
    div(
      class = "title",
      title
    ),
    div(
      class = "descr",
      descr
    )
  )
}

# Function to create skills squares ----
creating_skill_boxes <- function(data){

  renderUI({

    jumbotron_list <- lapply(1:nrow(data), function(i) {

      name <- data[i, "Name"]
      image <- data[i, "ImageSRC"]
      level <- data[i, "Level"]

      div(
        class = "skills-card",
        div(
          class = "skills-card-inner",
          div(
            class = "skills-card-front",
            img(
              class = "imgSkills",
              src = str_glue("skills/", image)
            ),
            tags$h5(
              name
            )
          ),
          div(
            class = "skills-card-back",
            tags$h4(
              "Level"
            ),
            tags$h5(
              paste(level, "/5", sep = "")
            )
          )
        )
      )
    })

    fluidRow(do.call(tagList, jumbotron_list))

  })

}

# Function to create project carousel ----
creating_project_carousel <- function(data, section, hasLink){
    
  dataUsed <- data %>%
    filter(Category == section)
  
  jumbotron_list <- lapply(1:nrow(dataUsed), function(i) {
    
    name <- dataUsed[i, "Title"]
    image <- dataUsed[i, "Image"]
    link <- dataUsed[i, "Link"]
    classified <- dataUsed[i, "Classified"]
    
    div(
      class = "slider-card",
      div(
        class = "imageProjectContainer",
        img(
          class = "projectImage",
          src = str_glue("projects/", image)
        )
      ),
      div(
        class = "bellowImage",
        div(
          class = "projectTitle",
          tags$h6(
            name
          )
        ),
        if(hasLink == TRUE){
          if(classified == "No"){
            div(
              class = "learnMore",
              "Learn more"
            ) %>% a(href = link)
          }
          else if(classified == "Yes"){
            actionButton(
              class = "learnMore",
              "classifiedProject",
              "Learn More")
          }
          
        }
      )
    )
  })
  
  as.character(do.call(tagList, jumbotron_list))
  
  
}