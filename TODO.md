# stanpumpR Help — TODO

Outstanding content and cleanup items, captured during the August 2026 R 4.6.1
modernization review. These are **content / polish** items — the app runs
cleanly under R 4.6.1 and has no known code defects. Ordered roughly by user
impact.

## Content: placeholder / incomplete text

- [ ] **Drug PK descriptions are stubs.** Every drug tab under **Help → Drugs**
  ends mid-sentence: *"The pharmacokinetics for <drug> are taken from"* with no
  citation. Only Fentanyl names a source ("Scott and Stanski"), and even that is
  incomplete. Needs a full reference for each of: Alfentanil, Dexmedetomidine,
  Etomidate, Fentanyl, Hydromorphone, Ketamine, Lidocaine, Methadone, Midazolam,
  Morphine, Naloxone, Oxycodone, Oxytocin, Pethidine, Propofol, Remifentanil,
  Rocuronium, Sufentanil.

- [x] **Acknowledgement bios added.** The empty per-contributor placeholder tabs
  were replaced with a single page grouped by institution, rendered from
  `inst/extdata/pk-author-summaries.md` (50 contributors, alphabetized by
  institution and by surname within each). Remaining `[verify]` tags in that file
  (birth years and a few citation specifics) still need confirmation before the
  next deploy — `grep -n "verify" inst/extdata/pk-author-summaries.md`.

- [ ] **Gas engine contributors added 2026-10-05** (commit `fddcdcc` on
  `acknowledgements-author-bios`): **James H. Philip** (Harvard section)
  rewritten and expanded — Gas Man as the landmark inhaled-anesthetic
  simulation, the research done with it, and stanpumpR's inhaled engine placed
  explicitly on that foundation; **Richard H. Epstein** added under a new
  `## University of Miami` section (AIMS/OR-management work, the fresh-gas-flow
  and age-adjusted-MAC studies, and his validation of the engine against Gas
  Man). Three `[verify]` tags mark facts Shafer should confirm personally:
  Epstein's title and his years at Jefferson, Philip's Harvard appointment.
  Citations were checked against PubMed. The same commit repaired three leftover
  find-and-replace artifacts (Jacobs, Rosow, Goodale entries).
  **For the docx / indexed-HTML help:** generate the Acknowledgements chapter
  from this file (e.g. `pandoc inst/extdata/pk-author-summaries.md`) rather than
  copying prose — the `##` institution headings become the index entries, and
  this file stays the single source of truth per README. Strip the `[verify]`
  tags only once each fact is confirmed.

## Content: wrong headers / copy-paste errors in "How to …"

Several **Help → How to …** sub-tabs have bold headers and/or body text
copy-pasted from the wrong section:

- [ ] **"Delete a drug"** — header reads "Add a drug"; body is the *add-a-drug*
  text. Should describe deleting a drug.
- [ ] **"Add a dose"** — header reads "Add a drug"; should read "Add a dose".
- [ ] **"Edit a dose"** — header reads "Edit a drug"; should read "Edit a dose".
- [ ] **"Delete a dose"** — header reads "Edit a drug"; should read
  "Delete a dose".
- [ ] **"Add/Edit Events"** — header reads "Edit a drug" and body is the
  *edit-a-dose* text. Should describe adding/editing events.

## Assets

- [ ] **No favicon.** The three dead `logo.ico` `<link>` tags were removed during
  the R 4.6.1 pass (the file never existed). Add a real favicon to `www/` and a
  single `tags$head(tags$link(rel = "icon", href = "..."))` if a tab icon is
  wanted.
- [ ] **Unreferenced image cruft** at the repo root: `cancel.png` and
  `cancel..jpg` (note the double dot). Neither is referenced by the app — only
  mentioned in a commented-out `readPNG` line. Remove, or wire up if intended.

## Optional cleanup

- [ ] **Dates / copyright.** The **About** tab is signed "October 2019" and
  "Copyright 2019". Refresh if appropriate.
- [ ] **Duplicated inline CSS.** The `.nav-tabs > li > a` style block is repeated
  verbatim inside each of the three Examples tab panels. Hoist to a single
  `inst/www/app.css` rule.

---

*Not a TODO — already fixed in the R 4.6.1 pass: startup no longer requires
`rsconnect`; `www/` assets now serve (200); `extendShinyjs()`/`scrollLogger`
loads; duplicate `value = "Eleveld"` on the Coetzee/Schnider tabs corrected;
each `tabsetPanel` given a unique id.*
