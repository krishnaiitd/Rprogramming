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
        
        
}