corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
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

        correlationVector <- numeric()
        for (id1 in 1:332) {
                dataPath <- getCompletePath(id1)
                rawData <- read.csv(dataPath)
                notNAData <- subset(rawData, rawData[['sulfate']] != 'NA' & rawData[['nitrate']] != 'NA')
                
                nrows <- nrow(notNAData)
                if (nrows <= threshold) {
                        next
                }
                
                correlationVector <- c(correlationVector, cor(notNAData[['nitrate']], notNAData[['sulfate']]))
                
        }
        cr <- round(correlationVector, digits = 5)
        cr
}