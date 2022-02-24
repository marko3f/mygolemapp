#' load_and_manipulate_script_data function
#'
#' @description A utility function that loads data and converts column names
#' to lower case.
#' 
#' @param data A data frame containing a script from one of the Harry Potter movies.
#' 
#' #' Since this is a simple utility function, it does not need to be documented
#' in detail.
#'
#' @return Loaded data frame.
#'
#' @noRd
load_and_manipulate_script_data <- function(data) {
  movie_script_data <- data
  colnames(movie_script_data) <- tolower(colnames(movie_script_data))
  return(movie_script_data)
}



#' background_selection function
#'
#' @description A utility function that sets specific background image url depending on the 
#' House selection.
#' 
#' Since this is a simple utility function, it does not need to be documented
#' in detail.
#' 
#' @param selection A string that represents the selected background. Available options are:
#' * Default
#' * Gryffindor
#' * Hufflepuff
#' * Ravenclaw
#' * Slytherin
#'
#' @return URL for background image.
#'
#' @noRd
background_selection <- function(selection) {
  if (selection == "Default") {
    background_color <- ""
  } else if (selection == "Gryffindor") {
    background_color <- "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Gryffindorcolours.svg/800px-Gryffindorcolours.svg.png"
  } else if (selection == "Hufflepuff") {
    background_color <- "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Hufflepuff_colours.svg/800px-Hufflepuff_colours.svg.png"
  } else if (selection == "Ravenclaw") {
    background_color <- "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Ravenclawcolours.svg/800px-Ravenclawcolours.svg.png"
  } else if (selection == "Slytherin") {
    background_color <- "https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Slytherin_colours.svg/800px-Slytherin_colours.svg.png"
  }
  return(background_color)
}