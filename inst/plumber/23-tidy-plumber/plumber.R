## ---- tidy-plumber

library(plumber)

#* @plumber
function(pr) {
  pr() %>%
    pr_get(path = "/echo",
           handler = function(msg = "") {
             list(msg = paste0("The message is: '", msg, "'"))
           }) %>%
    pr_get(path = "/plot",
           handler = function() {
             rand <- rnorm(100)
             hist(rand)
           },
           serializer = serializer_png()) %>%
    pr_post(path = "/sum",
            handler = function(a, b) {
              as.numeric(a) + as.numeric(b)
            }) %>%
    pr_run()
}
