
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Entrypoint

**Note: As of verison 1.0.0, `entrypoint.R` is deprecated in favor of
using `#* @plumber` tags in a standard Plumber definition file.**

`entrypoint.R` can be used to further modify an existing Plumber API
router.

## Endpoints

-   `/counter`: Return visit count

## Definition

### [myplumberapi.R](myplumberapi.R)

``` r
#* @get /counter
function(req){
  count <- 0
  if (!is.null(req$session$counter)){
    count <- as.numeric(req$session$counter)
  }
  req$session$counter <- count + 1
  return(paste0("This is visit #", count))
}
```

### [entrypoint.R](entrypoint.R)

``` r
pr <- plumb("myplumberapi.R")
pr$registerHook("preroute", sessionCookie("secret", "cookieName"))

pr
```
