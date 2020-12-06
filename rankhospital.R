## Script for R Programming assignment 3, analysing hospital data.

## Returns hospital with given rank from ordered list of mortlity fo condition
rankhospital <- function(state, outcome, num = "best") {
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
        
        ## Return hospital name in that state with the given rank
        subDat <- dat[stateExist, c(2, colmn)]
        Good <- as.logical(lapply(subDat[, 2], function(x) x != "Not Available"))
        subDatFix <- subDat[Good,]
        ord <- order(as.numeric(subDatFix[, 2]), subDatFix[, 1], decreasing = FALSE)
        subDatFix <- subDatFix[ord, ]
        if(num == "best") {
                num <- 1
        } else if(num == "worst") {
                num <- length(ord)
        }
        name <- subDatFix[num, 1]
        name
}