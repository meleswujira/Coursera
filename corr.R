corr <- function(directory, threshold = 0) 
{
    corrsNum <- numeric(0)
    nobsDfr <- complete(directory)
    nobsDfr <- nobsDfr[nobsDfr$nobs > threshold, ]  
    for (cid in nobsDfr$id) 
    {
        fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(cid)), ".csv", sep = "")    
        monDfr <- read.csv(fileStr)
        corrsNum <- c(corrsNum, cor(monDfr$sulfate, monDfr$nitrate, use = "pairwise.complete.obs"))
    }    
    corrsNum
}