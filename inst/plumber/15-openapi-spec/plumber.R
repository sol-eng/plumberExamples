## ---- openapi-spec

library(plumber)

#* @get /sum
function(num) {
  num_parsed <- unlist(strsplit(num, ","))
  sum(as.integer(num_parsed))
}

#* @plumber
function(pr) {
  pr %>%
    pr_set_api_spec(function(spec) {
      spec$paths[["/sum"]]$get$summary <- "Sum numbers"
      spec$paths[["/sum"]]$get$parameters <- list(list(
        "description" = "numbers",
        "required" = TRUE,
        "in" = "query",
        "name" = "num",
        "schema" = list("type" = "array", "items" = list("type" = "integer"), "minItems" = 1),
        "style" = "form",
        "explode" = FALSE
      ))
      spec
    })
}
