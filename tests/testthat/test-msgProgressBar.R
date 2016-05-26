
context("msgProgressBar")

test_that(desc="expect working example",{
  test_bar <- function(i = 10){
    bar <- msgProgressBar(i)
    for(j in 1:i){
      bar$increment()
      Sys.sleep(0.1/i)
    }
  }  
  expect_message(test_bar(100), regexp = "25%")
  expect_message(test_bar(100), regexp = "|=+|")
})

test_that(desc="expect silent constructor",{
  expect_silent(msgProgressBar(100))
})



