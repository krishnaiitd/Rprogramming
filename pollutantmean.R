pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used

        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        pathIDs <- c()
        for (id1 in id) {
          if (id1 <= 9) {
              pathIDs <- c(pathIDs, paste0('00', id1))
          } else if(id1 <= 99) {
              pathIDs <- c(pathIDs, paste0('0', id1))
          } else {
              pathIDs <- c(pathIDs, id1)
          }
        }
        #pathIDs
        paths = paste0(directory, '/' , pathIDs)
        paths = paste(paths, ".csv", sep="")
        #paths

        data <- c()
        pp  <- pollutant
        #print(pp)
        for (path in paths) {
            rawData <- read.csv(path)
            ppData <- rawData[[pp]]
            data <- c(data, ppData)
            #print(data)
        }
        #print(data)
        meanData <- mean(data, na.rm = TRUE)
        round(meanData, digits = 3)
}

