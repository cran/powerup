## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(powerup)

## -----------------------------------------------------------------------------
# pptx <- load_pptx("//where/is/your/document.pptx")
pptx <- load_pptx()


## -----------------------------------------------------------------------------
pptx

## -----------------------------------------------------------------------------
pptx <- load_pptx() |> 
  add_slide("Title Slide") |> 
  add_slide("Title and Content") |> 
  add_slide("Two Content")

## -----------------------------------------------------------------------------
pptx <- load_pptx() |> 
  add_slide("Title Slide") |>   # slide 1 at this point
  add_slide("Two Content")    # slide 2 at this point

pptx <- pptx |> 
  add_slide("Comparison", index = 2)

## -----------------------------------------------------------------------------
list_layouts(pptx)

## -----------------------------------------------------------------------------
list_placeholders(pptx, layout = "Title Slide")

## -----------------------------------------------------------------------------
list_placeholders(pptx, layout = "Title Slide") |> 
  ggplot()

## -----------------------------------------------------------------------------
pptx <- pptx |> 
  update_slide(index = 1, 
    content("My slide title"                        , ph = ph_title()), 
    content("Some more information in the sub title", ph = ph_subtitle())
  )

## -----------------------------------------------------------------------------
library(ggplot2)
library(dplyr)
library(flextable)

plot1 <- ggplot(mtcars, aes(mpg, disp)) + geom_point()
tbl1  <- mtcars |> select(mpg, disp) |> slice(1:5) |> flextable()

## ----eval=FALSE---------------------------------------------------------------
# save_pptx(pptx, path = "updated_deck.pptx")

## -----------------------------------------------------------------------------
library(powerup)
library(ggplot2)
library(dplyr)
library(flextable)

plot1 <- ggplot(mtcars, aes(mpg, disp)) + geom_point()
tbl1  <- mtcars |> select(mpg, disp) |> slice(1:5) |> flextable()

pptx <- load_pptx() |> 
  add_slide("Title Slide") |> 
  add_slide("Comparison")

pptx <- pptx |> 
  update_slide(index = 1, 
    content("Title",     ph = ph_title()), 
    content("Sub title", ph = ph_subtitle())
  ) |> 
  update_slide(index = 2, 
    content(plot1, ph = ph_body_left()), 
    content(tbl1,  ph = ph_body_right())
  )

# save_pptx(pptx, "//somewhere/over/the/rainbow.pptx")

## -----------------------------------------------------------------------------
library(powerup)
library(ggplot2)
library(dplyr)
library(flextable)

plot1 <- ggplot(mtcars, aes(mpg, disp)) + geom_point()
tbl1  <- mtcars |> select(mpg, disp) |> slice(1:5) |> flextable()

pptx <- load_pptx() |> 
  add_slide("Title Slide", 
    content("Title",     ph = ph_title()), 
    content("Sub title", ph = ph_subtitle())        
  ) |> 
  add_slide("Comparison", 
    content(plot1, ph = ph_body_left()), 
    content(tbl1,  ph = ph_body_right())       
  )
# save_pptx(pptx, "//somewhere/over/the/rainbow.pptx")

