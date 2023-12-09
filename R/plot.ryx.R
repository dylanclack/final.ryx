

#' @title Plot function
#'
#' @param x ryx
#'
#' @import ggplot2
#'
#' @return a graph
#' @export
#'
#' @examples
#' library(MASS)
#' x <- ryx(Boston, y="medv")
#' plot(x)
#'
#'
plot.ryx<- function(x) {
  library(ggplot2)
  df <- x$df
  df$sign <- ifelse(df$r >= 0, "positive", "negative")
  df$absr <- abs(df$r)
  df$variable <- factor(df$variable, levels = df$variable[order(df$absr)])

  ggplot2::ggplot(df, ggplot2::aes(x = absr, y = variable, absr)) +
    ggplot2::geom_point(ggplot2::aes(color = sign)) +
    ggplot2::geom_segment(ggplot2::aes(x = 0, xend = absr, yend = variable), color = "gray") +
    ggplot2::labs(x = "Correlation (absolute value)", y = "Variables") +
    ggplot2::scale_x_continuous(limits = c(0, 1), breaks = seq(0, 1, 0.1)) +
    ggplot2::scale_color_manual(values = c("red", "blue")) +
    ggplot2::theme_bw()
}
