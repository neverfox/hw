#' @export
hwdf <- function (df, field, frequency, n) {
  df$pred <- lapply(df[, field], FUN = hw, frequency = frequency, n = n)
  df
}
