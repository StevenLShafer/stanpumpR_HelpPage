# Launch entry point for the stanpumpR help app.
#
# Deployment note (shinyapps.io / Posit Connect): the platform deploys this as a
# plain Shiny app and AUTO-SOURCES the R/ directory (Shiny's loadSupport) rather
# than installing stanpumpRHelp as a package. In that mode (a) the package's
# Imports are not attached to the search path and (b) .onLoad() never runs. So we
# attach the runtime packages and register the static-asset resource path here,
# with fallbacks for the not-installed case. Under devtools::load_all() this same
# code is harmless: the packages are already available and addResourcePath simply
# re-registers the (identical) path.
#
# app_ui(), app_server(), and run_app() come from either the installed/loaded
# package (dev) or the auto-sourced R/ files (deploy).

library(shiny)
library(shinydashboard)
library(shinyjs)
library(markdown)

local({
  www <- system.file("www", package = "stanpumpRHelp")
  if (!nzchar(www)) www <- "inst/www"
  shiny::addResourcePath("stanpumprhelp-assets", www)
})

run_app()
