msgProgressBar
======

[![Build Status](https://travis-ci.org/MansMeg/msgProgressBar.svg?branch=master)](https://travis-ci.org/MansMeg/msgProgressBar)
[![Coverage Status](https://coveralls.io/repos/MansMeg/msgProgressBar/badge.svg)](https://coveralls.io/r/MansMeg/msgProgressBar) [![rstudio mirror downloads](http://cranlogs.r-pkg.org/badges/grand-total/msgProgressBar)](https://github.com/metacran/cranlogs.app)
[![cran version](http://www.r-pkg.org/badges/version/msgProgressBar)](http://cran.rstudio.com/web/packages/msgProgressBar)

msgProgressBar is an equivalent to use txtProgressBar but uses `message()`instead of cat to print out the progress bar. This is good to use in R packages or in functions where one would like to supresse the progressbar using `suppressMessages()`.

### Installation
Currently the package is not on CRAN. Please install directly from github:
```
devtools::install_github("MansMeg/msgProgressBar")
```

### Usage
```
> test_bar <- function(i = 10){
+   bar <- msgProgressBar::msgProgressBar(i)
+   for(j in 1:i){
+     bar$increment()
+     Sys.sleep(4/i)
+     }
+   }
> test_bar(100)
|                   25%                    50%                    75%                   |
|=======================================================================================|
```

Author: [Måns Magnusson](https://github.com/MansMeg/)
  
You are welcome to contact:
  * [submit suggestions and bug reports](https://github.com/MansMeg/msgProgressBar/issues) (provide the output of `sessionInfo()` and `packageVersion("msgProgressBar")`)
  * [send a pull request]((https://github.com/MansMeg/msgProgressBar/)



