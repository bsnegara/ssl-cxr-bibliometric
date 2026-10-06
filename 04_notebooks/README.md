# Notebooks (Google Colab, Python runtime with R via rpy2)

## Files to add before upload (clear all outputs first)

| Notebook | Step | Main outputs |
|---|---|---|
| `01_setup.ipynb` | Drive, rpy2, R packages in Drive | R library |
| `02_screening.ipynb` | Screening sheet, kappa, clean corpus, thesaurus | screening sheet, corpus files (not shared) |
| `03_performa.ipynb` | Performance, Bradford's law, local citations, CAGR | `05_results/performance_summary.csv`, `annual_production.csv` |
| `04_tema.ipynb` | Thematic map and evolution | `05_results/thematic_map_clusters.csv` |
| `05_irisan.ipynb` | Lens intersections, UpSet plot, extraction list | `05_results/lens_counts.csv` |
| `06_burst.ipynb` | Kleinberg burst detection | `05_results/burst_main.csv` |
| `07_openalex.ipynb` | OpenAlex coverage check | `01_query/openalex_query.md` |
| `08_final_run.ipynb` | Full re-run on the final 119-document corpus | all numbers reported in the paper |

Every notebook starts with the two cells in `../R/00_setup.R`.
