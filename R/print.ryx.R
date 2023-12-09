

#' @title Print function
#'
#' @param x ryx
#' @param ...
#'
#' @return df
#' @export
#'
#' @examples
#' library(MASS)
#' x <- ryx(Boston, y = "medv")
#' print(x)


print.ryx <- function(x, ...) {
  cat("Correlations of", x$y, "with\n")

  # Format p-values
  x$df$p <- ifelse(x$df$p < 2e-16, "< 2e-16", sprintf("%.2e", x$df$p))

  # Print the formatted results
  print(x$df[, c("variable", "r", "p", "sigif")], row.names = FALSE)
}


