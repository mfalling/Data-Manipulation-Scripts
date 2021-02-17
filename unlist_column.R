# Unlist a column in a dataframe.
# Each list item gets inserted into its own row, retaining all other column values

unlist_column <- function(dataset, column){
  # Create an empty dataframe.
  df <- NULL
 
  # Iterate through each row in the dataframe.
  for (i in 1:nrow(dataset)){
    # Put each list item in its own row.
    for(j in 1:(length(dataset[[column]][[i]]))){
      row <- dataset[i, ]
      row[[colnum]] <- dataset[[column]][[i]][[j]]
     
      # Build the dataframe.
      df <- rbind(df, row)
    }
  }
  return(df)
}
