#' Message progress bar
#' 
#' @description 
#' A simple progress bar to use in R packages where messages are prefered to console output.
#' 
#' @field iter Total number of iterations
#' @field i Current iteration
#' @field width Width of the R console
#' @field width_bar Width of the progress bar
#' @field progress The number of character printed (continous)
#' @field progress_step Addition to progress per iteration
#' 
#' @examples
#' test_bar <- function(i = 10){
#'   bar <- msgProgressBar(i)
#'   for(j in 1:i){
#'     bar$increment()
#'     Sys.sleep(4/i)
#'   }
#' }
#' test_bar(100)
#'  
#' i <- 10
#' bar <- msgProgressBar(1:i)
#' for(j in 1:(i/2)){
#'   bar$increment(2)
#'   Sys.sleep(3/i)
#' }
#' 
#' 
#'
#' @importFrom methods new
#' @export msgProgressBar
#' @exportClass msgProgressBar
msgProgressBar <- 
  setRefClass(
    Class = "msgProgressBar", 
    fields = list(iter = "numeric",
                  i = "numeric",
                  progress = "numeric",
                  progress_step = "numeric",
                  width = "numeric",
                  width_bar = "numeric"),
    
    methods = list(
      initialize = function(iter){
        'Initialize a messagebar object'
        .self$width <- getOption("width")
        if(is.numeric(iter) & length(iter) == 1){
          .self$iter <- iter
        } else {
          .self$iter <- length(iter)
        }
        .self$i <- 0
        .self$progress <- 0
        .self$width_bar <- 0
      },
      
      increment = function(i = 1){
        'Increment the message bar iterator.'
        for(j in 1:i){
          if(.self$i == 0){
            white_part <- paste(rep(" ", (.self$width - 11) %/% 4), collapse="")
            init_length <- .self$width - ((.self$width - 11) %/% 4) * 4 - 11
            white_init <- paste(rep(" ", init_length), collapse="")
            .self$width_bar <- .self$width - init_length - 2 + 0.1
            .self$progress_step <- .self$width_bar / .self$iter
            
            message(paste(white_init, "|", 
                          white_part, "25%", 
                          white_part, "50%", 
                          white_part, "75%", 
                          white_part, "|","\n", 
                          white_init, "|", sep=""), 
                    appendLF = FALSE)
          }
          
          if(.self$i > .self$iter) return(invisible(NULL))
          new_progress <- .self$progress + .self$progress_step
          diff_in_char <- floor(new_progress) - floor(.self$progress)
          if(diff_in_char > 0) {
            message(paste(rep("=", diff_in_char),collapse=""), appendLF = FALSE)
          }
          
          .self$progress <- new_progress
          .self$i <- .self$i + 1
          if(.self$i == .self$iter) message("|\n", appendLF = FALSE)
          
          }
      }
    )
  )