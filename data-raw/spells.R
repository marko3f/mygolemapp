## code to prepare `spells` dataset goes here
spells <- read.csv(file = "/Users/markotrifunovic/Desktop/test_test_test/harry_potter_data/data/Spells.csv", header = TRUE, row.names = NULL, sep = ";", na.strings=c("",""))

usethis::use_data(spells, overwrite = TRUE)
