# global.R -- loaded once when the Shiny app starts.
#
# Provenance: originally authored by Steven L. Shafer (2019). Modernized for
# R 4.6.1 / current CRAN Shiny in August 2026 (Claude Opus 4.8, reviewed by
# S. Shafer): removed deployment scaffolding (setwd / rsconnect / source of
# deploy.R) from the startup path. That code required the rsconnect package
# just to launch the app locally and ran a hard-coded setwd() on every start.
# Deployment now lives entirely in deploy.R and is invoked on demand.

# Load libraries
library(shiny)
library(shinyjs)
library(shinydashboard)

# URL bookmarking keeps saved simulations shareable as plain links and works on
# hosts without server-side state storage (e.g. shinyapps.io). Must be called
# before the app is created.
enableBookmarking(store = "url")
