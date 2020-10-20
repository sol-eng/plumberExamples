
<!-- README.md is generated from README.Rmd. Please edit that file -->

# User Interface

The default user interface for Plumber APIs is
[Swagger](https://swagger.io/). Since Plumber APIs are based on the
OpenAPI Specification, other common interfaces can be used. Two
additional interfaces that are currently supported are
[ReDoc](https://github.com/Redocly/redoc) and
[RapiDoc](https://mrin9.github.io/RapiDoc/). There are in-development
GitHub packages that make using these interfaces with Plumber fairly
straightforward:

-   ReDoc: <https://github.com/meztez/redoc>
-   RapiDoc: <https://github.com/meztez/rapidoc>

## Endpoints

-   `/echo`: Echo back the input
-   `/plot`: Return a histogram of 100 random normal values
-   `/sum`: Return the sum of 2 values

## Definition

### [plumber.R](plumber.R)

``` r
library(plumber)
library(rapidoc)

#* @apiTitle RapiDoc UI

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

#* @plumber
function(pr) {
  pr %>%
    pr_set_docs("rapidoc")
}
```
