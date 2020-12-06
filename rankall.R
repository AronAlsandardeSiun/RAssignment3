## Script for R Programming assignment 3, analysing hospital data.

## Function to rank all hospitals by state.
rankall <- function(outcome, num = "best") {
        library(dplyr)
        
        ## Read outcome data.
        dat <- read.csv("data/outcome-of-care-measures.csv")
  
        ## Check if state and outcome are valid inputs.
        #stateExist <- as.logical(lapply(dat[, 7], function(x) x == state))
        #stExCheck <- sum(as.numeric(stateExist))
        #if(stExCheck >= 1) {
        #} else {
        #        stop("invalid state")
        #}
  
        colmn <- integer()
        if(outcome == "Heart Attack") {
                colmn <- 11
        } else if(outcome == "heart Failure") {
                colmn <- 17
        } else if(outcome == "Pneumonia") {
                colmn <- 23
        } else {
                stop("invalid outcome")
        }
        
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        
        
}