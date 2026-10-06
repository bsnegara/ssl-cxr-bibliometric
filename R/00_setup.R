# Two opening cells used in every Colab notebook.
#
# Cell 1 (Python):
#   from google.colab import drive
#   drive.mount('/content/drive')
#   %load_ext rpy2.ipython
#   !apt-get -qq install -y libpoppler-cpp-dev libglpk-dev libxml2-dev > /dev/null
#
# Cell 2 (R, prefixed with %%R in Colab):
proj <- "/content/drive/MyDrive/bibliometrik-cxr"
lib  <- file.path(proj, "Rlib")
dir.create(lib, recursive = TRUE, showWarnings = FALSE)
.libPaths(c(lib, .libPaths()))
pkgs <- c("bibliometrix", "UpSetR", "readxl", "writexl", "ggplot2", "htmlwidgets")
new <- pkgs[!pkgs %in% rownames(installed.packages())]
if (length(new)) install.packages(new, lib = lib)
setwd(proj)
