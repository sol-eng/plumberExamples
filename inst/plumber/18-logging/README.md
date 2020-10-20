
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Plumber Logging

This is a simplified version of the example in
[sol-eng/plumber-logging](https://github.com/sol-eng/plumber-logging).
This example highlights how Plumber APIs can be built with additional
logging in order to capture information about incoming requests.

## Endpoints

-   `/echo`: Echo back the input
-   `/plot`: Return a histogram of 100 random normal values

## Definition

### [plumber.R](plumber.R)

``` r
library(plumber)
library(logger)
library(glue)

# Path for log files
log_path <- "logs"

# Create log file directory if it doesn't exist
if (!fs::dir_exists(log_path)) fs::dir_create(log_path)

# Send logs both to stdout and the log directory
log_appender(appender_tee(tempfile("plumber_", log_path, ".log")))

#* @apiTitle Plumber Logging Example

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg = "") {
    list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @serializer png
#* @post /plot
function() {
  rand <- rnorm(100)
  hist(rand)
}

#* @plumber
function(pr) {
  pr %>%
    pr_hook("postserialize",
            function(req, res) {
              if (class(res$body) == "json") {
                res_size <- length(charToRaw(res$body))
              } else {
                res_size <- length(res$body)
              }
              req_size <- length(charToRaw(req$postBody))

              log_info('{req$REMOTE_ADDR} "{req$HTTP_USER_AGENT}" {req$HTTP_HOST} {req$REQUEST_METHOD} {req$PATH_INFO} {res$status} {req_size} {res_size}')
            })
}
```
