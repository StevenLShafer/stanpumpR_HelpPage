# Launch entry point for the stanpumpR help app.
#
# Provenance: replaces the old global.R startup path (Steven L. Shafer, 2019);
# authored August 2026 (Claude Opus 4.8, reviewed by S. Shafer) to mirror
# stanpumpR's app_run.R. URL bookmarking (previously enabled in global.R) was
# intentionally dropped -- the help app has no user state worth restoring.

#' Launch the stanpumpR help app
#'
#' Builds and returns the Shiny application object. Print it (or call
#' [shiny::runApp()] on it) to start the server.
#'
#' @return A Shiny app object, as returned by [shiny::shinyApp()].
#' @export
run_app <- function() {
  shiny::shinyApp(ui = app_ui(), server = app_server)
}
