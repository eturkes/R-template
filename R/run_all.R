# This script runs all files to perform the analysis.
# Sections can be commented out as needed.
# ---------------------------------------------------

setwd(dirname(parent.frame(2)$ofile)) # Move to location of this file.

data_name <- "liang-2006-array"
rmarkdown::render(
  file.path(data_name, "01_analysis.Rmd"),
  output_file = file.path("..", "..", "results", data_name, "01_analysis.html")
)

# ---------------------------------------------------
