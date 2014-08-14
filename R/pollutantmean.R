pollutantmean <- function(directory, pollutant, id = 1:332) {
    for(i in seq_along(id))
    {     
        tempFile <- paste(directory, "/", sprintf("%03d", as.numeric(id[i])), ".csv", sep = "")
        if(i==1)
        {
            mydata<-read.csv(tempFile)
        }
        else
        {
            mydata <- rbind(mydata, read.csv(tempFile))
        }
    }
    if(pollutant=="sulfate")
    {
        temp<-mydata[complete.cases(mydata[,2]),]
        sulfatemean<-mean(temp[,2])
        sulfatemean
    }
    else  if(pollutant=="nitrate")
    {
        temp<-mydata[complete.cases(mydata[,3]),]   
        nitratemean<-mean(temp[,3])
        nitratemean
    }
}