best <- function(state, outcome) {
        ## Read outcome data
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## check that state and outcome are valid
        
        states <- unique(df['State'])
        stateList <- c()
        for(s in states) {
                stateList <- c(stateList, s)
        }
        outcomeList <- list("heart attack", "heart failure", "pneumonia")
        
        ## For testing purposes.
        #print(state)
        #print('prepared list')
        #print(stateList)
        
        ## check that state is valid or not
        if(!(state %in% stateList)){
                stop("invalid state")
        }
        ## check that outcome is valid or not 
        if(!(outcome %in% outcomeList)) {
                stop("invalid outcome")
        }
        ## Lets start working
        
        # find the outcome row
        outcomeColumn = c("Hospital.Name")
        
        if(outcome == "heart attack") {
          outcomeColumn = c(outcomeColumn, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")
          numericRow = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack";
          #outcomeColumn = 11
        } else if(outcome == "heart failure")  {
          outcomeColumn = c(outcomeColumn, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")
          numericRow = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure";
          #outcomeColumn = 17
        } else if (outcome == "pneumonia") {
          #outcomeColumn  = 23
          numericRow = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia";
          outcomeColumn = c(outcomeColumn, "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
        }
        
        outcomeData <- subset(df[outcomeColumn], df['State'] ==  state)
        #print(outcomeData[1:10,])
        #class(outcomeData)
        
        outComeRow <- outcomeData[which(outcomeData[[numericRow]] == min(outcomeData[[numericRow]], na.rm = TRUE)), ]
        hospitalNames <- outComeRow[order(outComeRow[["Hospital.Name"]]), ];
        
        print(order(hospitalNames))
        # sort and print the first one 

        
        
        
}