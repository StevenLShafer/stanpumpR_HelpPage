# Restructure plan: mirror the stanpumpR package layout

Scoping document for converting **stanpumpR_Help** from a bare Shiny script app
(`global.R` / `server.R` / `ui.R`) into an R-package-structured app that mirrors
the main **stanpumpR** repo. Drafted on the `restructure` branch. Nothing here is
executed yet — this is the plan to review before doing the work.

## Goal & non-goals

**Goal:** same *shape* as stanpumpR — an installable R package whose app launches
via `app.R → <pkg>::run_app()`, with `R/`, `inst/www/`, `DESCRIPTION`,
`NAMESPACE`, and the same config/asset conventions — so tooling, muscle memory,
and deployment match between the two repos.

**Non-goals:** this app has ~no computational logic (it is ~1500 lines of static
help content). We are matching *structure*, not importing the PK engine, the
drug library, `renv`, vignettes, or the test depth of the main app. See
[Adopt vs. skip](#what-to-adopt-vs-skip) — the recommendation is a **"lite"
package**, not a full clone of every stanpumpR subsystem.

## Naming constraint (must decide first)

R package names may contain only letters, numbers, and dots — **no underscores**.
So the repo name `stanpumpR_HelpPage` cannot be the package name. Proposed:
**`stanpumpRHelp`**. (Alternatives: `stanpumpRHelpPage`, `stanpumprhelp`.) The
GitHub repo name does not have to change; only the R package name inside it.

## Current → target structure

```
CURRENT (script app)                 TARGET (package app, mirrors stanpumpR)
------------------------             --------------------------------------
global.R                             app.R                 -> stanpumpRHelp::run_app()
server.R                             DESCRIPTION           (Package/Imports/Collate)
ui.R                                 NAMESPACE             (roxygen-generated)
deploy.R                             R/
www/app.css                            app_ui.R            (from ui.R)
www/shinyjs-funcs.js                   app_server.R        (from server.R)
README.md                              app_run.R           (run_app(); was global.R)
TODO.md                                globalVariables.R   (DEFAULT_CONFIG, help text consts)
rsconnect/                             stanpumpRHelp-package.R  (roxygen @import, pkg doc)
                                       zzz.R               (onLoad: addResourcePath)
                                     inst/www/
                                       app.css             (moved from www/)
                                       shinyjs-funcs.js    (moved from www/)
                                     tools/deploy.R        (dev helper; Rbuildignore'd)
                                     tests/testthat/       (smoke test: app_ui() builds)
                                     docs/                 (this plan; future help-authoring notes)
                                     man/                  (roxygen output)
                                     config.yml.sample     (optional; see below)
                                     .Rbuildignore
                                     .Rproj / stanpumpRHelp.Rproj
                                     LICENSE / LICENSE.md
                                     README.md / TODO.md   (kept)
```

## File-by-file mapping

| Current | Target | Notes |
| --- | --- | --- |
| `ui.R` (`function(request){ dashboardPage(...) }`) | `R/app_ui.R` as `app_ui <- function() { function(request) { … } }` | Wrap the existing UI function; matches stanpumpR's `app_ui()` returning the request-function. Body is unchanged. |
| `server.R` (`function(input,output,session){…}`) | `R/app_server.R` as `app_server <- function(input, output, session) { … }` | Named function instead of anonymous. Body unchanged. |
| `global.R` (library loads + `enableBookmarking`) | Split: deps → `DESCRIPTION` Imports + `@import` in package doc; `enableBookmarking("url")` → inside `run_app()`. | `global.R` disappears; startup lives in `run_app()`. |
| *(new)* | `R/app_run.R` — `run_app()` builds `shiny::shinyApp(app_ui(), app_server, enableBookmarking = "url")` | Mirrors stanpumpR's `app_run.R`. Optional `config::get()` if we keep a config. |
| *(new)* | `app.R` — one line: `stanpumpRHelp::run_app()` | Same launch convention as main app. |
| `www/app.css` | `inst/www/app.css` | Served via `addResourcePath`. |
| `www/shinyjs-funcs.js` | `inst/www/shinyjs-funcs.js` | See [extendShinyjs note](#technical-adaptations). |
| `deploy.R` | `tools/deploy.R` (+ `.Rbuildignore`) | Stays a dev-only helper; `appName` stays `stanpumpR_HelpPage`. |
| `rsconnect/` | unchanged (git-ignored) | Deployment metadata. |
| `README.md`, `TODO.md` | kept at root | Update README layout section. |

## Technical adaptations (the parts that need real thought)

1. **Static assets via `addResourcePath`.** stanpumpR serves `inst/www` under a
   prefix: `addResourcePath("stanpumpr-assets", system.file("www", package =
   "stanpumpR"))` and references e.g. `stanpumpr-assets/app.css`. We do the same
   in a `zzz.R` `.onLoad` (or in `run_app()`), prefix `stanpumprhelp-assets`,
   and update the `tags$link(href=...)` in `app_ui.R`.

2. **`extendShinyjs()` inside a package — the one real gotcha.** The current app
   loads `shinyjs-funcs.js` via `extendShinyjs(script = "shinyjs-funcs.js")`,
   which works because the file sits in the served `www/` root. In a package the
   file lives in `inst/www`, so the `script=` path must resolve through the
   resource path, **or** we switch to `extendShinyjs(text = "…")` with the JS
   inlined, **or** drop it entirely — recall `scrollLogger` only serves the
   `logSection`, which is currently commented out in the UI. **Recommendation:**
   inline via `text=` or remove until the log panel is actually used. Decide
   during execution.

3. **Config.** stanpumpR loads `config.yml` via `config::get()` merged over a
   `DEFAULT_CONFIG`. The help app has no real config today. Options: (a) skip
   config entirely — `run_app()` takes no config; (b) add a minimal
   `config.yml.sample` + `DEFAULT_CONFIG` for parity. **Recommendation:** skip
   for now (nothing to configure); add later if the help app grows options.

4. **Bookmarking.** `enableBookmarking("url")` moves into `run_app()`. Worth
   reconsidering whether the help app needs it at all (see TODO.md).

## What to adopt vs. skip

| stanpumpR element | Adopt for help app? | Rationale |
| --- | --- | --- |
| `app.R` + `run_app()` | **Yes** | Core of the "same structure" goal. |
| `DESCRIPTION` + `NAMESPACE` + `R/` | **Yes** | Makes it an installable package. |
| `Collate:` field | **Yes** (short list) | Only a handful of files; trivial to maintain. |
| `inst/www` + `addResourcePath` | **Yes** | Proper package asset serving. |
| roxygen (`man/`, `-package.R`, `zzz.R`) | **Yes (light)** | Only `run_app()` needs an export. |
| `tests/testthat` | **Light** | One smoke test that `app_ui()` builds; no PK tests to port. |
| `renv` / `renv.lock` | **Defer / optional** | Heavy for a 3-dependency content app. Add only if deployment reproducibility becomes a concern. |
| `vignettes/` | **Skip** | Nothing to narrate. |
| `inst/extdata`, PK engine, drug library | **Skip** | Not applicable — no data or models here. |
| `CLAUDE.md` / `AGENTS.md` / `GEMINI.md` | **Optional** | A short `CLAUDE.md` could help future agents; low priority. |

## Proposed execution order (each a reviewable commit)

1. Scaffold: `DESCRIPTION`, `NAMESPACE` (roxygen), `stanpumpRHelp.Rproj`,
   `.Rbuildignore`, `LICENSE`/`LICENSE.md`, package doc + `zzz.R`.
2. Move code: `ui.R → R/app_ui.R`, `server.R → R/app_server.R`, derive
   `R/app_run.R`, delete `global.R`; add `app.R`.
3. Move assets: `www/* → inst/www/*`; wire `addResourcePath`; resolve the
   `extendShinyjs` question; update `href`s.
4. Dev helper: `deploy.R → tools/deploy.R`; update `.Rbuildignore`; point
   `deployApp(appDir=...)` at the package root.
5. Smoke test: `tests/testthat/test-app.R` asserting `app_ui()` and
   `run_app()`-construction don't error; run `devtools::check()`.
6. Docs: update `README.md` for the new layout; keep `TODO.md`.

## Verification

- `devtools::load_all(".")` then `run_app()` launches and renders (as verified
  for the current app under R 4.6.1).
- `devtools::check()` passes (no `Collate` omissions, NAMESPACE current).
- Browser console clean; `inst/www` assets return 200.
- Redeploy dry-run: `tools/deploy.R` bundles the package form correctly.

## Open questions for Steve

1. Package name: **`stanpumpRHelp`** OK, or prefer another?
2. `extendShinyjs`/`scrollLogger`: inline it, or drop it until the log panel is
   un-commented?
3. Add `renv` now, or defer until deployment reproducibility is a concern?
4. Keep URL bookmarking, or drop it (help app has no state worth restoring)?
5. Do this as one PR, or land the 6 steps above as separate PRs?
