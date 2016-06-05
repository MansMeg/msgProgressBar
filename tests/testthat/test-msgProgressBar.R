
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

test_that(desc="expect iterator",{
  test_bar <- function(iter){
    bar <- msgProgressBar(iter)
    for(j in seq_along(iter)){
      bar$increment()
      Sys.sleep(0.1/j)
    }
  }  
  expect_message(test_bar(rep(c("a", "b"), 5)), regexp = "25%")
  expect_message(test_bar(1:10), regexp = "|=+|")
})

test_that(desc="expect different increment step",{
  test_bar <- function(iter){
    bar <- msgProgressBar(iter)
    for(j in 1:(iter/2)){
      bar$increment(2)
      Sys.sleep(0.1/j)
    }
  }  
  expect_message(test_bar(10), regexp = "25%")
  expect_message(test_bar(10), regexp = "|=+|")
})

