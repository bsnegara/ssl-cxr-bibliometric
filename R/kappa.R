# Cohen's kappa between two screening decisions (I/E).
# Usage: cohen_kappa(read.csv("02_screening/validation_round3.csv"),
#                    "decision_llm_assisted", "decision_blind")
cohen_kappa <- function(df, a, b, levels = c("I", "E")) {
  tab <- table(factor(df[[a]], levels), factor(df[[b]], levels))
  po <- sum(diag(tab)) / sum(tab)
  pe <- sum(rowSums(tab) * colSums(tab)) / sum(tab)^2
  list(table = tab, agreement = po, expected = pe, kappa = (po - pe) / (1 - pe))
}
