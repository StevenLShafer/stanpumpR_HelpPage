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

- [ ] **Acknowledgement tabs are empty.** Every contributor tab under
  **Help → Acknowledgements** contains only a `"."` placeholder (Ausems, Bailey,
  Coetzee, Cortinez, De Smet, Eleveld, Egan, Engbers, Gambus, Glass, Glen,
  Jacobs, Kenny, Minto, Reves, Shafer, Schnider, Schwilden, Sepulveda, Stanski,
  Stutzin, Struys, Westenskow). Add a short bio / contribution note for each, or
  collapse into a single credits list.

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
  `www/app.css` rule.
- [ ] **Consider dropping URL bookmarking.** `enableBookmarking(store = "url")`
  is enabled but the help app has no user inputs worth restoring; it exists only
  to mirror the main app. Harmless, but removable.

---

*Not a TODO — already fixed in the R 4.6.1 pass: startup no longer requires
`rsconnect`; `www/` assets now serve (200); `extendShinyjs()`/`scrollLogger`
loads; duplicate `value = "Eleveld"` on the Coetzee/Schnider tabs corrected;
each `tabsetPanel` given a unique id.*
