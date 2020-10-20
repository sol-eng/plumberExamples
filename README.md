
<!-- README.md is generated from README.Rmd. Please edit that file -->

# plumberExamples

This package provides a collection of example APIs built in R using the
[Plumber](https://rplumber.io) package.

These examples are meant to highlight common patterns and best
practices. They can be used as compelling starting points when getting
started with Plumber.

## Installation

You can install the development version of plumberExamples from GitHub
with:

``` r
remotes::install_github("sol-eng/plumberExamples")
```

## Usage

There are two main uses cases for this package: running example APIs and
examining their source code.

Example APIs can be run using the `plumb_api()` function:

``` r
library(plumber)
plumb_api(package = "plumberExamples", name = "00-hello") %>%
  pr_run()
```

To view the source code associated with the API, add `edit = TRUE` to
the function call:

``` r
plumb_api(package = "plumberExamples", name = "00-hello", edit = TRUE)
```

## Examples

There are currently 23 examples in this package. Each example is located
in [`/inst/plumber`](inst/plumber) and can be accessed using the
previously described `plumb_api()` function:

| Example          | Path                                                           |
|:-----------------|:---------------------------------------------------------------|
| 00-hello-world   | [inst/plumber/00-hello-world](inst/plumber/00-hello-world)     |
| 01-append        | [inst/plumber/01-append](inst/plumber/01-append)               |
| 02-filters       | [inst/plumber/02-filters](inst/plumber/02-filters)             |
| 03-github        | [inst/plumber/03-github](inst/plumber/03-github)               |
| 04-mean-sum      | [inst/plumber/04-mean-sum](inst/plumber/04-mean-sum)           |
| 05-static        | [inst/plumber/05-static](inst/plumber/05-static)               |
| 06-sessions      | [inst/plumber/06-sessions](inst/plumber/06-sessions)           |
| 07-mailgun       | [inst/plumber/07-mailgun](inst/plumber/07-mailgun)             |
| 08-identity      | [inst/plumber/08-identity](inst/plumber/08-identity)           |
| 09-content-type  | [inst/plumber/09-content-type](inst/plumber/09-content-type)   |
| 10-welcome       | [inst/plumber/10-welcome](inst/plumber/10-welcome)             |
| 11-car-inventory | [inst/plumber/11-car-inventory](inst/plumber/11-car-inventory) |
| 12-entrypoint    | [inst/plumber/12-entrypoint](inst/plumber/12-entrypoint)       |
| 13-promises      | [inst/plumber/13-promises](inst/plumber/13-promises)           |
| 14-future        | [inst/plumber/14-future](inst/plumber/14-future)               |
| 15-openapi-spec  | [inst/plumber/15-openapi-spec](inst/plumber/15-openapi-spec)   |
| 16-attachment    | [inst/plumber/16-attachment](inst/plumber/16-attachment)       |
| 17-arguments     | [inst/plumber/17-arguments](inst/plumber/17-arguments)         |
| 18-logging       | [inst/plumber/18-logging](inst/plumber/18-logging)             |
| 19-reticulate    | [inst/plumber/19-reticulate](inst/plumber/19-reticulate)       |
| 20-simple-model  | [inst/plumber/20-simple-model](inst/plumber/20-simple-model)   |
| 21-ui            | [inst/plumber/21-ui](inst/plumber/21-ui)                       |
| 22-parsers       | [inst/plumber/22-parsers](inst/plumber/22-parsers)             |
