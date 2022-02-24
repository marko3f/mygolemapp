## code to prepare `potions` dataset goes here
potions <- read.csv(file = "/Users/markotrifunovic/Desktop/test_test_test/harry_potter_data/data/Potions.csv", header = TRUE, row.names = NULL, sep = ";", na.strings=c("",""))
usethis::use_data(potions, overwrite = TRUE)
