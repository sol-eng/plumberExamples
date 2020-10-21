
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Tidy Plumber

Version 1.0.0 of Plumber introduced a “tidy interface” for Plumber APIs
that dramatically simplifies programmatically building APIs.

## Endpoints

-   `/echo`: Echo back the input
-   `/plot`: Return a histogram of 100 random normal values
-   `/sum`: Return the sum of 2 values

## Definition

### [plumber.R](plumber.R)

``` r
library(plumber)

#* @plumber
function(pr) {
  pr() %>%
    pr_get(path = "/echo",
           handler = function(msg = "") {
             list(msg = paste0("The message is: '", msg, "'"))
           }) %>%
    pr_get(path = "/plot",
           handler = function() {
             rand <- rnorm(100)
             hist(rand)
           },
           serializer = serializer_png()) %>%
    pr_post(path = "/sum",
            handler = function(a, b) {
              as.numeric(a) + as.numeric(b)
            }) %>%
    pr_run()
}
```
