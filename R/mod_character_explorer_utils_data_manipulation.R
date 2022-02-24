#' basic_characters_data_manipulation function
#' 
#' @description Utility function for the mod_character_explorer module.
#' The function takes a data set (the one containing basic information about
#' characters from Harry Potter movies) and performs some simple 
#' manipulation over that data. 
#' 
#' Since this is a simple utility function, it does not need to be documented
#' in detail.
#' 
#' @return Filtered data frame.
#' 
#' @noRd

basic_characters_data_manipulation <- function(characters_dataset, selected_character, columns_to_exclude = c("Id")) {
  # Filter data such that the resulting data frame contains only the data
  # for the selected character + exclude specified columns
  filtered_data <- characters_dataset %>% 
    dplyr::filter(Name == selected_character) %>% 
    dplyr::select(-columns_to_exclude)
  
  # Remove dots from column names
  names(filtered_data) <- gsub("\\.", " ", names(filtered_data))
  
  return(filtered_data)
}