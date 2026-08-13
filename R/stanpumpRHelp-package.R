#' stanpumpRHelp: Examples and Help companion app for stanpumpR
#'
#' A lightweight Shiny application serving the Examples and Help content linked
#' from the main stanpumpR app. It is deployed separately to shinyapps.io and
#' reached from stanpumpR via its `help_link` configuration.
#'
#' @keywords internal
"_PACKAGE"

# Bring the Shiny UI/server vocabulary (dashboardPage, fluidRow, tags, HTML,
# useShinyjs, extendShinyjs, reactiveVal, renderUI, ...) into the package
# namespace. Mirrors how the script app loaded these via library().
#' @import shiny
#' @import shinydashboard
#' @rawNamespace import(shinyjs, except = runExample)
NULL
