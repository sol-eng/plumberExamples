
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Simple ML Model

This example is a simplified example of the version in
[sol-eng/plumber-model](https://github.com/sol-eng/plumber-model), which
demonstrates how to build a Plumber endpoint for a machine learning
model.

## Endpoints

-   `/health-check`: Verify API is up and running
-   `/predict`: Generate predictions based on a provided set of input
    values

## Definition

### [plumber.R](plumber.R)

``` r
library(plumber)

# Read in previously trained model
model <- readRDS("cars-model.rds")

#* @apiTitle Simple ML Model

#* API Health Check
#* @get /health-check
function() {
    list(
      "timestamp" = Sys.time(),
      "api-status" = "listening")
}

validate_data <- function(data) {
  length(intersect(names(data), c("cyl", "hp"))) == 2
}

#* Predict on input values
#* @post /predict
function(req, res) {
  if (!validate_data(req$body)) {
    res$status <- 400
    return(list(error = "No data submitted"))
  }
  predict(model, req$body)
}
```
