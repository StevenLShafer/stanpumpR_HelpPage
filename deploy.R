# deploy stanpumpR to the test site (stanpumpR_test)
deploy <- function()
{
  setwd("c:/dev/stanpumpR_Help")
  library(rsconnect)
  deployApp(
    appDir = "c:/dev/stanpumpR_Help",
    appFiles = appFiles,
    forceUpdate = TRUE,
    account="steveshafer",
    appName = "stanpumpR_HelpPage"
  )
}
