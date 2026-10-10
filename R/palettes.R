#' Built-in palettes
#'
#' dangerously_in_love is sampled from photos (the covers and the Crazy in Love,
#' Baby Boy and Naughty Girl videos). The red is a placeholder for the heels.
#' @export
bey_palettes <- list(
  dangerously_in_love = c(
    "#001058",  # baby boy, dark blue outfit
    "#031F6A",  # dark blue cover
    "#7A275A",  # crazy in love, versace purple
    "#D52E73",  # versace fuchsia trim
    "#C8102E",  # heels (placeholder)
    "#E18F2D",  # versace orange
    "#51261F",  # hair
    "#AC705A",  # skin
    "#9AA9DB",  # original cover, background
    "#E6E4F4",  # original cover, silver top
    "#F3EAE3",  # naughty girl, silver dress
    "#FCEDEA",  # light pink top
    "#FEF8D8",  # crazy in love, yellow
    "#FEFEFC"   # bright white
  )
)

# palettes added with bey_add_palette() live here
.bey_env <- new.env(parent = emptyenv())

#' Add your own palette
#'
#' @param name what to call it
#' @param colors two or more colors (hex or color names)
#' @export
bey_add_palette <- function(name, colors) {
  ok <- tryCatch({ grDevices::col2rgb(colors); TRUE }, error = function(e) FALSE)
  if (!ok || length(colors) < 2) stop("colors needs 2 or more valid colors")
  assign(name, colors, envir = .bey_env)
  invisible(colors)
}

#' All palettes, built in and added
#' @export
bey_all <- function() c(bey_palettes, as.list(.bey_env))
