# deploy.R -- publish the stanpumpR help app to shinyapps.io.
#
# This is a developer helper, NOT part of the app's runtime. It is sourced on
# demand (source("deploy.R"); deploy()), never at app startup, so the app can
# launch without the rsconnect package installed.
#
# Provenance: authored by Steven L. Shafer (2019); made self-contained in
# August 2026 (Claude Opus 4.8, reviewed by S. Shafer). Previously relied on a
# global `appFiles` object that global.R created as a startup side effect.
deploy <- function(appDir = getwd()) {
  library(rsconnect)

  # Bundle only the app's own source files; exclude version-control metadata,
  # docs, and deployment records so they are not pushed to the server.
  appFiles <- list.files(appDir, recursive = TRUE)
  appFiles <- appFiles[!grepl("^(\\.git|rsconnect|\\.Rproj\\.user)/", appFiles)]
  appFiles <- appFiles[!appFiles %in% c("README.md", ".gitignore", "deploy.R")]

  deployApp(
    appDir = appDir,
    appFiles = appFiles,
    forceUpdate = TRUE,
    account = "steveshafer",
    appName = "stanpumpR_HelpPage"
  )
}
