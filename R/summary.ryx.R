

#' @title Summary Function
#'
#' @param x ryx
#'
#' @return text
#' @export
#'
#' @examples
#' library(MASS)
#' x <- ryx(Boston, y="medv")
#' summary(x)
#'

summary.ryx <- function(x, ...) {
  num_var <- length(x$df$p)
  count <- num_var
  for(i in num_var) {
    if (x$df$sigif[i] == " ") {
      count <- count - 1;
    }
  }
  cat("Correlating", x$y, "with", x$x)
  cat("\nThe median absolute correlation was", mean(abs(x$df$r)), "with a range from", min(x$df$r), "to", max(x$df$r))
  cat("\n", count, "out of", num_var, "variables were significant at the p < 0.05 level.")
}

