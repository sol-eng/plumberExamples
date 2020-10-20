
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Attachment

This API demonstrates how to make responses availalbe as attachments.

## Endpoints

-   `/name`: Download an attachment as a named text file
-   `/no-name`: Download an attachment as the name of the route
-   `/inline`: No attachment - display the result in browser

## Definition

### [plumber.R](plumber.R)

``` r
#* Save a file with a particular file name. Ex: `time.txt`
#* @serializer text
#* @get /name
function() {
  as_attachment(Sys.time(), "time.txt")
}



#* Save a file as the route. Ex: `no_name`
#* @serializer text
#* @get /no_name
function() {
  as_attachment(Sys.time())
}

#* Display within browser. Possible as the mime type is `text/plain`
#* @serializer text
#* @get /inline
function() {
  Sys.time()
}
```
