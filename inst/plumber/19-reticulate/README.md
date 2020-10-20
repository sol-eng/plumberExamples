
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Reticulated Plumber

The `reticulate` package enables enables interoperability between Python
and R. This example sources a [python script](add.py) and makes the
Python function available in a Plumber API endpoint.

## Endpoints

-   `/sum`: Return the sum of 2 values

## Definition

### [plumber.R](plumber.R)

``` r
library(plumber)
library(reticulate)

source_python("add.py")

#* @apiTitle Reticulated Plumber API

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b) {
  a <- as.numeric(a)
  b <- as.numeric(b)
  add(a, b)
}
```
