# Drug reference

Every drug modeled in stanpumpR, with its route(s) of delivery, how the
pharmacokinetic model responds to patient weight and other covariates, the
modeled time to peak effect-site concentration (t<sub>peak</sub>), and the
literature source of the model. Values are taken directly from the drug model
files (`R/drugs_*.R`) in the main stanpumpR package.

Time to peak effect is the interval from a rapid intravenous bolus to the maximum
effect-site concentration — a fixed property of each drug's k<sub>e0</sub> that does
not depend on dose. It is reported in minutes.

| Drug | Route(s) | Weight / covariate scaling | Time to peak effect | Literature reference |
|------|----------|----------------------------|---------------------|----------------------|
| Propofol | IV | Complex (weight, height, age, sex) | 1.6 min | Eleveld DJ et al., *Br J Anaesth* 2018;120(5):942–959 ([PMID 29661412](https://pubmed.ncbi.nlm.nih.gov/29661412/)); t<sub>peak</sub> per Schnider TW et al., *Anesthesiology* 1999;90(6):1502–1516 ([PMID 10360845](https://pubmed.ncbi.nlm.nih.gov/10360845/)) |
| Remifentanil | IV | Complex (weight, height, age, sex, BMI) | 1.6 min | Minto CF et al., *Anesthesiology* 1997;86:10–23 ([PMID 9009935](https://pubmed.ncbi.nlm.nih.gov/9009935/); part II [PMID 9009936](https://pubmed.ncbi.nlm.nih.gov/9009936/)) |
| Fentanyl | IV | Allometric (weight only) | 3.7 min | Scott JC, Stanski DR, *J Pharmacol Exp Ther* 1987;240(1):159–166 ([PMID 3100765](https://pubmed.ncbi.nlm.nih.gov/3100765/)) |
| Alfentanil | IV | None (fixed) | 1.4 min | Scott JC, Stanski DR, *J Pharmacol Exp Ther* 1987;240(1):159–166 ([PMID 3100765](https://pubmed.ncbi.nlm.nih.gov/3100765/)) |
| Sufentanil | IV | None (fixed) | 5.8 min | Gepts E et al., *Anesthesiology* 1995;83(6):1194–1204 ([PMID 8533912](https://pubmed.ncbi.nlm.nih.gov/8533912/)) |
| Morphine | IV | Proportional (weight) | 93.8 min | Lötsch J et al., *Clin Pharmacol Ther* 2002;72(2):151–162 ([PMID 12189362](https://pubmed.ncbi.nlm.nih.gov/12189362/)) |
| Pethidine (meperidine) | IV | Proportional (weight) | 10 min | Björkman S, *J Pharmacokinet Pharmacodyn* 2003;30(4):285–307 ([PMID 14650375](https://pubmed.ncbi.nlm.nih.gov/14650375/)) |
| Hydromorphone | IV, PO, IM, IN | Proportional (weight) | 19.6 min | Drover DR et al., *Anesthesiology* 2002;97(4):827–836 ([PMID 12357147](https://pubmed.ncbi.nlm.nih.gov/12357147/)) |
| Methadone | IV | Proportional (weight) | 11.3 min | Inturrisi CE et al., *Clin Pharmacol Ther* 1987;41(4):392–401 ([PMID 3829576](https://pubmed.ncbi.nlm.nih.gov/3829576/)) |
| Ketamine | IV | Proportional (weight) | 3 min ‡ | Domino EF et al., *Clin Pharmacol Ther* 1984;36(5):645–653 ([PMID 6488686](https://pubmed.ncbi.nlm.nih.gov/6488686/)) |
| Dexmedetomidine | IV | None for adults; complex (weight, age, temperature) for age ≤ 1 yr | 10 min ‡ (2 min if age ≤ 1 yr) | Adult: Dyck JB et al., *Anesthesiology* 1993;78(5):821–828 ([PMID 8098191](https://pubmed.ncbi.nlm.nih.gov/8098191/)). Pediatric (age ≤ 1): Zuppa et al., *Br J Anaesth* 2019 |
| Midazolam | IV | None (fixed) | 4 min | Mould DR et al., *Clin Pharmacol Ther* 1995;58(1):35–43 ([PMID 7628181](https://pubmed.ncbi.nlm.nih.gov/7628181/)); Barr J, Zomorodi K et al., *Anesthesiology* 2001;95(2):286–298 ([PMID 11506097](https://pubmed.ncbi.nlm.nih.gov/11506097/)) |
| Etomidate | IV | Proportional (weight) | 1.6 min | Arden JR et al., *Anesthesiology* 1986;65(1):19–27 ([PMID 3729056](https://pubmed.ncbi.nlm.nih.gov/3729056/)) |
| Lidocaine | IV | Proportional (weight) | 5 min ‡ | Schnider TW et al., *Anesthesiology* 1996;84(5):1043–1050 ([PMID 8623997](https://pubmed.ncbi.nlm.nih.gov/8623997/)) |
| Rocuronium | IV | Proportional (weight) | 2.2 min | Plaud B et al., *Clin Pharmacol Ther* 1995;58(2):185–191 ([PMID 7648768](https://pubmed.ncbi.nlm.nih.gov/7648768/)); t<sub>peak</sub> per Cortínez LI et al., *Br J Anaesth* 2007;99(5):679–685 ([PMID 17681967](https://pubmed.ncbi.nlm.nih.gov/17681967/)) |
| Naloxone | IV | Proportional (weight) | 1 min | Papathanasiou T et al., *Br J Anaesth* 2019;123(2):e204–e214 ([PMID 30915992](https://pubmed.ncbi.nlm.nih.gov/30915992/)) |
| Oxytocin | IV | None (fixed) | 5 min ‡ | Human: Eisenach (unpublished data) § |
| Oxycodone | PO | None (fixed) | 60 min | Lamminsalo M et al., *Expert Opin Drug Deliv* 2019;16(6):649–656 ([PMID 31092024](https://pubmed.ncbi.nlm.nih.gov/31092024/)) |
| Oliceridine | IV | None (fixed) | 15 min | Dahan A et al., *Anesthesiology* 2020;133(3):559–568 ([PMID 32788558](https://pubmed.ncbi.nlm.nih.gov/32788558/)) |
| Remimazolam | IV | Complex (weight, age, sex) | 2.5 min | Eleveld DJ et al., *Br J Anaesth* 2025;135(1):206–217 ([PMID 40312166](https://pubmed.ncbi.nlm.nih.gov/40312166/)) |

**‡** Time to peak effect is annotated as an estimate ("guess") in the model source
(ketamine, dexmedetomidine, lidocaine, oxytocin).

**§** Model uses unpublished data; no published literature citation exists.

## How weight and covariates are handled

Each drug builds a three-compartment model (V1–V3, CL1–CL3). The "weight / covariate
scaling" column above summarizes how those parameters respond to the patient covariates:

- **None (fixed).** Volumes and clearances are fixed constants; body size is not used.
  Because a per-kilogram dose is still multiplied by weight, predicted concentrations
  *rise with body weight* for these drugs.
  *(midazolam, sufentanil, alfentanil, oxycodone, oliceridine, oxytocin, and adult
  dexmedetomidine)*
- **Proportional (weight).** V1 = constant × weight with fixed micro-rate constants, so
  every volume and clearance scales linearly with weight. A per-kilogram dose then gives
  the same concentration profile at any body weight.
  *(morphine, pethidine, hydromorphone, methadone, ketamine, etomidate, lidocaine,
  rocuronium, naloxone)*
- **Allometric (weight only).** Volumes scale linearly with weight; clearances scale to the
  ¾ power of weight. *(fentanyl)*
- **Complex.** Published population models using several covariates — fat-free mass, body
  mass index, maturation, and aging terms.
  *(propofol; remifentanil; remimazolam; dexmedetomidine for age ≤ 1 yr)*

## Notes

- **Routes.** *IV* covers both bolus and infusion dosing. *PO* (oral), *IM*
  (intramuscular), and *IN* (intranasal) use a separate absorption model. Only
  **hydromorphone** (IV / PO / IM / IN) and **oxycodone** (oral only) offer
  non-intravenous routes; every other drug is intravenous only.
- **Two-model drugs.** Dexmedetomidine uses a fixed adult model above 1 year of age and a
  weight/age/temperature model (Zuppa 2019) at or below 1 year. Oxytocin uses a human model
  for weight > 1 kg and a rat model (Tanaka et al.) below it.
- Every citation was resolved to its primary publication and verified on PubMed
  (NCBI E-utilities). The one exception is oxytocin's human model, which derives
  from unpublished data.
