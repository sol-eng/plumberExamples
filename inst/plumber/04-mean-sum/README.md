
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Mean and Sum

Simple examples showing two numeric API endpoints.

## Endpoints

  - `/mean`: Return the mean of `n` random samples from a normal
    distribution
  - `/sum`: Return the sum of two values.

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

### [Tidy plumber](tidy-plumber.R)

``` r
library(plumber)

pr() %>% 
  pr_get(path = "/mean",
         handler = function(samples=10){
           data <- rnorm(samples)
           mean(data)
         }) %>% 
  pr_post(path = "/sum",
          handler = function(a, b){
            as.numeric(a) + as.numeric(b)
          }) %>% 
  pr_run()
```
