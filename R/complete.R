complete <- function(directory, id = 1:332) {
    nobsNum <- numeric(0)    
    for (cid in id) {
        fileStr <- paste(directory, "/", sprintf("%03d", as.numeric(cid)), ".csv", sep = "")    
        cDfr <- read.csv(fileStr)
        nobsNum <- c(nobsNum, nrow(na.omit(cDfr)))
    }    
    # --- Assert return value is a data frame with TWO (2) columns
    data.frame(id = id, nobs = nobsNum)
}