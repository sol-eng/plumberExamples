# plumberExamples

This package provides a collection of example APIs built in R using the [Plumber](https://rplumber.io) package.

These examples are meant to highlight common patterns and best practices. They can be used as compelling starting points when getting started with Plumber.

## Installation

You can install the development version of plumberExamples from GitHub with:

``` r
remotes::install_github("sol-eng/plumberExamples")
```

## Usage

There are two main uses cases for this package: running example APIs and examining their source code.

Example APIs can be run using the `plumb_api()` function:
```r
library(plumber)
plumb_api(package = "plumberExamples", name = "00-hello") %>%
  pr_run()
```

To view the source code associated with the API, add `edit = TRUE` to the function call:
```r
plumb_api(package = "plumberExamples", name = "00-hello", edit = TRUE)
```
