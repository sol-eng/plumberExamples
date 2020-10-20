## ---- simple-model
library(plumber)

# Read in previously trained model
model <- readRDS("cars-model.rds")

#* @apiTitle Simple ML Model

#* API Health Check
#* @get /health-check
function() {
    list(
      "timestamp" = Sys.time(),
      "api-status" = "listening")
}

validate_data <- function(data) {
  length(intersect(names(data), c("cyl", "hp"))) == 2
}

#* Predict on input values
#* @post /predict
function(req, res) {
  if (!validate_data(req$body)) {
    res$status <- 400
    return(list(error = "No data submitted"))
  }
  predict(model, req$body)
}
