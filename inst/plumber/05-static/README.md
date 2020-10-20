
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Static File Server

This example sets up two static file servers. One at the default path
(`/public`), and another at an explicit path (`/static`). You should be
able to access the two files in the `./files` directory at either of
those paths. So try `http://localhost:8000/static/b.txt` or
`http://localhost:8000/public/a.html`.

## Endpoints

-   `/`: Information about the static file server
-   `/static/a.html`: The contents of `./files/a.html`
-   `/static/b.txt`: The contents of `./files/b.txt`
-   `/public/a.html`: The contents of `./files/a.html`
-   `/public/b.txt`: The contents of `./files/b.txt`

## Definition

### [plumber.R](plumber.R)

``` r
#* @assets ./files
list()

#* @assets ./files /static
list()

#* @get /
#* @json(auto_unbox = TRUE)
function() {
  "static file server at './files'"
}
```
