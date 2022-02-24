#' render_data_table UI Function
#'
#' @description This function has to be set in the UI part of a shiny 
#' application. It adds a container for a table. The table will be located
#' inside the shinydashboard::box for which the user can set the title and
#' the accompanying icon.
#'
#' @param id A string id that will be used to create a namespace. 
#' 
#' @param type_of_data A string description of the type of data used as the box title.
#' 
#' @param title_icon String indicating the type of icon to be added to the box title.
#' Note that only existing fontawesome icons can be used.
#'
#' @importFrom shiny NS tagList span icon
#' @importFrom shinydashboard box
#' @importFrom stringr str_to_title
#' 
#' @return UI table element.
#' 
#' @examples
#' \dontrun{
#' # In UI :
#' mod_render_data_table_ui('potions_table', type_of_data = 'potions', title_icon = 'wine-bottle')
#' # In Server
#' mod_render_data_table_server(id = 'potions_table', my_data = myGolemApp::potions)
#' }
#' 
#' @noRd
mod_render_data_table_ui <- function(id, type_of_data, title_icon = "magic"){
  ns <- NS(id)
  tagList(
    shinydashboard::box(
      title = span( icon(title_icon), stringr::str_to_title(type_of_data)),
      status = "primary",
      solidHeader = TRUE,
      width = "100%",
      DT::dataTableOutput(ns("my_table"))
    ) 
  )
}
    
#' render_data_table Server Functions
#' 
#' @description This function has to be set in the Server part of a shiny application.
#' It is a server counterpart to the mod_render_data_table_ui function. 
#' The function defines server code for table rendering. 
#' 
#' @param id A string id that will be used to create a namespace. 
#' 
#' @param input,output,session Internal parameters for {shiny}.
#' 
#' @return Server logic for table rendering.
#' 
#' #' @examples
#' \dontrun{
#' # In UI :
#' mod_render_data_table_ui('potions_table', type_of_data = 'potions', title_icon = 'wine-bottle')
#' # In Server
#' mod_render_data_table_server(id = 'potions_table', my_data = myGolemApp::potions)
#' }
#' 
#' @noRd
mod_render_data_table_server <- function(id, my_data){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$my_table <- DT::renderDataTable({
      my_data
    })
  })
}
    
## To be copied in the UI
# mod_render_data_table_ui("render_data_table_ui_1")
    
## To be copied in the server
# mod_render_data_table_server("render_data_table_ui_1")
