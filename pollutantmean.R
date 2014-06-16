pollutantmean <- function(directory, pollutant, id = 1:332) {
    data_files <- list.files(directory, full.names = TRUE)
    consolidated <- data.frame()
    for (i in id) {
        consolidated <- rbind(consolidated, read.csv(data_files[i]))
  }
  if (pollutant == "sulfate") {
        mean(consolidated$sulfate, na.rm = TRUE)
  } 
  else if (pollutant == "nitrate") {
        mean(consolidated$nitrate, na.rm = TRUE)        
  } 
  else {
    "error"
  }
}


        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)