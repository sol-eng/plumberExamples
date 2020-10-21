
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Hello World, Plumber

This is the default starter example for Plumber APIs.

## Endpoints

-   `/echo`: Echo back the input
-   `/plot`: Return a histogram of 100 random normal values
-   `/sum`: Return the sum of 2 values

## Definition

### [plumber.R](plumber.R)

``` r
#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)

#* @apiTitle Plumber Example API

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg = "") {
    list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @serializer png
#* @get /plot
function() {
    rand <- rnorm(100)
    hist(rand)
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b) {
    as.numeric(a) + as.numeric(b)
}
```
