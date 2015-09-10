#' @export
hw <- function (df, field, frequency, n) {
  fn <- function (data) {
    fit <- try(HoltWinters(ts(data, frequency = frequency)), silent = TRUE)
    if (!inherits(fit, "try-error")) {
      as.vector(predict(fit, n.ahead = n))
    } else {
      rep(NA, n)
    }
  }
  df$pred <- lapply(df[, field], FUN = fn, frequency = frequency, n = n)
  df
}
