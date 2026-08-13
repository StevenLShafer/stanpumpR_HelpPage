# Load Libraries
library(shiny)
library(shinyjs)
library(shinydashboard)

# tell shiny to log all reactivity
isShinyLocal <- Sys.getenv('SHINY_PORT') == ""
# cat("isShinyLocal",isShinyLocal,"\n")

if (isShinyLocal) {
  setwd("c:/dev/stanpumpR_Help")
  appFiles <- dir()
  library(rsconnect)
  source("deploy.R")
}

# Load other files
#CANCEL <- readPNG("www/cancel.png", native=TRUE)
enableBookmarking(store = "url")

