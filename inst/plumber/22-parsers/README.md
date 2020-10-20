
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Parsers

[Body parses](https://www.rplumber.io/reference/parsers.html) transform
the request body received by the API into an R object that can be used
by each endpoint.

## Endpoints

-   `/json`: Parse JSON from request
-   `/csv`: Parse CSV from request

## Definition

### [plumber.R](plumber.R)

``` r
library(plumber)

#* @post /json
function(req, res) {
  list(
    message = "Body parsed as JSON",
    body = req$body
  )
}

#* @post /csv
function(req, res) {
  list(
    message = "Body parsed as CSV",
    body = req$body
  )
}
```
