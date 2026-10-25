project_filters <- function(categories, data){
  counts <- table(trimws(data$Category))
  chip <- function(label, value, n, active = FALSE){
    tags$button(
      type = "button",
      class = paste("filter-chip", if(active) "active"),
      `data-filter` = value,
      `aria-pressed` = if(active) "true" else "false",
      label,
      span(class = "filter-count", n)
    )
  }
  div(
    class = "project-filters",
    role = "group",
    `aria-label` = "Filter projects",
    chip("All", "all", nrow(data), active = TRUE),
    lapply(categories, function(cat) chip(cat, cat, counts[[cat]]))
  )
}

project_sub_sections <- function(filterName, data){
  div(
    class = "animate-section project-group",
    `data-category` = filterName,
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
  
  dataUsed <- data %>% filter(trimws(Category) == filterName)
  
  badge_class <- paste0("badge-", tolower(filterName))
  
  jumbotron_list <- lapply(1:nrow(dataUsed), function(i) {
    
    name        <- dataUsed[i, "Title"]
    link        <- dataUsed[i, "Link"]
    description <- if("Description" %in% colnames(dataUsed)) as.character(dataUsed[i, "Description"]) else NA_character_
    year        <- if("Year"        %in% colnames(dataUsed)) as.character(dataUsed[i, "Year"])        else NA_character_
    type_val    <- if("Type"        %in% colnames(dataUsed)) as.character(dataUsed[i, "Type"])        else NA_character_
    tags        <- if("Tags"        %in% colnames(dataUsed)) as.character(dataUsed[i, "Tags"])        else NA_character_
    
    has_desc <- !is.na(description) && nchar(trimws(description)) > 0
    has_year <- !is.na(year)        && nchar(trimws(year)) > 0
    has_type <- !is.na(type_val)    && nchar(trimws(type_val)) > 0
    has_tags <- !is.na(tags)        && nchar(trimws(tags)) > 0
    has_link <- !is.na(link)        && nchar(trimws(link)) > 0
    
    div(
      class = "content",
      span(class = paste("card-category-badge", badge_class), filterName),
      div(class = "card-title", h4(name)),
      if(has_desc) p(class = "card-description", description),
      if(has_tags) div(
        class = "card-tags",
        lapply(trimws(strsplit(tags, ";")[[1]]), function(tag) span(class = "card-tag", tag))
      ),
      if(has_year || has_type) div(
        class = "card-meta",
        if(has_year) span(class = "card-meta-item", trimws(year)),
        if(has_type) span(class = "card-meta-item", trimws(type_val))
      ),
      if(has_link) div(
        class = "card-footer",
        a(HTML("Learn More &rarr;"), href = trimws(link), target = "_blank", class = "card-link")
      )
    )
  })
  
  as.character(do.call(tagList, jumbotron_list))
}

skills_sub_sections <- function(filterName, data, label = filterName){
  div(
    class = "animate-section skills-group",
    h3(
      class = "projects-subtitle",
      label
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
      title = paste0(name, ": ", level, "/5"),
      img(
        class = "imgSkills",
        src = str_glue("skills/", image),
        alt = ""
      ),
      h5(name),
      div(
        class = "skill-level",
        role = "img",
        `aria-label` = paste0("Level ", level, " out of 5"),
        lapply(1:5, function(j) span(class = paste("skill-dot", if(j <= level) "filled")))
      )
    )
  })
  
  as.character(do.call(tagList, jumbotron_list))
  
}

render_life_journey <- function(data){
  
  journey_list <- lapply(1:nrow(data), function(i) {
    date <- data[i, "Date"]
    fact <- data[i, "Fact"]
    
    is_current <- grepl("present", date, ignore.case = TRUE)
    
    tags$li(
      class = paste("journey-box", if(is_current) "current"),
      span(class = "journey-date", date),
      p(class = "journey-fact", fact)
    )
  })
  as.character(do.call(tagList, journey_list))
}