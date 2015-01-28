best <- function(state, outcome) {
        ## Read outcome data
        df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## check that state and outcome are valid
        
        stateList <- list(unique(df['State']))
        outcomeList <- list("heart attack", "heart failure", "pneumonia")
        print(state)
        
        if(state %in% stateList){
                stop("invalid state")
        } 
        if(outcome %in% outcomeList) {
                stop("invalid outcome")
        }
        
        print('lets start ccalculation')
        
        
}