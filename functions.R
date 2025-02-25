project_sub_sections <- function(filterName, data){
  div(
    class = "animate-section",
    h3(
      class = "projects-subtitle",
      filterName
    ),
    div(
      class = "collection",
      div(
        class = "swiper mySwiper",
        div(
          class = "swiper-wrapper",
          HTML(render_project_cards(filterName, data))
        )
      )
    )
  )
}

render_project_cards <- function(filterName, data){
  
  dataUsed <- data %>% filter(Category == filterName)
  
  jumbotron_list <- lapply(1:nrow(dataUsed), function(i) {
    
    name <- dataUsed[i, "Title"]
    image <- dataUsed[i, "Image"]
    link <- dataUsed[i, "Link"]
    image_url <- paste0("https://lh3.googleusercontent.com/d/", image)
    img_html <- sprintf('<img class="card-image" src="%s">', image_url)
    
    div(
      class = "content swiper-slide",
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
            href = link
          )
        }
      )
    )
  })
  
  as.character(do.call(tagList, jumbotron_list))
}