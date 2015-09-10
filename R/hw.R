#' @export
hw <- function (data, frequency, n) {
  predict(HoltWinters(ts(data, frequency = frequency)), n.ahead = n)
}
