
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Mailgun

Example of manipulating global state. Each request to `/mail` adds an
entry to the `emails` dataframe. `/tail` can be used to see the most
recent 5 emails.

## Endpoints

-   `/mail`: Submit an email with `from` and `subject` parameters
-   `/tail`: Return the last 5 recorded emails

## Definition

### [plumber.R](plumber.R)

``` r
emails <- data.frame(from=character(0), time=character(0), subject=character(0), stringsAsFactors = FALSE)

#* @param from
#* @param subject
#* @post /mail
function(from, subject){
  emails <<- rbind(emails, data.frame(from=from, time=date(), subject=htmltools::htmlEscape(subject), stringsAsFactors=FALSE))
  TRUE
}

#* @get /tail
function(){
  tail(emails[,-1], n=5)
}
```
