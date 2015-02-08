## rankhospital ##
rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

        ## Check that state and outcome are valid
        states <- unique(df['State'])
        stateList <- c()
        for(s in states) {
                stateList <- c(stateList, s)
        }
        ## check that state is valid or not
        if(!(state %in% stateList)){
                stop("invalid state")
        }

        outcomeList <- list("heart attack", "heart failure", "pneumonia")        
        ## check that outcome is valid or not 
        if(!(outcome %in% outcomeList)) {
                stop("invalid outcome")
        }
        # Exclude the other states data
        maindf <- subset(df, df['State'] ==  state)
        numberOfHospital = nrow(maindf)
        ## check the num varibale validity
        if(num == 'best') {
              num <- 1;  
        } 
        
        if(num == "worst") {
                num <- numberOfHospital     
        }
        
        if(num > numberOfHospital) {
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
        }
        
        maindf <- maindf[outcomeColumn]
        #print(maindf)
        #rr[with(rr, order(Rate, Hospital.Name, decreasing = TRUE)), ]
        #print(stringRow)
        #sorteddf <- maindf[with(maindf, order(stringRow)), ]
        #tt <- order(maindf[, stringRow])
        #print(tt)fi
        sorteddf <- maindf[order(maindf[, stringRow], rev(order(maindf[, "Hospital.Name"]))), "Hospital.Name"]
        #print(maindf)
        print(sorteddf[c(num)])
       
        
        ## Lets start working
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
}