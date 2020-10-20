## ---- tidy-plumber

library(plumber)

pr() %>% 
  pr_get(path = "/mean",
         handler = function(samples=10){
           data <- rnorm(samples)
           mean(data)
         }) %>% 
  pr_post(path = "/sum",
          handler = function(a, b){
            as.numeric(a) + as.numeric(b)
          }) %>% 
  pr_run()
  