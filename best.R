## Script for R Programming assignment 3, analysing hospital data.

## Finds the hospital with the lowest incidence of a given outcome in a state.
best <- function(state, outcome) {
        ## Read outcome data.
        dat <- read.csv("data/outcome-of-care-measures.csv")
        
        ## Check if state and outcome are valid inputs.
        stateExist <- sum(as.numeric(lapply(dat[, 7], function(x) x == state)))
        if(stateExist >= 1) {
        } else {
                stop("invalid state")
        }
        
        col <- integer()
        if(outcome == "Heart Attack") {
                col <<- 11
        } else if(outcome == "heart Failure") {
                col <<- 17
        } else if(outcome == "Pneumonia") {
                col <<- 23
        } else {
                stop("invalid outcome")
        }
        
        ## Return hospital with lowest 30 day D.R.
        
}