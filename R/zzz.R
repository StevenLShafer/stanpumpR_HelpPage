# Package load hooks.

# `outputComments()` in app_server.R builds a local variable named "outputString"
# via textConnection(..., local = TRUE); declare it so R CMD check does not flag
# it as an undefined global.
utils::globalVariables("outputString")

# Serve the package's static assets (inst/www) under a URL prefix, the same
# pattern stanpumpR uses. app_ui() references files as "stanpumprhelp-assets/*".
.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "stanpumprhelp-assets",
    system.file("www", package = "stanpumpRHelp")
  )
}
