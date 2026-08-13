# Server for the stanpumpR help app.
#
# Provenance: originally the script-app server.R (Steven L. Shafer, 2019);
# converted to a named package function in August 2026 (Claude Opus 4.8,
# reviewed by S. Shafer) as part of mirroring the stanpumpR package layout.

#' Server function for the stanpumpR help app
#'
#' @param input,output,session Standard Shiny server arguments.
#' @keywords internal
app_server <- function(input, output, session)
{
  # Write out logs to the log section
  initLogMsg <- "Comments Log"
  commentsLog <- reactiveVal(initLogMsg)
  output$logContent <- renderUI({
    shinyjs::delay(0, shinyjs::js$scrollLogger())
    HTML(commentsLog())
  })
  output$title <- renderText(
    {
      outputComments(paste("in output$title routine:", input$tab))
      input$tab
    }
    )
  outputComments <- function(text, echo = TRUE) {
    if (is.na(echo)) return()
    if (is.data.frame((text)))
    {
      con <- textConnection("outputString","w",local=TRUE)
      utils::capture.output(print(text, digits = 3), file = con, type="output", split = FALSE)
      close(con)
      if (echo)
      {
        for (line in outputString) cat(line, "\n")
      }
      isolate(
        for (line in outputString) commentsLog(paste0(commentsLog(), "<br>", line))
      )
    } else {
      if (echo)
      {
        cat(text, "\n")
      }
    isolate(commentsLog(paste0(commentsLog(), "<br>", text)))
    }
  }
}
