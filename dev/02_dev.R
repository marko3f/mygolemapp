# Building a Prod-Ready, Robust Shiny Application.
# 
# README: each step of the dev files is optional, and you don't have to 
# fill every dev scripts before getting started. 
# 01_start.R should be filled at start. 
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
# 
# 
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Add one line by package you want to add as dependency
#usethis::use_package( "thinkr" ) # default
#usethis::use_package( "DT" )     # already included by default
usethis::use_package( "dplyr" )
usethis::use_package( "shinydashboard" )
usethis::use_package( "shinyWidgets" )
usethis::use_package( "ggplot2" )
usethis::use_package( "stringr" )


## Add modules ----
## Create a module infrastructure in R/
golem::add_module( name = "character_explorer" , utils = "data_manipulation") # Create Character Explorer module with 
golem::add_module( name = "character_mentions" ) # Create Character Mentions module
golem::add_module( name = "render_data_table" )  # Create Render Data Table module

## Add helper functions ----
## Creates fct_* and utils_*
golem::add_fct( "helpers" )
golem::add_utils( "helpers" )  # Used

## External resources
## Creates .js and .css files at inst/app/www
golem::add_js_file( "script" )
golem::add_js_handler( "set_background" ) # Used
golem::add_css_file( "custom" )  # Create empty custom.css file (inside inst/app/www directory)  # Used
golem::add_css_file( "bootsbg" ) # Create empty bootsbg.css file (inside inst/app/www directory) # Used

#golem::use_favicon( path = "/Users/markotrifunovic/Desktop/HarryPotterApp/myGolemApp/inst/app/www/harry_potter.ico")


## Add internal datasets ----
## If you have data in your package
usethis::use_data_raw( name = "characters", open = FALSE ) 
usethis::use_data_raw( name = "spells", open = FALSE ) 
usethis::use_data_raw( name = "potions", open = FALSE )
usethis::use_data_raw( name = "hp_movie_1", open = FALSE )
usethis::use_data_raw( name = "hp_movie_2", open = FALSE )
usethis::use_data_raw( name = "hp_movie_3", open = FALSE )

## Tests ----
## Add one line by test you want to create
usethis::use_test( "background_selection" )

# Documentation

## Vignette ----
usethis::use_vignette("myGolemApp")
devtools::build_vignettes()

## Code Coverage----
## Set the code coverage service ("codecov" or "coveralls")
usethis::use_coverage()

# Create a summary readme for the testthat subdirectory
covrpage::covrpage()  # Used - it's necessary to install covrpage package - remotes::install_github('yonicd/covrpage') - 
# covrpage::covrpage(auto_push = FALSE) 


## CI ----
## Use this part of the script if you need to set up a CI
## service for your application
## 
## (You'll need GitHub there)
usethis::use_github()

# GitHub Actions
usethis::use_github_action() 
# Chose one of the three
# See https://usethis.r-lib.org/reference/use_github_action.html
usethis::use_github_action_check_release() 
usethis::use_github_action_check_standard() 
usethis::use_github_action_check_full() 
# Add action for PR
usethis::use_github_action_pr_commands()

# Travis CI
usethis::use_travis() 
usethis::use_travis_badge() 

# AppVeyor 
usethis::use_appveyor() 
usethis::use_appveyor_badge()

# Circle CI
usethis::use_circleci()
usethis::use_circleci_badge()

# Jenkins
usethis::use_jenkins()

# GitLab CI
usethis::use_gitlab_ci()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")

