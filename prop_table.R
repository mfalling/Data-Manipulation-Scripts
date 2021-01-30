# Get the proportion of numerical values.

prop_table <- function(x) {
  proportion <- prop.table(x)
  proportion <- colSums(proportion)
  proportion <- data.frame(proportion)
  proportion$value <- row.names(proportion)
  row.names(proportion) <- NULL
  proportion <- proportion[, c(2,1)]
  return(proportion)
}
