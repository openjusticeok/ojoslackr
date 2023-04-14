#' @title Watermark
#' 
#' @description Add a watermark to a ggplot2 plot
#' 
#' @param text String to be added as watermark
#' @param fontsize Font size
#' @param color Font color
#' @param alpha Alpha (transparency; lower number = more transparent)
#' @param fontface Font face ("bold" by default)
#' @param angle Angle of the watermark
#'
#' @importFrom grid textGrob gpar
#' @importFrom ggplot2 annotation_custom
#' 
#' @export
#' @examples
#' 
#' library(ojodb)
#' library(ggplot2)
#' library(grid)
#' 
#' ojo_tbl("case") |>
#'  head(10) |>
#'  ojo_collect() |>
#'  ggplot(aes(x = date_filed, y = date_closed)) +
#'    geom_point() +
#'    ojo_theme() +
#'    ojo_watermark("DRAFT")
#'
ojo_watermark <- function(text = "DRAFT", fontsize = 120,
                          color = "grey90", alpha = 0.1,
                          fontface = "bold", angle = 22) {
  watermark_grob <- grid::textGrob(text, gp = grid::gpar(fontsize = fontsize, color = color,
                                      alpha = alpha, fontface = fontface),
                   rot = angle)

  ggplot2::annotation_custom(grob = watermark_grob)
}