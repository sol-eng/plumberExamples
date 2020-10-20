
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Welcome

A simple API with a single endpoint that returns HTML indicating Plumber
is running.

## Endpoints

-   `/`: HTML indicating plumber is alive

## Definition

### [plumber.R](plumber.R)

``` r
#* @serializer html
#* @get /
function(){
  "<html><body><h1>Plumber is alive!</h1></body></html>"
}
```
