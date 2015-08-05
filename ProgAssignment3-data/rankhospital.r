## rankhospital ##
rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

        ## Check that state and outcome are valid
        # Get the unique list of state and outcomes
        states <- unique(df$State)
        outcomeList <- list("heart attack", "heart failure", "pneumonia")
        
        ## check that state is valid or not
        if(!(state %in% states)){
          stop("invalid state")
        }
        ## check that outcome is valid or not 
        if(!(outcome %in% outcomeList)) {
                stop("invalid outcome")
        }
        
        
        # Exclude the other states data
        maindf <- subset(df, df$State ==  state)
        
        if(is.numeric(num) && num > nrow(maindf)) {
                return(NA);
        }
        
        outcomeColumn = c("Hospital.Name")
        
        if(outcome == "heart attack") {
                stringRow = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack";
                outcomeColumn = c(outcomeColumn, stringRow)
                numericRow = 11
        } else if(outcome == "heart failure")  {
                stringRow = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure";
                outcomeColumn = c(outcomeColumn, stringRow)
                numericRow = 17
        } else if (outcome == "pneumonia") {
                stringRow = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia";
                outcomeColumn = c(outcomeColumn, stringRow)
                numericRow  = 23
        } else {
                stop("invalid outcome")
        }
        
        maindf <- maindf[outcomeColumn]
        
        suppressWarnings(maindf[, c(stringRow)] <- sapply(maindf[, c(stringRow)], as.numeric))
        
        maindf <- subset(maindf, is.na(maindf[[stringRow]]) == FALSE)
        #print(maindf)
        
        if(num == "best") {
          oneHospital <- maindf[which.min(maindf[[stringRow]]), ]
          return(oneHospital$Hospital.Name)
        } else if(num == "worst") {
          oneHospital <- maindf[which.max(maindf[[stringRow]]), ]
          return(oneHospital$Hospital.Name)
        } else if(is.numeric(num)) {
          #print(class(maindf))
          #stop('hre')
          df <- maindf[order(maindf[[stringRow]], maindf$Hospital.Name),]
          return(as.character(df[num,]$Hospital.Name))
        } else {
          stop('invalid num')
        }
}