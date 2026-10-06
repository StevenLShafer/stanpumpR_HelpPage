# Inhaled anesthetic engine — scenarios for the help file

Written 2026-10-05 by Claude Code (Claude Fable 5.1) at the request of Steven
L. Shafer, for the session that expands the help file (docx and indexed HTML).
Part 1 is the record of what Richard Epstein ran for us and what it showed.
Part 2 proposes further scenarios to explain what the engine does. Everything
in Part 1 is backed by files in the stanpumpR repository; everything in Part 2
is a proposal and has not been run against any reference.

Source of record for Part 1: `inst/validation/VALIDATION.md` in stanpumpR
(dated entries), `inst/validation/gasman_engine_scenarios.R` (the definitions),
`gasman_engine_scenarios_results.csv` (every number) and
`gasman_engine_scenarios_settings.csv` (the settings as entered in Gas Man).

---

## Part 1 — The scenarios Richard Epstein ran

### How to read the numbers

Three programs appear in the tables below:

* **Gas Man** — James Philip's program, the reference. Epstein ran the first two
  scenarios in the web edition in September 2026 through the Gas Man API; the
  later runs used Gas Man's own command-line runner, `gasman_run`, built from
  its published source (`github.com/rasman/gasmanonline`, commit `d3a2dd3`).
  Gas Man advances in 6-second ticks and stores its results in single
  precision.
* **The engine** — `advanceClosedFormGas()`, what the stanpumpR app runs. It
  advances each step exactly (matrix exponential) rather than in ticks.
* **The limit** — what Gas Man's own equations converge to as its tick is made
  arbitrarily small. The engine sits on the limit; Gas Man at its native tick
  is 1–3% away from it in the first minutes after any change and converges
  afterwards. That gap is Gas Man's distance from its own limit, not a modelling
  difference, and it is the reason the two programs do not agree digit for digit.

All comparisons were made on a like-for-like footing: nitrogen carried as an
agent on both sides, starting at room air (78.07%), no dead space, no oxygen
consumption, and the same circuit model (Gas Man's "Ideal", which the app uses
by default; the semi-closed tables are also in the CSV). The app itself now
adds 30% dead space and oxygen consumption, so **the app's numbers for these
same dose tables will differ slightly from the tables here** — see "Entering
these in the app" at the end of Part 1.

Compartments: CKT circuit (inspired), ALV alveolar, VRG vessel-rich group
(brain), MUS muscle, FAT fat. All in percent of one atmosphere.

**Two meanings of "MAC", kept apart throughout.** *MAC* is a property of an
agent: the alveolar concentration at which half of patients do not move to
incision — 2.1% for sevoflurane at age 40, lower in the old, higher in the
young. It does not change during an anesthetic. What changes is the patient's
alveolar concentration *expressed as a multiple of that MAC*, which the app
plots as **MAC equivalents** (the panel is labelled so; Dexter and Epstein's
papers call the same quantity the *MAC fraction*). "1 MAC of sevoflurane"
below means an alveolar concentration of one MAC equivalent, i.e. 2.1% at age
40; "0.1 MAC" as a threshold means 0.1 MAC equivalents. When agents are given
together their MAC equivalents are summed.

### The five scenarios

| # | Scenario | Why it was chosen |
|---|---|---|
| 1 | Sevoflurane 2% at FGF 8 L/min, 30 min | The anchor. Epstein's Scenario 1, run in Gas Man on 2026-09-04 |
| 2 | Sevoflurane 2% with 70% nitrous oxide delivered, FGF 8, 30 min | The second gas effect. Epstein's Scenario 2 |
| 3 | A whole anesthetic over 180 min: 2% at FGF 6; 3% from 30 min; 1.5% at FGF 2 from 60 min; vaporiser off at FGF 10 from 150 min | Proposed by Epstein on 2026-09-06. The first scenario with setting changes, low flow after a step down, and emergence |
| 4 | Desflurane 6% at FGF 4 for 10 min, then 8% at FGF 0.5 to 60 min | Low flow, where the circuit equation dominates and rebreathing matters most |
| 5 | 100 kg patient, isoflurane 1.2% at FGF 2, 30 min, Gas Man's weight-scaled defaults (VA 5.23, CO 6.53) | The first comparison away from 70 kg |

