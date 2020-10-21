
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Mean and Sum

Simple examples showing two numeric API endpoints.

## Endpoints

-   `/mean`: Return the mean of `n` random samples from a normal
    distribution
-   `/sum`: Return the sum of two values.

## Definition

### [plumber.R](plumber.R)

``` r
#* @get /mean
normalMean <- function(samples=10){
  data <- rnorm(samples)
  mean(data)
}

#* @post /sum
addTwo <- function(a, b){
  as.numeric(a) + as.numeric(b)
}
```
