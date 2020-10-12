normalize_dataframe <- function(length,dataframe) {
  
  dataframe_tobe <- matrix(0, ncol = ncol(dataframe), nrow = length)
  dataframe_tobe <- data.frame(dataframe_tobe)
  
  for (i in 1:ncol(dataframe)) {
    dataframe_tobe[1:length,i] <- normalizeSignal(as.numeric(1:length), dataframe[1:nrow(dataframe),i])
  }

  colnames(dataframe_tobe) <- colnames(dataframe)
  
  return(dataframe_tobe)
}
