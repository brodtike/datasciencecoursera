complete <- function(directory, id) {
    comp_files <- list.files(directory, full.names = TRUE)
    dat <- data.frame()    
    for (i in id) {
        file_read <- read.csv(comp_files[i])
        count <- sum(complete.cases(file_read))
        stat <- c(i, count)
        dat <- rbind(dat, stat)        
    }
    names(dat)<- c("id", "nobs")
    dat
}