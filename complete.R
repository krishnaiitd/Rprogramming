complete <- function(directory, ids = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        getCompletePath <- function(id1) {
                pathIDs <- c()
                if (id1 <= 9) {
                        pathIDs <- c(pathIDs, paste0('00', id1))
                } else if(id1 <= 99) {
                        pathIDs <- c(pathIDs, paste0('0', id1))
                } else {
                        pathIDs <- c(pathIDs, id1)
                }
                # PathIDs
                paths = paste0(directory, '/' , pathIDs)
                paths = paste(paths, ".csv", sep="")
                
                paths
        }
        id  <- c()
        nobs  <- c()
        for (id1 in ids) {
                dataPath <- getCompletePath(id1)
                rawData <- read.csv(dataPath)
                notNAData <- subset(rawData, rawData[['sulfate']] != 'NA' & rawData[['nitrate']] != 'NA')
                
                id <- c(id, id1)
                nrows <- nrow(notNAData)
                nobs <- c(nobs, nrows)
                
        }
        
        df <- data.frame(id, nobs)
        print(df)
}