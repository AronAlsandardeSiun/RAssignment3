## Script for R Programming assignment 3, analysing hospital data.

## Function to rank all hospitals by state.
rankall <- function(outcome, num = "best") {
        
        dat <- read.csv("data/outcome-of-care-measures.csv")
        
        colmn <- integer()
        if(outcome == "heart attack") {
                colmn <- 11
        } else if(outcome == "heart failure") {
                colmn <- 17
        } else if(outcome == "pneumonia") {
                colmn <- 23
        } else {
                stop("invalid outcome")
        }
        
        states <- unique(dat[, 7])
        ords <- order(states)
        states <- states[ords]
        name <- character(length = length(states))
        for(i in 1:length(states)) {
                state <- states[i]
                stateExist <- as.logical(lapply(dat[, 7], function(x) x == state))
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
                name[i] <- subDatFix[num, 1]
        }
        
        output <- data.frame(name, states)
        colnames(output) <- c("hospital", "state")
        output
}