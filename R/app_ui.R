#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    # By default, golem uses a fluidPage(), but here we'll go with  the navbarPage...
    navbarPage(
      windowTitle = "Harry Potter 1-2-3",
      id = "HP_navbar_page",
      title = div(
        tags$a(
          href="https://www.sevenbridges.com/platform/",
          target="_blank",
          tags$img(src="www/logo.svg",
                   title="SevenBridges",
                   style = "margin:5px 0px 20px 0px;")
        ),
        br(), 
        HTML("&emsp;&emsp;&emsp;&emsp;&emsp;")
      ),
      tabPanel(
        title = "Home",
        icon = icon("home"),
        value = "landing_page",
        column(
          width = 4, offset = 4,
          shinydashboard::box(
            title = "",
            status = "primary",
            solidHeader = TRUE,
            width = "100%",
            h1("myGolemApp", style = "color:#b30000; text-align: center; font-size:44px;"),
            rep_br(2),
            div(
              class = "tagline",
              style = "text-align:justify",
              includeMarkdown(app_sys("app/www/landing.md"))
            ),
            rep_br(2),
            div(
              align = "center",
              selectInput(inputId = "chose_your_house",
                          label = "Chose your house colors",
                          choices = c("Default", "Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"),
                          multiple = FALSE,
                          selected = "Default"),
              actionButton("alert", "Apply") 
            )
          )
        ),
      ),
      
      tabPanel(
        title = "Movie Scripts Data",
        icon = icon("film"),
        value = "movies",
        mod_character_mentions_ui("character_mention_distribution_plot")
      ),
      
      tabPanel(
        title = "Characters",
        icon = icon("hat-wizard"),
        value = "character_explore",
        #includeCSS(path = "bootsbg.css"),   # there is no need to explicitly load this file
        sidebarPanel(
          width = 3,
          selectInput(inputId = "character",
                      label = "Select character",
                      choices = myGolemApp::characters$Name,
                      multiple = FALSE,
                      selected = myGolemApp::characters$Name[1])
        ),

        mainPanel(
          width = 9,
          mod_character_explorer_ui("characters_table")
        )
      ),
      
      tabPanel(
        title = "Explore Spells & Potions",
        icon = icon("magic"),
        value = "spells_and_potions",
        # includeCSS(path = "app/www/custom.css"),   # there is no need to explicitly load this file
        column(6,
               mod_render_data_table_ui('spells_table', type_of_data = 'spells'),
        ),
        column(6,
               mod_render_data_table_ui('potions_table', type_of_data = 'potions', title_icon = 'wine-bottle')
        )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    #favicon(), # We will use our own, custom favicon - harry_potter.ico
    # we just need to make sure that we have the harry_potter.ico file inside
    # the inst/app/www folder
    favicon(
      ico = "harry_potter",
      rel = "shortcut icon",
      resources_path = "www",
      ext = "ico"
    ),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'myGolemApp'
    ),
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
    shinyWidgets::useShinydashboard()
  )
}

