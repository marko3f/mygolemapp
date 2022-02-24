#' character_explorer UI Function
#'
#' @description This module function has to be set in the UI part of a shiny 
#' application. It creates a "placeholder" for rendering a reactive output variable,
#' because uiOutput is intended to be used with renderUI on the server side.
#' 
#' mod_character_explorer_ui function should be used in conjunction with the
#' mod_character_explorer_server function.
#'
#' @param id A string id that will be used to create a namespace.
#'
#' @return UI placeholder.
#'
#' @importFrom shiny NS tagList 
#' 
#' @examples
#' \dontrun{
#' # In UI :
#' mod_character_explorer_ui("characters_table")
#' # In Server
#' mod_character_explorer_server(id = "characters_table", my_data = myGolemApp::characters, character = reactive(input$character))
#' }
#' 
#' @noRd 
mod_character_explorer_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("character_description"))
  )
}
    
#' character_explorer Server Functions
#'
#' @description This function has to be set in the Server part of a shiny
#' application.It is a server counterpart to the mod_character_explorer_ui
#' function. The function filters the provided data table (the one containing
#' characters from Harry Potter movies) such that the resulting data frame
#' contains the data for the selected character only. I also renders one
#' shinydashboard::box for each column of the resulting data frame.
#' 
#' @param id A string id that will be used to create a namespace.
#' 
#' @param id my_data A data frame containing the characters data from 
#' Harry Potter movies. 
#' 
#' @param_id character A string containing the name of the character from 
#' Harry Potter movies for whom some basic informations will be displayed.
#' 
#' @importFrom magrittr "%>%"
#' @importFrom dplyr filter select
#' @importFrom shinydashboard box
#' 
#' @examples
#' \dontrun{
#' # In UI :
#' mod_character_explorer_ui("characters_table")
#' # In Server
#' mod_character_explorer_server(id = "characters_table", my_data = myGolemApp::characters, character = reactive(input$character))
#' }
#' 
#' @noRd 
mod_character_explorer_server <- function(id, my_data, character){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    explore_character <- eventReactive(character(), {
      
      my_data_filtered <- basic_characters_data_manipulation(characters_dataset = my_data, selected_character = character(), columns_to_exclude = c("Id", "Name"))
      
      # Convert data frame into a list
      my_data_list <- as.list(my_data_filtered)
      
      # Loop through list elements and generate box for each value
      fluidRow(lapply(1:length(my_data_list), function(i) {
        shinydashboard::box(
          title = names(my_data_list)[i],
          status = "primary", solidHeader = TRUE,
          my_data_list[[i]]
        )
      }))
      
    })
    
    output$character_description <- renderUI({
      explore_character()
    })
  })
}
    
## To be copied in the UI
# mod_character_explorer_ui("character_explorer_ui_1")
    
## To be copied in the server
# mod_character_explorer_server("character_explorer_ui_1")