All at 70 kg except scenario 5; alveolar ventilation 4 L/min and cardiac output
5 L/min (Gas Man's defaults) except scenario 5; uptake coupling on.

**Epstein's September grid.** Before these five, Epstein ran a five-case grid
in Gas Man, all at 70 kg, constant settings, 30 minutes, semi-closed circuit:

| case | agent | dial % | FGF | VA | CO |
|---|---|---|---|---|---|
| 1 | sevoflurane | 2.0 | 8 | 4 | 5 |
| 2 | sevoflurane + 70% nitrous oxide | 2.0 | 8 | 4 | 5 |
| 3 | isoflurane | 1.2 | 2 | 4 | 5 |
| 4 | desflurane | 6.0 | 0.5 | 4 | 5 |
| 5 | sevoflurane + 70% nitrous oxide | 2.0 | 2 | 6 | 2.5 |

Cases 1 and 2 became scenarios 1 and 2; case 3 is scenario 5 at 70 kg; case 4
is the low-flow half of scenario 4 without the wash-in; case 5 — low flow,
high ventilation, low cardiac output — has no counterpart above and is worth
keeping as a scenario in its own right (see Part 2, C). The grid, our side's
numbers for it, and the concordance are recorded in `VALIDATION.md` under
2026-09-04.

### Scenario 1 — sevoflurane wash-in at high flow

Dose table: oxygen 8 L/min, sevoflurane 2%, ventilation 4 L/min (alveolar).

| min | ALV engine | ALV Gas Man | VRG engine | VRG Gas Man | MUS engine | FAT engine |
|---|---|---|---|---|---|---|
| 1 | 1.094 | 1.084 | 0.247 | 0.229 | 0.006 | 0.000 |
| 5 | 1.473 | 1.465 | 1.118 | 1.103 | 0.044 | 0.002 |
| 10 | 1.622 | 1.618 | 1.510 | 1.503 | 0.099 | 0.005 |
| 30 | 1.712 | 1.712 | 1.707 | 1.707 | 0.317 | 0.019 |

What it shows: with no rebreathing (FGF above ventilation) the inspired
concentration is the dial from the first breath; alveolar reaches half the dial
within the first minute and 86% by 30 minutes; the brain follows the alveolus
with a lag of a few minutes; muscle is still filling at 30 minutes and fat has
barely started. Worst engine–Gas Man difference 1.1% of peak, at 1 minute.

This is the scenario that established that the engine *is* Gas Man: run without
nitrogen on Gas Man's stock settings, alveolar sevoflurane is 1.1852 at 5 min
and 1.5931 at 30 min, which are Epstein's own September figures from the web
edition to four decimals.

### Scenario 2 — the second gas effect

Dose table: oxygen 2.3 L/min, nitrous oxide 5.7 L/min, sevoflurane 2%,
ventilation 4. (Flows chosen so that delivered nitrous oxide is 70% after the
vaporiser displaces 2% of the carrier.)

| min | sevo ALV engine | sevo ALV Gas Man | sevo ALV, scenario 1 | N2O ALV engine | N2O ALV Gas Man |
|---|---|---|---|---|---|
| 1 | 1.304 | 1.285 | 1.094 | 51.3 | 50.4 |
| 5 | 1.653 | 1.645 | 1.473 | 66.7 | 66.5 |
| 10 | 1.767 | 1.763 | 1.622 | 67.6 | 67.6 |
| 30 | 1.811 | 1.811 | 1.712 | 68.4 | 68.4 |

What it shows: the only difference from scenario 1 is the nitrous oxide, yet
alveolar sevoflurane is 19% higher at one minute and 12% higher at five. The
large volume of nitrous oxide being taken up draws more fresh gas into the
alveoli and concentrates the sevoflurane left behind — the second gas effect —
and the same mechanism, acting on nitrous oxide itself, is the concentration
effect. Worst engine–Gas Man difference 2.2% of peak (nitrous oxide at 1 min).

Note for the help file: an earlier version of the engine had this coupling
disabled, on a mistaken reading that Gas Man did not implement it. Epstein's
Scenario 2 is what exposed that: alveolar sevoflurane was 16.7% low at five
minutes. This is the best single example of why the comparison was worth doing.

### Scenario 3 — a whole anesthetic: step up, step down, emergence

Dose table: ventilation 4; at 0 min oxygen 6, sevoflurane 2%; at 30 min
sevoflurane 3%; at 60 min oxygen 2, sevoflurane 1.5%; at 150 min oxygen 10,
sevoflurane 0.

| min | event | CKT engine | ALV engine | ALV Gas Man | VRG engine | MUS engine |
|---|---|---|---|---|---|---|
| 30 | about to step up | 2.00 | 1.712 | 1.712 | 1.707 | 0.317 |
| 60 | about to step down, flow 6 to 2 | 3.00 | 2.609 | 2.608 | 2.604 | 0.758 |
| 65 | five minutes at low flow | 1.53 | 1.552 | 1.565 | 1.840 | 0.795 |
| 150 | vaporiser off, flow to 10 | 1.40 | 1.302 | 1.302 | 1.300 | 1.028 |
| 151 | | 0.00 | 0.537 | 0.541 | 1.128 | 1.027 |
| 155 | | 0.00 | 0.272 | 0.278 | 0.519 | 1.007 |
| 160 | | 0.00 | 0.169 | 0.172 | 0.246 | 0.979 |
| 180 | | 0.00 | 0.111 | 0.111 | 0.113 | 0.862 |

What it shows, in order:

* At 60 min the dial is halved and the flow drops to 2 L/min, below the
  ventilation. The inspired concentration (CKT) falls to 1.53, not 1.5: the
  patient is now rebreathing, and exhaled gas, richer in sevoflurane than the
  fresh gas, makes up the difference.
* From 60 to 150 min the brain *falls* while muscle keeps *rising* — the agent
  is redistributing from the vessel-rich group into muscle, which at 150 min
  holds nearly as much as the brain.
* At 150 min the vaporiser is turned off and the flow turned up to 10 L/min so
  there is no rebreathing. Alveolar sevoflurane falls to 0.54 within a minute,
  the brain to 0.52 within five. Muscle and fat have hardly moved; they will
  release agent for hours, which is what keeps the alveolar level at 0.11 half
  an hour later.
* The largest engine–Gas Man gap of all five scenarios in relative terms is here,
  five minutes after the vaporiser goes off: Gas Man reads 2–3% above the
  engine, because its 6-second tick lags a fast change. Worst difference 0.64%
  of peak.

This is the scenario to pair with the **time until threshold** feature: with
the threshold at 0.1 MAC, the plot shows at every moment how long emergence
would take if the vaporiser were turned off then.

### Scenario 4 — desflurane, wash-in then low flow

Dose table: ventilation 4; at 0 min oxygen 4, desflurane 6%; at 10 min oxygen
0.5, desflurane 8%.

| min | event | CKT engine | ALV engine | ALV Gas Man | VRG engine | MUS engine |
|---|---|---|---|---|---|---|
| 10 | flow 4 to 0.5, dial 6 to 8 | 6.00 | 5.330 | 5.325 | 5.185 | 0.527 |
| 11 | | 5.38 | 5.007 | 5.015 | 5.164 | 0.582 |
| 15 | | 5.08 | 4.663 | 4.677 | 4.805 | 0.776 |
| 30 | | 4.96 | 4.531 | 4.531 | 4.519 | 1.386 |
| 60 | | 5.28 | 4.893 | 4.887 | 4.868 | 2.380 |

What it shows: at 0.5 L/min the fresh gas is an eighth of the ventilation.
Turning the dial *up* from 6 to 8% at that moment does not raise the inspired
concentration; it falls from 6.0 to 5.4 and then to 5.0, because seven-eighths
of each breath is exhaled gas and the exhaled gas is below the dial. The dial
setting is not the inspired concentration at low flow. Only at 60 min, with
muscle filling and uptake falling, does the inspired level climb back towards
the dial. Worst engine–Gas Man difference 1.5% of peak.

### Scenario 5 — a 100 kg patient

Dose table: oxygen 2 L/min, isoflurane 1.2%, ventilation 5.23 L/min (alveolar);
cardiac output 6.53 L/min. These are Gas Man's defaults scaled by
(100/70)^0.75, which the app now applies automatically.

| min | CKT engine | ALV engine | ALV Gas Man | VRG engine | MUS engine |
|---|---|---|---|---|---|
| 1 | 0.605 | 0.236 | 0.229 | 0.050 | 0.001 |
| 5 | 0.697 | 0.386 | 0.379 | 0.268 | 0.010 |
| 10 | 0.761 | 0.489 | 0.483 | 0.425 | 0.026 |
| 30 | 0.840 | 0.617 | 0.615 | 0.608 | 0.099 |

What it shows: the inspired concentration never reaches the 1.2% dial, because
2 L/min of fresh gas into 5.2 L/min of ventilation means more than half of each
breath is rebreathed; and isoflurane, the most soluble of the three agents in
the library, is still far from equilibrium at 30 minutes (alveolar 0.62 of a
1.2 dial, against sevoflurane's 1.71 of 2 at the same time in scenario 1 — a
different flow, but the solubility is most of the difference). Worst
engine–Gas Man difference 1.2% of peak. This scenario is the only check of the
weight scaling against Gas Man.

### Entering these in the app

The app asks for **minute** ventilation and takes 30% of it as dead space, so
alveolar ventilation of 4 L/min corresponds to a `ventilation` row of **5.7**
L/min (the app's default at 70 kg), and scenario 5's 5.23 to **7.5** (the
default at 100 kg). Gas flows and ventilation are rounded to 0.1 L/min, so
scenario 2's flows become oxygen 2.3 and nitrous oxide 5.7 (69.8% delivered).
Entering a gas adds the ventilation row automatically; entering nitrous oxide
adds oxygen at 21% of the total if none is present. Set age to 40 so that the
age-adjusted MAC equals Gas Man's. With dead space and oxygen consumption in
play the app's curves run a little above these tables at low flow and are
otherwise the same shape; the differences are listed in the user's guide under
"Where the engine deliberately differs from Gas Man".

Epstein's own Gas Man outputs for the September grid were sent as PDFs, one
per case and agent (`Scenario 1.pdf`, `Scenario 2 SEV.pdf`, `Scenario 2 N2O.pdf`,
`Scenario 3.pdf`, `Scenario 4.pdf`, `Scenario 5.pdf`, `Scenario 5 N2O.pdf`),
and sit in Shafer's Downloads folder on Grey as of 2026-10-05. They are Gas
Man's semi-closed circuit at its native tick, without nitrogen, so they predate
and do not reflect the ideal-circuit default or the dead-space and
oxygen-volume changes. They are the right illustrations for a help-file
paragraph on the validation, and should be copied somewhere durable.

---

## Part 2 — Proposed scenarios to explain the engine

These are chosen so that each one isolates a single idea, the plot makes the
idea visible without a table, and together they cover every feature the engine
has. None has been run against a reference; the numbers quoted are expectations
from the model's structure and should be read off the app before they go into
the help file. They are ordered as a teaching sequence.

### A. Solubility: the same MAC, three agents

Desflurane 1 MAC (6%), sevoflurane 1 MAC (2%), isoflurane 1 MAC (1.15%), each
alone, oxygen 6 L/min, 70 kg, 40 years, two hours on then vaporiser off with
flow at 10. One run per agent, compared on the MAC-equivalents panel.

Shows: wash-in and washout speed follow blood solubility (0.42, 0.65, 1.4).
Desflurane reaches 0.9 MAC in the brain in minutes and is below 0.1 MAC within
minutes of being turned off; isoflurane takes far longer both ways. This is the
inhaled version of the context-sensitive decrement time (Bailey 1997), and it is
the first thing a trainee should see.

### B. The second gas effect, isolated

Scenario 1 and scenario 2 side by side, sevoflurane only displayed. Already
validated; needs no new run. Shows that adding 70% nitrous oxide raises
alveolar sevoflurane by a fifth in the first minute with the dial unchanged.

Variant: nitrous oxide alone at 70% and at 10% (with the oxygen adjusted),
normalised to the delivered concentration — the concentration effect on
nitrous oxide itself.

### C. Fresh gas flow and rebreathing: the dial is not the inspired concentration

Sevoflurane 2% for 60 min at oxygen 8, 4, 2, 1 and 0.5 L/min, minute
ventilation at the default 5.7. Five runs, inspired (circuit) line displayed.

Shows: at 8 and at 4 (just above the 4 L/min alveolar ventilation plus uptake)
inspired equals the dial. At 2, 1 and 0.5 it falls progressively below it, and
the time to reach a given alveolar level lengthens. Reinforce with scenario 4,
where turning the dial up at low flow still lets the inspired level fall. This
is the ideal-circuit behaviour the APSF article (Feldman, Lampotang, Hendrickx
2022) describes: no rebreathing once fresh gas flow exceeds minute ventilation.

Variant — Epstein's grid case 5: sevoflurane 2% with 70% nitrous oxide at a
total flow of 2 L/min, minute ventilation raised to about 8.6 (alveolar 6) and
cardiac output 2.5 L/min. Low flow, high ventilation and a halved cardiac
output pull in opposite directions: rebreathing holds the inspired level down,
while the high ventilation and the low cardiac output (less blood to carry
agent away) push the alveolar level up. Gas Man's answer for it exists, so this
one can be checked.

### D. Emergence and "time until threshold"

Scenario 3 with the threshold display on, MAC threshold 0.1. Shows the curve of
"minutes until 0.1 MAC if turned off now" rising through the case as muscle and
fat fill, and the sharp drop at 150 min when the vaporiser does go off.

Variant: the same anesthetic with the vaporiser turned off at 150 min but the
flow left at 2 L/min instead of 10. Emergence is visibly slower because the
patient rebreathes their own exhaled agent. The engine's threshold calculation
assumes the flow is turned up, so this variant also shows the user why.

### E. Age and MAC

Sevoflurane 2% at oxygen 6 for 30 min in a 25-year-old and an 80-year-old,
same weight. Alveolar percent is nearly identical; the MAC-equivalents panel is
not — 2% sevoflurane is about 0.9 MAC equivalents at 25 and about 1.3 at 80,
because MAC itself falls with age (Mapleson). Pairs
naturally with Epstein's work on age-adjusted MAC fractions at the end of
surgery and prolonged extubation (Dexter, Marian, Epstein 2026).

### F. Opioids reduce MAC

Sevoflurane 1.5% at oxygen 6 with and without remifentanil 0.1 mcg/kg/min, the
"Include opioid–MAC interaction" box checked. Shows the opioid-adjusted MAC
line rising above the plain MAC line as the remifentanil effect site
equilibrates, with the same vaporiser setting. State in the help text, as the
guide does, that the interaction model is approximate.

### G. Hypoventilation after emergence re-anesthetizes

From scenario 3, after the vaporiser is off and the brain has fallen to about
0.3 MAC (around 160 min), set ventilation to 1 L/min. Shows the alveolar and
brain levels *rise* as agent returns from muscle faster than the reduced
ventilation can clear it. This is Leeson, Roberson and Philip's 2014 Gas Man
finding reproduced in stanpumpR, and a good place to acknowledge Gas Man in the
help text. (The engine will need checking at very low ventilation; it was
guarded against absurd values on 2026-10-05.)

### H. Nitrogen washout and preoxygenation

No anesthetic: oxygen 10 L/min for 5 min, then air. Shows alveolar nitrogen
falling from 78% and oxygen rising towards 100% — and the slow tail as nitrogen
leaves muscle and fat — then the reverse. The engine carries nitrogen and
oxygen as gases, which Gas Man as usually run does not; this scenario shows
why they are there.

### I. Oxygen at low flow: the fractions must add up

Oxygen 0.3 L/min with nitrous oxide 1 L/min, 60 kg, for an hour. Shows the
inspired mixture settling at about 12% oxygen and 88% nitrous oxide although
23% of the delivered gas is oxygen, because the patient consumes 0.21 L/min of
it. A hypoxic inspired mixture at a dial setting that looks safe — the clinical
point behind modelling oxygen consumption and the strongest argument for it.
Flag the respiratory quotient (0.8) as the modelling assumption it is.

### J. Diffusion hypoxia

Nitrous oxide 70% for 60 min, then oxygen off and air at 6 L/min. Expect a
transient fall in alveolar oxygen below 21% as nitrous oxide leaving the blood
dilutes it. This is physically in the model (negative uptake enters the
coupling) but has not been looked at; check that the dip appears and is of the
right order (a few percent for a few minutes) before using it.

### What the sequence covers

A solubility and the compartments; B the uptake coupling; C the circuit and
fresh gas flow; D time until threshold; E age-adjusted MAC; F the opioid
interaction; G Gas Man's best-known clinical lesson; H nitrogen and oxygen as
carried gases; I oxygen consumption; J the coupling acting in reverse. Between
them, every deliberate difference from Gas Man in the user's guide is
illustrated by at least one scenario.

Suggested order of work: run each in the app, keep the dose table and a
screenshot, and only then write the help text to what the plot actually shows.
