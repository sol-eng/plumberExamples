# ---- reticulate
library(plumber)
library(reticulate)

source_python("add.py")

#* @apiTitle Reticulated Plumber API

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b) {
  a <- as.numeric(a)
  b <- as.numeric(b)
  add(a, b)
}
