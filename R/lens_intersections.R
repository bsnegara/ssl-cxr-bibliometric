# Lens membership by text matching on title, abstract, author keywords, Keywords Plus.
# M is the bibliometrix data frame of the final corpus (not shared; rebuild from Scopus).
library(UpSetR)
lens_flags <- function(M) {
  txt <- tolower(paste(M$TI, M$AB, M$DE, M$ID))
  data.frame(
    EID = M$UT,
    MultiLabel = as.integer(grepl("multi-?label|multi label|single positive|partial label", txt)),
    Imbalance  = as.integer(grepl("imbalanc|long-?tail|rare disease|minority class", txt)),
    Shift      = as.integer(grepl(paste0("continual|lifelong|incremental learning|",
                   "domain shift|distribution shift|label shift|prior shift"), txt)))
}
# f <- lens_flags(M)
# upset(f[, -1], sets = c("MultiLabel", "Imbalance", "Shift"), order.by = "freq", keep.order = TRUE)
