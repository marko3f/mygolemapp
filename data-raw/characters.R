## code to prepare `characters` dataset goes here
characters <- read.csv(file = "/Users/markotrifunovic/Desktop/test_test_test/harry_potter_data/data/Characters.csv", header = TRUE, row.names = NULL, sep = ";", na.strings=c("",""))
usethis::use_data(characters, overwrite = TRUE)
