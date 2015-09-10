#' @export
hw <- function (data, frequency, n) {
  fit <- try(HoltWinters(ts(data, frequency = frequency)), silent = TRUE)
  if (!inherits(fit, "try-error")) {
    as.vector(predict(fit, n.ahead = n))
  } else {
    rep(NA, n)
  }
}
