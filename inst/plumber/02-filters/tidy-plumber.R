## ---- tidy-plumber

library(plumber)

users <- data.frame(
  id = 1:2,
  username = c("joe", "kim"),
  groups = c("users", "admin,users")
)

pr() %>% 
  pr_filter(name = "auth-user",
            expr = function(req, username=""){
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
            }) %>% 
  pr_filter(name = "require-auth",
            expr = function(req, res){
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
            }) %>% 
  pr_get(path = "/me",
         handler = function(req){
           # Safe to assume we have a user, since we've been
           # through all the filters and would have gotten an
           # error earlier if we weren't.
           list(user=req$user)
         }) %>% 
  pr_get(path = "/about",
         handler = function(){
           list(descript="This is a demo service that uses authentication!")
         },
         preempt = "require-auth") %>% 
  pr_run()
