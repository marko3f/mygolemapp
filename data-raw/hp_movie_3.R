## code to prepare `hp_movie_3` dataset goes here
hp_movie_3 <- read.csv(file = "/Users/markotrifunovic/Desktop/test_test_test/harry_potter_data/data/Harry Potter 3.csv", header = TRUE, row.names = NULL, sep = ";")
usethis::use_data(hp_movie_3, overwrite = TRUE)
