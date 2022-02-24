# Building a Prod-Ready, Robust Shiny Application.
# 
# README: each step of the dev files is optional, and you don't have to 
# fill every dev scripts before getting started. 
# 01_start.R should be filled at start. 
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
# 
# 
########################################
#### CURRENT FILE: ON START SCRIPT #####
########################################

## Fill the DESCRIPTION ----
## Add meta data about your application
## 
## /!\ Note: if you want to change the name of your app during development, 
## either re-run this function, call golem::set_golem_name(), or don't forget
## to change the name in the app_sys() function in app_config.R /!\
## 
golem::fill_desc(
  pkg_name = "myGolemApp", # The Name of the package containing the App 
  pkg_title = "A Golem app", # The Title of the package containing the App 
  pkg_description = "A simple Shiny app built to demonstrate the usage of the Golem framework. 
                     It allows you to explore the data related to the Harry Potter movies.
                     The original data comes from kaggle (https://www.kaggle.com/gulsahdemiryurek/harry-potter-dataset).
                     Due to greater portability, the data is built into this package and does not need to be loaded manually.
                     The application itself is very simple, made with the aim of demonstrating the use of some of the basic
                     functionalities and benefits of the Golem framework.", # The Description of the package containing the App 
  author_first_name = "Tom", # Your First Name
  author_last_name = "Riddle", # Your Last Name
  author_email = "you-know-who@sbgenomics.com", # Your Email
  repo_url = "https://github.com/marko3f/mygolemapp.git" # The URL of the GitHub Repo (optional) 
)     

## Set {golem} options ----
golem::set_golem_options(golem_version = "0.0.1")

## Create Common Files ----
## See ?usethis for more information
usethis::use_mit_license( "Seven Bridges" )  # You can set another license here
usethis::use_readme_rmd( open = FALSE )      # Used
usethis::use_code_of_conduct()
usethis::use_lifecycle_badge( "Experimental" )  # Used
usethis::use_news_md( open = FALSE )            # Used

## Use git ----
usethis::use_git()

## Init Testing Infrastructure ----
## Create a template for tests
golem::use_recommended_tests()

## Use Recommended Packages ----
golem::use_recommended_deps()

## Favicon ----
# If you want to change the favicon (default is golem's one)
golem::use_favicon() # path = "path/to/ico". Can be an online file. 
golem::remove_favicon()

## Add helper functions ----
golem::use_utils_ui()
golem::use_utils_server()

# You're now set! ----

# go to dev/02_dev.R
rstudioapi::navigateToFile( "dev/02_dev.R" )

