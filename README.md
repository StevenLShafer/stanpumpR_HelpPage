# stanpumpRHelp

The help-and-examples companion app for [stanpumpR](https://github.com/StevenLShafer/stanpumpR).

`stanpumpRHelp` is a standalone [Shiny](https://shiny.posit.co/) application that serves
the **Examples** and **Help** content linked from the main stanpumpR app's top navigation
("Examples and Help"). It is deployed separately to shinyapps.io and reached from
stanpumpR via the `help_link` config value, opening in a new browser tab.

It is intentionally a **separate repository** from stanpumpR so the help content can be
edited and redeployed without triggering the main app's build/check/release cycle. It is
nonetheless structured as an R *package* that mirrors stanpumpR's layout (`R/`,
`inst/www/`, `DESCRIPTION`, `renv`, a testthat suite), launched via
`app.R → stanpumpRHelp::run_app()`. The content itself is a `shinydashboard` UI.

## Layout

| Path | Purpose |
| --- | --- |
| `app.R` | Entry point — calls `stanpumpRHelp::run_app()`. |
| `R/app_ui.R` | `app_ui()` — the dashboard UI (the Examples and Help content). |
| `R/app_server.R` | `app_server()` — comments/log plumbing and active-tab title. |
| `R/app_run.R` | `run_app()` — builds the Shiny app object. |
| `R/zzz.R` | `.onLoad` registers `inst/www` under the `stanpumprhelp-assets` path. |
| `R/stanpumpRHelp-package.R` | Package doc and namespace imports. |
| `inst/www/app.css` | Static styling (served via the resource path). |
| `tools/deploy.R` | `deploy()` helper that pushes the app to shinyapps.io. |
| `tests/testthat/` | Smoke tests (package wiring). |

## Running locally

```r
renv::restore()          # first time: install the pinned dependencies
devtools::load_all(".")  # load the package
run_app()                # launch the app
```

Requires R (>= 4.1); developed and verified on R 4.6.1.

## Testing

```r
devtools::test()
```

## Deploying

```r
source("tools/deploy.R")
deploy()   # pushes to https://steveshafer.shinyapps.io/stanpumpR_HelpPage/
```

Deployment requires shinyapps.io credentials configured for the `steveshafer` account
(via `rsconnect::setAccountInfo(...)`). The `rsconnect/` metadata directory is
git-ignored.

## Provenance

Originally authored in 2019 as a bare Shiny script app (`global.R` / `server.R` / `ui.R`)
and maintained under `G:\Projects\StanpumpR_HelpPage`; relocated to `C:\dev\stanpumpR_Help`
and placed under version control in August 2026, then restructured into an R package
mirroring stanpumpR.
