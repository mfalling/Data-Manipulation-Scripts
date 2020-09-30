# Load in multiple CSVs, from the same folder.
# Store the CSV file name in the first column if the generated dataframe(s).
# merge = TRUE by default; It will create a single dataframe.
# If merge = FALSE, each CSV will generate its own dataframe.


load_csvs <- function(filepath, merge = TRUE){
  
  # Merge all the CSV files together.
  if (merge == TRUE) {
    dataframe <- list.files(
      path = filepath,
      pattern = "*.csv",
      full.names = TRUE
    ) %>%
      setNames(nm = .) %>% 
      map_df(~ read_csv(.), .id = "name")
    
    dataframe$name <- gsub("data/(.*).csv", 
                                "\\1", 
                                dataframe$name, 
                                fixed = FALSE)
    return(dataframe)
  }
  
  # Keep the CSV files separate.
  if (merge == FALSE) {
    # Get a list of all the files.
    files <- list.files(path = filepath,
                        pattern=".csv$")
    
    # Get the file names
    fileNames <- gsub('.csv', '', files)
    
    # Iterates through the files and output unique dataframes.
    for (i in 1:length(files)){
      # Grab a CSV file from the directory.
      aDataframe <- read_csv(paste0(filepath,
                                    files[i]))
      # Capture the CSV file name
      dfName <- fileNames[i]
      # Output the CSV file into the global environment.
      assign(dfName,
             value = aDataframe,
             envir = parent.frame())
    }
  }
}
