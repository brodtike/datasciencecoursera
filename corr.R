corr <- function(directory, threshold = 0) {
    data_files <- list.files(directory, full.names = TRUE)
    no_of_files <- length(data_files)
    nobs_data <- complete( directory, 1:no_of_files)
    passed <- subset(nobs_data, nobs_data$nobs > threshold)
    passed_id <- passed$id
    cor_results <- c()
    for (i in passed_id) {
        for_compute <- read.csv(data_files[i])
        for_compute <- na.omit(for_compute)
        cor_comp <- cor(for_compute$sulfate, for_compute$nitrate)
        cor_results <- append(cor_results, cor_comp)        
    }
    cor_results
} 