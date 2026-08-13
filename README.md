# stanpumpR Help

The help-and-examples companion app for [stanpumpR](https://github.com/StevenLShafer/stanpumpR).

This is a standalone [Shiny](https://shiny.posit.co/) application that serves the
**Examples** and **Help** content linked from the main stanpumpR app's top navigation
("Examples and Help"). It is deployed separately to shinyapps.io and reached from
stanpumpR via the `help_link` config value, opening in a new browser tab.

It is intentionally a separate app/repo: stanpumpR is a full R *package* (with `renv`,
a `Collate:` build order, and a testthat suite), whereas this help app is a lightweight,
content-focused Shiny script app (`global.R` / `server.R` / `ui.R`) built on
`shinydashboard`. Keeping them apart lets the help content be edited and redeployed
without triggering the package's build/check/release cycle.

## Layout

| File | Purpose |
| --- | --- |
| `global.R` | Loads libraries; enables URL bookmarking. |
| `server.R` | Server function (comments/log plumbing, active-tab title). |
| `ui.R` | The dashboard UI — the Examples and Help content itself. |
| `app.css` | Styling for the log section. |
| `shinyjs-funcs.js` | Small shinyjs helper (auto-scrolls the log). |
| `deploy.R` | `deploy()` helper that pushes the app to shinyapps.io. |

## Running locally

```r
# from this directory
shiny::runApp()
```

## Deploying

```r
source("deploy.R")
deploy()   # pushes to https://steveshafer.shinyapps.io/stanpumpR_HelpPage/
```

Deployment requires shinyapps.io credentials configured for the `steveshafer` account
(via `rsconnect::setAccountInfo(...)`). The `rsconnect/` metadata directory is
git-ignored.

## Provenance

Originally authored in 2019 and maintained under
`G:\Projects\StanpumpR_HelpPage`; relocated to `C:\dev\stanpumpR_Help` and placed under
version control in August 2026.
