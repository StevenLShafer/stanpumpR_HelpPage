# tools/deploy.R -- publish the stanpumpR help app to shinyapps.io.
#
# This is a developer helper, NOT part of the app's runtime. It is sourced on
# demand (source("tools/deploy.R"); deploy()), never at app startup, so the app
# can launch without the rsconnect package installed.
#
# Provenance: authored by Steven L. Shafer (2019); made self-contained in
# August 2026 and moved under tools/ during the package restructure (Claude
# Opus 4.8, reviewed by S. Shafer).
deploy <- function(appDir = getwd()) {
  library(rsconnect)

  # Bundle the package-app runtime (app.R, R/, inst/, DESCRIPTION, NAMESPACE)
  # while excluding version-control metadata, developer tooling, docs, and
  # deployment records so they are not pushed to the server.
  appFiles <- list.files(appDir, recursive = TRUE)
  appFiles <- appFiles[!grepl("^(\\.git|rsconnect|\\.Rproj\\.user|tools|docs|man)/", appFiles)]
  appFiles <- appFiles[!appFiles %in% c(
    "README.md", "TODO.md", ".gitignore", ".Rbuildignore", "stanpumpRHelp.Rproj"
  )]

  deployApp(
    appDir = appDir,
    appFiles = appFiles,
    forceUpdate = TRUE,
    account = "steveshafer",
    appName = "stanpumpR_HelpPage"
  )
}
