
<!-- README.md is generated from README.Rmd. Please edit that file -->

# OpenAPI Spec

This API demonstrates how to manipulate the OpenAPI spec file used to
generated the Plumber UI.

## Endpoints

-   `/sum`: Return the sum of the provided array of values

## Definition

### [plumber.R](plumber.R)

``` r
library(plumber)

#* @get /sum
function(num) {
  num_parsed <- unlist(strsplit(num, ","))
  sum(as.integer(num_parsed))
}

#* @plumber
function(pr) {
  pr %>%
    pr_set_api_spec(function(spec) {
      spec$paths[["/sum"]]$get$summary <- "Sum numbers"
      spec$paths[["/sum"]]$get$parameters <- list(list(
        "description" = "numbers",
        "required" = TRUE,
        "in" = "query",
        "name" = "num",
        "schema" = list("type" = "array", "items" = list("type" = "integer"), "minItems" = 1),
        "style" = "form",
        "explode" = FALSE
      ))
      spec
    })
}
```
