
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Plumber filters

This examples show how Plumber filters work by implementing a
rudimentary authentication mechanism.

## Endpoints

-   `/me`: Returns the identity of the user, as defined in the
    `username` query string parameter. Users are “authenticated” against
    a set list.
-   `/about`: This endpoint preempts the authentication endpoint and is
    therefore available to all users, whether they are valid or not.

## Definition

### [plumber.R](plumber.R)

``` r
library(plumber)

users <- data.frame(
  id = 1:2,
  username = c("joe", "kim"),
  groups = c("users", "admin,users")
)

#* Filter that grabs the "username" querystring parameter.
#* You should, of course, use a real auth system, but
#* this shows the principles involved.
#* @filter auth-user
function(req, username=""){
  # Since username is a querystring param, we can just
  # expect it to be available as a parameter to the
  # filter (plumber magic).

  if (username == ""){
    # No username provided
  } else if (username %in% users$username){
    # username is valid

    req$user <- users[users$username == username,]

  } else {
    # username was provided, but invalid
    stop("No such username: ", username)
  }

  # Continue on
  forward()
}

#* Now require that all users must be authenticated.
#* @filter require-auth
function(req, res){
  # Check if the user is logged in
  # Check if the request is being made to OpenAPI - allow the UI to render
  if (is.null(req$user) & !grepl("docs|swagger|openapi", tolower(req$PATH_INFO))){
    # User isn't logged in and request isn't going to Swagger
    res$status <- 401 # Unauthorized
    list(error="You must login to access this resource.")
  } else {
    # user is logged in. Move on...
    forward()
  }
}

#* @get /me
function(req){
  # Safe to assume we have a user, since we've been
  # through all the filters and would have gotten an
  # error earlier if we weren't.
  list(user=req$user)
}

#* Get info about the service. We preempt the
#* require-auth filter because we want authenticated and
#* unauthenticated users alike to be able to access this
#* endpoint.
#* @preempt require-auth
#* @get /about
function(){
  list(descript="This is a demo service that uses authentication!")
}
```
