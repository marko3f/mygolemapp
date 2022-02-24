test_that("background url selection works", {
  # Gryffindor check
  expect_equal(object = background_selection(selection = "Gryffindor"), 
               expected = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Gryffindorcolours.svg/800px-Gryffindorcolours.svg.png", 
               label = "Something's is wrong with the url for the Gryffindor background image. Please check if the original image url (https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Gryffindorcolours.svg/800px-Gryffindorcolours.svg.png) is still active.")
  # Hufflepuff check
  expect_equal(object = background_selection(selection = "Hufflepuff"), 
               expected = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Hufflepuff_colours.svg/800px-Hufflepuff_colours.svg.png",
               label = "Something's is wrong with the url for the Hufflepuff background image. Please check if the original image url (https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Hufflepuff_colours.svg/800px-Hufflepuff_colours.svg.png) is still active.")
  # Ravenclaw check
  expect_equal(object = background_selection(selection = "Ravenclaw"), 
               expected = "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Ravenclawcolours.svg/800px-Ravenclawcolours.svg.png",
               label = "Something's is wrong with the url for the Ravenclaw background image. Please check if the original image url (https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Ravenclawcolours.svg/800px-Ravenclawcolours.svg.png) is still active.")
  # Slytherin check
  expect_equal(object = background_selection(selection = "Slytherin"),
               expected = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Slytherin_colours.svg/800px-Slytherin_colours.svg.png",
               label = "Something's is wrong with the url for the Slytherin background image. Please check if the original image url (https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Slytherin_colours.svg/800px-Slytherin_colours.svg.png) is still active.")
})
