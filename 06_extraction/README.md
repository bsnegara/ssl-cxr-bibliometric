# Extraction matrix (30 documents in L1 or L2: 28 classification, 2 detection)

## File to add before upload

`extraction_matrix.csv`: one row per document, identified by EID and DOI. Remove titles and abstracts; keep only the author's coding.

## Coding scheme

| Column | Values |
|---|---|
| setting | SSL multi-label / partial multi-label / single-positive / SSL multi-class / detection |
| threshold_multilabel | global_single / per_class / pos_neg_separate / per_class_pos_neg / none |
| imbalance_mechanism | threshold / reweighting / alignment / loss / sampling / none |
| prior_assumption | equal_to_labeled / estimated / not_discussed |
| label_dependency | yes / no |
| shift_handled | yes / no |
| metrics | macroAUC / perclassAUC / F1 / mAP |
| source_of_coding | abstract / full_text |

Nine frontier studies were verified from the full text (`source_of_coding = full_text`); see `threshold_mechanisms.csv` and `prior_handling.csv`.
