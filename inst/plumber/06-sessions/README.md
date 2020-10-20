
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Sessions

This API demonstrates how values can be stored across essions.

## Endpoints

-   `/counter`: Return visit count stored via cookies
-   `/sessionCounter`: Return visit count stored within session object

## Definition

### [plumber.R](plumber.R)

``` r
#* Example using req$cookies
#* @get /counter
function(req, res) {
  count <- 0
  if (!is.null(req$cookies$visitcounter)) {
    count <- as.numeric(req$cookies$visitcounter)
  }
  # Most people won't need to concern themselves with the path argument.
  # I do because of some peculiarities in how I'm hosting the examples.
  res$setCookie("visitcounter", count+1, path="/")
  return(paste0("This is visit #", count))
}

#* Example using req$session
#* @get /sessionCounter
function(req){
  count <- 0
  if (!is.null(req$session$counter)){
    count <- as.numeric(req$session$counter)
  }
  req$session$counter <- count + 1
  return(paste0("This is visit #", count))
}

#* @assets static
list()

#* @plumber
function(pr) {
  pr %>%
    pr_hooks(session_cookie("secret", "cookieName"))
}
```
