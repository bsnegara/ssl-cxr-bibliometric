# Semi-supervised learning on chest X-rays: a bibliometric map of research gaps

Replication package for the paper:

> Negara, B. S. (2026). *Semi-supervised learning on chest X-rays: a bibliometric map of research gaps.* Manuscript submitted to IAES International Journal of Artificial Intelligence (IJ-AI).

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.XXXXXXX.svg)](https://doi.org/10.5281/zenodo.XXXXXXX)

## What this repository contains

| Folder | Content |
|---|---|
| `01_query/` | Final Scopus query, thematic lens strings (L1--L5), gold set (DOIs), OpenAlex query |
| `02_screening/` | Screening decisions per Scopus EID (I/E, exclusion code, task), blinded validation samples, kappa |
| `03_thesaurus/` | VOSviewer thesaurus for author keywords and for cited references |
| `04_notebooks/` | Google Colab notebooks `01_setup` to `08_final_run` (R via rpy2) |
| `05_results/` | Aggregated tables behind every figure and table in the paper, VOSviewer map and network files |
| `06_extraction/` | Extraction matrix for the 30 documents in L1 or L2 |
| `R/` | Stand-alone reference scripts (setup, kappa, lens intersections, Kleinberg burst detection) |

## Data and licensing note

Scopus records (abstracts, keywords, cited-reference lists) are licensed by Elsevier and are **not redistributed** here. This repository shares only identifiers (EID, DOI), the author's own screening and coding decisions, thesauri, scripts, and aggregated results. See `DATA_SHARING.md`.

## How to reproduce

1. Run the query in `01_query/scopus_query_S1.txt` in Scopus (Advanced search). The original run was on 29 September 2026 and returned 207 records; the export used for analysis was made on 1 October 2026. Newer runs will return more records.
2. Export all records as CSV with all fields including *References*, and save as `02_raw/scopus_S1.csv` (not included).
3. Keep only the records whose EID is marked `I` in `02_screening/screening_decisions.csv` (119 documents).
4. Open the notebooks in `04_notebooks/` in Google Colab in numeric order. The first two cells of every notebook mount Google Drive, load rpy2, and set the R library path (see `R/00_setup.R`).
5. Build the VOSviewer maps with the settings in `05_results/analysis_settings.csv` and the thesauri in `03_thesaurus/`.

## Software

| Tool | Version | Use |
|---|---|---|
| R (Google Colab, rpy2) | Colab default, October 2026 | All R analyses |
| bibliometrix | 5.5.0 | Performance, Bradford's law, thematic map and evolution |
| UpSetR, readxl, writexl, ggplot2 | CRAN, October 2026 | Lens intersections, spreadsheets, plots |
| VOSviewer | 1.6.21 | Co-occurrence, co-citation, bibliographic coupling |
| openalexR | CRAN | Coverage check |

Burst detection uses Kleinberg's two-state algorithm implemented in R (`R/kleinberg_burst.R`), the same algorithm as in CiteSpace.

Title--abstract screening was assisted by a large language model (Claude, Anthropic); every decision was reviewed by the author and validated on a blinded random sample (Cohen's kappa 0.55).

## Citation

Please cite the paper and this repository (see `CITATION.cff`).

## License

Code: MIT (`LICENSE`). Data, decisions, and tables: CC BY 4.0 (`LICENSE-DATA`).

## Contact

Benny Sukma Negara, Department of Informatics Engineering, Faculty of Science and Technology, Universitas Islam Negeri Sultan Syarif Kasim Riau, Indonesia. bsnegara@uin-suska.ac.id, ORCID [0000-0001-8455-0912](https://orcid.org/0000-0001-8455-0912).
