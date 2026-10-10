# Semi-supervised learning on chest X-rays: a bibliometric map of research gaps

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.23182233.svg)](https://doi.org/10.5281/zenodo.23182233)
[![Code license: MIT](https://img.shields.io/badge/code-MIT-blue.svg)](LICENSE)
[![Data license: CC BY 4.0](https://img.shields.io/badge/data-CC%20BY%204.0-lightgrey.svg)](LICENSE-DATA)

Replication package for the paper:

> Negara, B. S. (2026). *Semi-supervised learning on chest X-rays: a bibliometric map of research gaps.* Manuscript under review.

The study maps how the semi-supervised chest X-ray (CXR) literature addresses three conditions of real radiograph collections: multi-label findings, class imbalance, and distribution shift. A validated Scopus query (2017--2026) retrieved 207 records; screening retained 119 documents. Performance, co-citation, co-word, thematic, burst, coupling, and thematic-intersection analyses were combined with full-text extraction of 30 studies, leading to four research gaps (G1--G4) centered on per-class pseudo-labeling under labeled--unlabeled class-prior mismatch.

---

## Contents

| Folder / file | What it contains | Paper section |
|---|---|---|
| `01_query/` | Final Scopus query, gold set (12 DOIs) and its query, thematic lens strings (L1--L5), search log, OpenAlex coverage check | 2.1--2.2, 2.5 |
| `02_screening/` | Screening decision per Scopus EID (I/E, exclusion code, task), stage reconciliation, kappa per validation round, round-3 confusion table | 2.3, Table 2 |
| `03_thesaurus/` | VOSviewer thesaurus for author keywords and for cited references | 2.4 |
| `04_notebooks/` | Google Colab notebooks `01_setup` to `08_final_run` (R via rpy2), outputs cleared | 2.4--2.6 |
| `05_results/` | Aggregated tables behind every result, analysis settings, VOSviewer map/network files, figures | 3.1--3.5 |
| `06_extraction/` | Extraction matrix (30 documents), pseudo-label decision mechanisms, class-prior categories, gap evidence | 2.6, 3.6--3.7 |
| `R/` | Stand-alone scripts: setup, Cohen's kappa, lens intersections, Kleinberg burst detection | 2.3--2.5 |
| `DATA_SHARING.md` | What is and is not shared, and why | -- |
| `CITATION.cff`, `.zenodo.json` | Citation and archive metadata | -- |

### Key result files

| File | Result |
|---|---|
| `05_results/performance_summary.csv` | 119 documents, 78 sources, CAGR 2018--2025 = 30.7% |
| `05_results/annual_production.csv` | Output per year, COVID-19 vs other topics |
| `05_results/cocitation_summary.csv` | 58 foundational works, 5 clusters, 5 from within the corpus |
| `05_results/thematic_map_clusters.csv` | Thematic map quadrants and clusters |
| `05_results/burst_main.csv` | Kleinberg bursts, main settings |
| `05_results/lens_counts.csv` | L1--L5 before and after screening (L3 = 5, L5 = 0) |
| `06_extraction/threshold_mechanisms.csv` | Pseudo-label decision mechanisms of 9 full-text-verified studies |
| `06_extraction/prior_handling.csv` | Operational categories of class-prior handling |
| `06_extraction/research_gaps.md` | Evidence for G1--G4 |

---

## Data and licensing

Scopus records (abstracts, author keywords, Keywords Plus, cited-reference lists) are licensed by Elsevier and are **not redistributed**. This repository shares only identifiers (EID, DOI), the author's own screening and coding decisions, thesauri, scripts, and aggregated results. Details: [`DATA_SHARING.md`](DATA_SHARING.md).

Record-level decisions of the three blinded validation samples were kept in working spreadsheets that were not retained; `02_screening/validation_summary.csv` and `validation_round3_confusion.csv` contain the reported results (round 3: n = 31, Cohen's kappa = 0.55, 77.4% agreement).

---

## How to reproduce

1. **Retrieve the records.** Run `01_query/scopus_query_S1.txt` in Scopus Advanced Search. The original run (29 September 2026) returned 207 records; the analysis export was made on 1 October 2026. Later runs return more records because new papers are indexed.
2. **Export.** Export all records as CSV with all fields, including *References*. Save as `02_raw/scopus_S1.csv` in your own copy (this folder is excluded from the repository).
3. **Rebuild the corpus.** Keep the records whose EID has `decision = I` in `02_screening/screening_decisions.csv` (119 documents). Records published after the export date are outside the corpus.
4. **Run the analyses.** Open the notebooks in `04_notebooks/` in Google Colab in numeric order. Each notebook starts with the two setup cells in `R/00_setup.R` (mount Drive, load rpy2, set the R library path). `08_final_run` reproduces every number in the paper.
5. **Build the network maps.** In VOSviewer, use the settings in `05_results/analysis_settings.csv` and the thesauri in `03_thesaurus/`.
6. **Compare.** Check your outputs against the tables in `05_results/` and `06_extraction/`.

### Workflow

```
Scopus query (207) ──► screening (119) ──► bibliometrix / VOSviewer / Kleinberg burst
        │                    │                         │
   gold-set recall      blinded validation       lens intersections (L1–L5)
   precision check      (kappa = 0.55)           OpenAlex coverage check
                                                       │
                                     full-text extraction (30) ──► gaps G1–G4
```

---

## Software

| Tool | Version | Use |
|---|---|---|
| R in Google Colab (rpy2) | Colab default, October 2026 | All R analyses |
| bibliometrix | 5.5.0 | Performance, Bradford's law, thematic map and evolution |
| UpSetR, readxl, writexl, ggplot2 | CRAN, October 2026 | Lens intersections, spreadsheets, plots |
| VOSviewer | 1.6.21 | Co-occurrence, co-citation, bibliographic coupling |
| openalexR | CRAN | Coverage check |

Burst detection uses Kleinberg's two-state algorithm implemented in R ([`R/kleinberg_burst.R`](R/kleinberg_burst.R)), the same algorithm as in CiteSpace.

Title--abstract screening was assisted by a large language model (Claude, Anthropic). Every decision was reviewed by the author, and agreement was validated on a blinded random sample.

---

## Main settings

| Analysis | Settings |
|---|---|
| Co-occurrence (map A) | Author keywords; fractional counting; min. 2 occurrences; largest connected component |
| Co-citation (map B) | Cited references; reference thesaurus; min. 3 citations |
| Bibliographic coupling (map C) | Documents 2022--2026; fractional counting; largest connected component |
| Thematic map / evolution | Min. frequency 3 / 2; evolution cut points 2020 and 2022 |
| Burst detection | Main: frequency >= 3, s = 2, gamma = 1; sensitivity: frequency >= 2, gamma = 0.5 |
| Lenses | Text matching on title, abstract, author keywords, Keywords Plus |

Full list: [`05_results/analysis_settings.csv`](05_results/analysis_settings.csv).

---

## Citation

If you use this repository, please cite the paper and the archived package:

```bibtex
@misc{negara2026sslcxrdata,
  author    = {Negara, Benny Sukma},
  title     = {Semi-supervised learning on chest {X}-rays: a bibliometric map of
               research gaps (replication package)},
  year      = {2026},
  publisher = {Zenodo},
  doi       = {10.5281/zenodo.23182233},
  url       = {https://doi.org/10.5281/zenodo.23182233}
}
```

GitHub also provides a formatted citation through **Cite this repository** (from `CITATION.cff`).

---

## License

- Code (`R/`, `04_notebooks/`): MIT, see [`LICENSE`](LICENSE).
- Data, decisions, thesauri, extraction coding, and tables: CC BY 4.0, see [`LICENSE-DATA`](LICENSE-DATA).

## Contact

Benny Sukma Negara
Department of Informatics Engineering, Faculty of Science and Technology,
Universitas Islam Negeri Sultan Syarif Kasim Riau, Pekanbaru, Indonesia
bsnegara@uin-suska.ac.id · ORCID [0000-0001-8455-0912](https://orcid.org/0000-0001-8455-0912)
