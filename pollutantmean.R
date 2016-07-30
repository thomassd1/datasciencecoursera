## pollutantmean.R
## steveT 07-30-2016

pollutantmean <- function(directory, pollutant, id = 1:332) {

  # obtain list of sensor files in specdata directory
  currentdir <- getwd()
  setwd(directory)
  lfiles <- list.files( pattern = "*.csv")
  
  # create empty data frame
  polldata <- data.frame()
  
  # subset list of sensor files
  sublfiles <- lfiles[id]
  
  # loop through files in subset list and
  #    * read the csv file
  #    * bind to "collector" data frame
  for( i in sequence(length(sublfiles))) {
    rdata <- read.csv(sublfiles[i])
    combpolldata <- rbind(polldata, rdata)
    }
  
  mean(combpolldata[, pollutant], na.rm = TRUE)
  
  setwd(currentdir) 

  }