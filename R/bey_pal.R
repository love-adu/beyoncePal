#' Get a palette
#'
#' @param palette a palette name (see names(bey_all()))
#' @param n how many colors. 
#' @param reverse flip the order
#' @param show_me plot the swatches instead of returning them
#' @examples
#' bey_pal("dangerously_in_love")
#' bey_pal(n = 20)
#' bey_pal(show_me = TRUE)
#' @export
bey_pal <- function(palette = "dangerously_in_love", n = NULL, reverse = FALSE,
                    show_me = FALSE) {
  all_pals <- bey_all()

  if (length(palette) > 1) {
    cols <- palette
    palette <- "custom"
  } else if (palette %in% names(all_pals)) {
    cols <- all_pals[[palette]]
  } else {
    stop("no palette called '", palette, "'. try one of: ",
         paste(names(all_pals), collapse = ", "))
  }

  if (reverse) cols <- rev(cols)
  if (is.null(n)) n <- length(cols)
  if (n > length(cols)) {
    cols <- grDevices::colorRampPalette(cols)(n)
  } else {
    cols <- cols[seq_len(n)]
  }

  if (show_me) {
    old <- graphics::par(mar = c(1, 1, 2, 1))
    on.exit(graphics::par(old))
    graphics::image(seq_along(cols), 1, as.matrix(seq_along(cols)), col = cols,
                    axes = FALSE, xlab = "", ylab = "", main = palette)
    graphics::text(seq_along(cols), 1, cols, cex = 0.7)
    return(invisible(cols))
  }
  cols
}

#' ggplot2 scales
#'
#' @param palette palette name
#' @param reverse flip the order
#' @param ... passed on to ggplot2::discrete_scale()
#' @export
scale_color_bey <- function(palette = "dangerously_in_love", reverse = FALSE, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) stop("install ggplot2 first")
  ggplot2::discrete_scale(
    "colour",
    palette = function(n) bey_pal(palette, n = n, reverse = reverse),
    ...
  )
}

#' @rdname scale_color_bey
#' @export
scale_colour_bey <- scale_color_bey

#' @rdname scale_color_bey
#' @export
scale_fill_bey <- function(palette = "dangerously_in_love", reverse = FALSE, ...) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) stop("install ggplot2 first")
  ggplot2::discrete_scale(
    "fill",
    palette = function(n) bey_pal(palette, n = n, reverse = reverse),
    ...
  )
}
