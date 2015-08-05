best <- function(state, outcome) {
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## check that state and outcome are valid
  
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
  
  # TODO Removed later stop('state and outcome passed')
  ## Lets start working
  
  # find the outcome row
  outcomeColumn = c("Hospital.Name")
  
  if(outcome == "heart attack") {
    #outcomeColumn = 11
    outcomeColumn = c(outcomeColumn, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack")
    numericRow = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack";
  } else if(outcome == "heart failure")  {
    #outcomeColumn = 17
    outcomeColumn = c(outcomeColumn, "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure")
    numericRow = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure";
  } else if (outcome == "pneumonia") {
    #outcomeColumn  = 23
    outcomeColumn = c(outcomeColumn, "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
    numericRow = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia";
  }
  
  outcomeData <- subset(df[outcomeColumn], df['State'] ==  state)
  #print(outcomeData[1:10,])
  #class(outcomeData)
  suppressWarnings(outcomeData[, c(numericRow)] <- sapply(outcomeData[, c(numericRow)], as.numeric))
  
  outComeRow <- outcomeData[which(outcomeData[[numericRow]] == min(outcomeData[[numericRow]], na.rm = TRUE)), ]
  hospitalNames <- outComeRow[order(outComeRow[["Hospital.Name"]]), ];
  
  print(hospitalNames[["Hospital.Name"]][1])
  #print(order(hospitalNames))
  #print(hospitalNames)
}