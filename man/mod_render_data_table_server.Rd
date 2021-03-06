% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_render_data_table.R
\name{mod_render_data_table_server}
\alias{mod_render_data_table_server}
\title{render_data_table Server Functions}
\usage{
mod_render_data_table_server(id, my_data)
}
\arguments{
\item{id}{A string id that will be used to create a namespace.}

\item{input, output, session}{Internal parameters for {shiny}.}
}
\value{
Server logic for table rendering.

#' @examples
\dontrun{
# In UI :
mod_render_data_table_ui('potions_table', type_of_data = 'potions', title_icon = 'wine-bottle')
# In Server
mod_render_data_table_server(id = 'potions_table', my_data = myGolemApp::potions)
}
}
\description{
render_data_table Server Functions
}
