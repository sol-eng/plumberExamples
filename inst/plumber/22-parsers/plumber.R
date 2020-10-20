## ---- parsers

library(plumber)

#* @post /json
function(req, res) {
  list(
    message = "Body parsed as JSON",
    body = req$body
  )
}

#* @parser csv
#* @post /csv
function(req, res) {
  list(
    message = "Body parsed as CSV",
    body = req$body
  )
}
