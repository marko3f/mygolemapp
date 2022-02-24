#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  
  # Call server part for the character_explorer module
  mod_character_explorer_server(id = "characters_table",
                                my_data = myGolemApp::characters,  # built-in data
                                character = reactive(input$character))
  # If a module needs to access an input that isn’t part of the module,
  # the containing app should pass the input value wrapped in a reactive expression

  # Load movie script data for the selected movie (reactive variable)
  movie_script_selection <- eventReactive(input$movie_script_selector, {
    if (input$movie_script_selector == "Harry Potter and the Philosopher's Stone") {
      load_and_manipulate_script_data(data = myGolemApp::hp_movie_1)  # built-in data
    } else if (input$movie_script_selector == "Harry Potter and the Chamber of Secrets") {
      load_and_manipulate_script_data(data = myGolemApp::hp_movie_2)  # built-in data
    } else if (input$movie_script_selector == "Harry Potter and the Prisoner of Azkaban") {
      load_and_manipulate_script_data(data = myGolemApp::hp_movie_3)  # built-in data
    }
  })
  
  # Call server part for the character_mentions module
  mod_character_mentions_server(id = "character_mention_distribution_plot",
                                movie_selector = reactive(input$movie_script_selector),
                                movie_script = movie_script_selection)
  # If a module needs to access an input that isn’t part of the module, 
  # the containing app should pass the input value wrapped in a reactive expression
  
  
  # Call server part for the render_data_table module
  # Note that we are using the same module twice - with different IDs and for different data
  mod_render_data_table_server(id = 'spells_table',
                               my_data = myGolemApp::spells)  # use built-in data
  
  mod_render_data_table_server(id = 'potions_table',
                               my_data = myGolemApp::potions) # use built-in data
  
  
  # Add observe event for button on the landing page
  # This button changes the background color of the app depending on 
  # the user's selection 
  observeEvent(input$alert, {
    
    # Set background color url depending on the selected Hogwards house
    background_color_url <- background_selection(selection = input$chose_your_house)
    
    golem::invoke_js("update_background", background_color_url)
    
    ## The same could be achieved in this way:
    # message(background_color)
    #  session$sendCustomMessage(
    #   type = "update_background",
    #   message = background_color_url
    # )
  })
  
}
