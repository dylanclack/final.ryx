#' @title ryx function
#'
#' @param data dataframe
#' @param y dependent variable
#' @param x independent variables
#'
#' @return variables and their correlations, p values, and stars against dependent variable
#' @export
#'
#' @examples
#'
#' library(MASS)
#' x <- ryx(Boston, y="medv")
#' ryx(Boston, "medv")


ryx <- function(data, y, x) {
  if (missing(x)) {
    x <- setdiff(names(data), y)
  }
  df <- data.frame()
  for (var in x) {
    res <- cor.test(data[[y]], data[[var]])
    df_temp <- data.frame(variable = var,
                          r = res$estimate,
                          p = res$p.value)
    df <- rbind(df, df_temp)
  }
  df <- df[order(-abs(df$r)), c("variable", "r", "p")]

  df$sigif <- ifelse(df$p < .001, "***",
                     ifelse(df$p < .01, "**",
                            ifelse(df$p < .05, "*", " ")))
  results <- list(y = y, x = x, df = df)
  class(results) <- "ryx"

  return(results)
}
library(MASS)
x <- ryx(Boston, y="medv")
ryx(Boston, "medv")



