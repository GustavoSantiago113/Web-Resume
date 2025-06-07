project_sub_sections <- function(filterName, data){
  div(
    class = "animate-section",
    h3(
      class = "projects-subtitle",
      filterName
    ),
    div(
      class = "collection",
      HTML(render_project_cards(filterName, data))
    )
  )
}

render_project_cards <- function(filterName, data){
  
  dataUsed <- data %>% filter(Category == filterName)
  
  jumbotron_list <- lapply(1:nrow(dataUsed), function(i) {
    
    name <- dataUsed[i, "Title"]
    image <- dataUsed[i, "Image"]
    link <- dataUsed[i, "Link"]
    image_url <- paste0("projects/", image)
    img_html <- sprintf('<img class="card-image" src="%s">', image_url)
    
    div(
      class = "content",
      div(
        class = "image-container",
        HTML(img_html)
      ),
      div(
        class = "card-content",
        p(
          name
        ),
        if(link != ""){
          a(
            "Learn More",
            href = link,
            target = "_blank"
          )
        }
      )
    )
  })
  
  as.character(do.call(tagList, jumbotron_list))
}

skills_sub_sections <- function(filterName, data){
  div(
    class = "animate-section",
    h3(
      class = "projects-subtitle",
      filterName
    ),
    div(
      class = "skills-container",
      HTML(render_skills_cards(filterName, data))
    )
  )
}

render_skills_cards <- function(filterName, data){
  
  dataUsed <- data %>% filter(Category == filterName)
  
  jumbotron_list <- lapply(1:nrow(dataUsed), function(i) {
    
    name <- dataUsed[i, "Name"]
    image <- dataUsed[i, "ImageSRC"]
    level <- dataUsed[i, "Level"]
    
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
          h5(
            name
          )
        ),
        div(
          class = "skills-card-back",
          h5(
            "Level"
          ),
          h4(
            paste(level, "/5", sep = "")
          )
        )
      )
    )
  })
  
  as.character(do.call(tagList, jumbotron_list))
  
}

render_life_journey <- function(data){
  
  journey_list <- lapply(1:nrow(data), function(i) {
    date <- data[i, "Date"]
    fact <- data[i, "Fact"]
    
    div(
      class = "journey-box",
      h4(date),
      div(
        class = "circle"
      ),
      h5(fact)
    )
  })
  as.character(do.call(tagList, journey_list))
}