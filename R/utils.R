# This file holds common functions and methods.
# ---------------------------------------------

#' Adds download buttons and horizontal scrolling to \code{"DT::datatable"}.
#'
#' @param dt A data.table object.
#' @examples
#' datatable_custom(dt = data_table)
#'
datatable_custom <- function(dt) {

  datatable(
    dt,
    extensions = "Buttons",
    options = list(
      scrollX = TRUE,
      dom = "Blfrtip",
      buttons = list(
        "copy",
        "print",
        list(extend = "collection", buttons = c("csv", "excel", "pdf"), text = "Download")
      )
    )
  )
}

# ---------------------------------------------
