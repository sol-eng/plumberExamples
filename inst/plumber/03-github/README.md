
<!-- README.md is generated from README.Rmd. Please edit that file -->

# GitHub

This example highlights how a Plumber API can be used in connection with
a GitHub webhook to automatically update the Plumber package anytime an
update a pushed to the GitHub repository.

Note this requires a valid GitHub key stored as `github-key.txt` in
order to properly work.

## Endpoints

-   `/version`: Return information about the currently installed version
    of Plumber
-   `/update`: Checks to ensure the incoming request is an authenticated
    GitHub request, then updates the system installed version of
    Plumber.

## Definition

### [plumber.R](plumber.R)

``` r
#* Get information about the currently available
#* @get /version
function(){
  desc <- read.dcf(system.file("DESCRIPTION", package="plumber"))
  resp <- list(
    version = unname(desc[1,"Version"]),
    built = unname(desc[1,"Built"])
  )

  if ("GithubSHA1" %in% colnames(desc)){
    resp["sha1"] <- unname(desc[1,"GithubSHA1"])
  }

  resp
}

#* Give GitHub Webhook a way to alert us about new pushes to the repo
#* https://developer.github.com/webhooks/
#* @post /update
function(req, res){
  secret <- readLines("./github-key.txt")[1]
  hm <- digest::hmac(secret, req$postBody, algo="sha1")
  hm <- paste0("sha1=", hm)
  if (!identical(hm, req$HTTP_X_HUB_SIGNATURE)){
    res$status <- 400
    res$body <- "invalid GitHub signature."
    return(res)
  }

  # DO...
  devtools::install_github("rstudio/plumber")

  TRUE
}
```
