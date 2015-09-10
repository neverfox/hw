#' @export
hw <- function (data, frequency, n) {
  fit <- try(HoltWinters(ts(data, frequency = frequency)), silent = TRUE)
  if (!inherits(fit, "try-error")) {
    as.vector(predict(fit, n.ahead = n))
  } else {
    rep(NA, n)
  }
}

#' @export
hw_df <- function (df, field, frequency, n) {
  df$pred <- lapply(df[, field], FUN = hw, frequency = frequency, n = n)
  df
}