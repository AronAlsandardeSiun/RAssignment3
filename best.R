## Script for R Programming assignment 3, analysing hospital data.

## Finds the hospital with the lowest incidence of a given outcome in a state.
best <- function(state, outcome) {
        ## Read outcome data.
        dat <- read.csv("data/outcome-of-care-measures.csv")
        
        ## Check if state and outcome are valid inputs.
        stateExist <- as.logical(lapply(dat[, 7], function(x) x == state))
        stExCheck <- sum(as.numeric(stateExist))
        if(stExCheck >= 1) {
        } else {
                stop("invalid state")
        }
        
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
        
        ## Return hospital with lowest 30 day D.R.
        subDat <- dat[stateExist, c(2, colmn)]
        Good <- as.logical(lapply(subDat[, 2], function(x) x != "Not Available"))
        subDatFix <- subDat[Good,]
        mortRats <- as.numeric(subDatFix[, 2])
        curmin <- 100
        x <- 1
        for(i in 1:length(mortRats)) {
                if (curmin > mortRats[i]) {
                        curmin <- mortRats[i]
                        x <- i
                }
        }
        name <- subDatFix[x, 1]
        name
}