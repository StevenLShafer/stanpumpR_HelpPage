# Smoke tests: the app assembles without error. There is no PK/PD logic to
# exercise here (the app is static help content), so these guard the package
# wiring -- UI builds, server is a function, and the app object constructs.

test_that("app_ui() returns a bookmark-style UI function", {
  ui <- app_ui()
  expect_true(is.function(ui))
  # Shiny expects a request-handling UI function (single `request` argument).
  expect_named(formals(ui), "request")
})

test_that("app_server() is a three-argument server function", {
  expect_true(is.function(app_server))
  expect_named(formals(app_server), c("input", "output", "session"))
})

test_that("run_app() constructs a Shiny app object", {
  app <- run_app()
  expect_s3_class(app, "shiny.appobj")
})
