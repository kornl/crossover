
dput2 <- function(x) {
  paste(capture.output(dput(x)), collapse = " ")
}