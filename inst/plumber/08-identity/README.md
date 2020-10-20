
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Identity

A simple API that returns information about the system it’s running on.

## Endpoints

-   `/name`: The `nodename` of the server receiving the request

## Definition

### [plumber.R](plumber.R)

``` r
#* @get /name
function(){
    Sys.info()[["nodename"]]
}
```
