## complete.R
## steveT 07-30-2016

complete <- function(directory, id = 1:332) {
  
  polldata <- vector()
  
  for( i in 1:length(id)) {
    selected_files <- c(paste(directory, "/",formatC(id[i], width=3, flag=0),".csv",sep=""))
    rdata <- c(read.csv(selected_files))
    polldata[i] <- sum(complete.cases(rdata))
  } 
  dat <- data.frame(cbind(id,nobs=polldata))   
  return(dat)
}