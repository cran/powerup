## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(powerup)
library(dplyr)

pptx <- example_pptx()


## ----eval = FALSE-------------------------------------------------------------
# 
# pptx <- pptx |>
#   add_slide(
#     content(mtcars, table_style = list(style = "named table style", options = c("Banded Columns", "Banded Rows","First Column","Header Row","Last Column","Total Row"))
#   )

## -----------------------------------------------------------------------------

get_table_styles(pptx)


## -----------------------------------------------------------------------------

pptx <- pptx |> 
  add_table_style(
    table_style = new_table_style(
      style_name = "NEW Table Style",
      text_color = "#000000",
      cell_color = "#ffffff",
      row_header_cell_color = "#959595",
      row_total_cell_color = "#E6E6E6",
      major_border_color = "#f36633"
      )
  )



## -----------------------------------------------------------------------------

table_to_style <- airquality |> 
  head() |> 
  flextable::flextable()


pptx <- pptx |> 
  add_slide(
    layout = "Title and Content",
    content(table_to_style, table_style = list(style = "NEW Table Style", options = c("Header Row")), ph = ph_body())
  )



## ----echo = FALSE-------------------------------------------------------------

save_pptx(pptx, file.path(tempdir(),"new_table_style.pptx"))


