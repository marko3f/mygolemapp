#' character_mentions UI Function
#'
#' @description This module function has to be set in the UI part of a shiny 
#' application. It adds a container for a plot The plot will be located
#' inside the shinydashboard::box.
#'
#' @param id A string id that will be used to create a namespace.
#'
#' @importFrom shiny NS tagList span icon plotOutput
#' 
#' @return UI plot container.
#' 
#' @examples
#' \dontrun{
#' # In UI :
#' mod_character_mentions_ui("characters_mentions_plot")
#' # In Server
#' mod_character_mentions_server(id = "characters_mentions_plot", movie_selector = reactive(input$movie_script_selector), movie_script = movie_script_selection)
#' }
#' 
#' @noRd
mod_character_mentions_ui <- function(id){
  ns <- NS(id)
  tagList(
    shinydashboard::box(
      title = span( icon("chart-bar"), "Distribution Plot"),
      status = "primary",
      solidHeader = TRUE,
      width = "100%",
      plotOutput(ns("character_mentions_plot"))
    ) 
  )
}
    
#' character_mentions Server Functions
#'
#' @description This function has to be set in the Server part of a shiny application.
#' It is a server counterpart to the mod_character_mentions_ui function. 
#' The function defines server code for plot rendering. 
#' 
#' @param id A string id that will be used to create a namespace.
#' 
#' @param movie_selector The name of the movie script. Should be a string value from 
#' a selectInput element.
#' 
#' @param movie_script A data frame containing movie script data.
#'
#' @importFrom shiny renderPlot
#'
#' @importFrom ggplot2 ggplot aes geom_bar xlab ylab theme ggtitle element_text
#'
#' @return Server logic for plot rendering.
#'
#' @examples
#' \dontrun{
#' # In UI :
#' mod_character_mentions_ui("characters_mentions_plot")
#' # In Server
#' mod_character_mentions_server(id = "characters_mentions_plot", movie_selector = reactive(input$movie_script_selector), movie_script = movie_script_selection)
#' }
#' 
#' @noRd
mod_character_mentions_server <- function(id, movie_selector, movie_script){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$character_mentions_plot <- renderPlot({
      ggplot2::ggplot(movie_script(), ggplot2::aes(x = reorder(character,character,
                                           function(x)-length(x)))) +
        geom_bar(fill = "#14304d") +
        ggtitle(paste("How Many Times Each Character Spoke in the", as.character(movie_selector()))) +
        xlab("Characters") + 
        ylab("Number of times mentioned") +
        theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1), 
              plot.title = element_text(hjust = 0.5))
    })
 
  })
}
    
## To be copied in the UI
# mod_character_mentions_ui("character_mentions_ui_1")
    
## To be copied in the server
# mod_character_mentions_server("character_mentions_ui_1")
