pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  # file='/Users/ashivaru/Downloads/Trash-this/specdata/200.csv'
  x<-read.csv(file=directory)
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  if(pollutant == 'sulfate') {
    pol <- subset(x$sulfate,!is.na(x$sulfate))
  }
  else {
    pol <- x$nitrate[id]    
  }
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  mean(pol, na.rm=TRUE)
}

pollutantmean('/Users/ashivaru/Downloads/Trash-this/specdata/200.csv',pollutant='sulfate')
