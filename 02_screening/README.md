# Screening

| File | Content |
|---|---|
| `screening_decisions.csv` | EID, DOI, year, decision (I/E), exclusion code, task for all 207 records (titles and abstracts removed) |
| `screening_reconciliation.csv` | Document counts across the three screening stages |
| `validation_summary.csv` | Kappa per validation round (sample size, seed, pool) |
| `validation_round3_confusion.csv` | 2x2 table behind kappa = 0.55 (round 3, reported in the paper) |

Record-level decisions of the three validation samples were recorded in working spreadsheets that were not retained; the summary and confusion table are the reported results.

## Criteria

Include: learns from both labeled and unlabeled data on chest radiographs. Partial-label and single-positive multi-label studies count as semi-supervised at the label level.

| Code | Exclusion reason |
|---|---|
| E1 | Not semi-supervised (incl. self-supervised pre-training only, label noise or weak labels without unlabeled images, domain adaptation including source-free and unsupervised variants) |
| E2 | Not chest X-ray images |

Rule for uncertain records: include.
