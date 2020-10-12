dataframe_means <- function(time_df, df1, df2) {
  
  mean_df <- time_df
  
  for (i in 3:ncol(df1)) {
    
    current_mean <- {}
    
    for (j in 1:nrow(df1)) {
      
      row_average <- mean(df1[j,i], df2[j,i])
      current_mean <- c(current_mean, row_average)
      
    }
    
    current_mean_df <- data.frame(current_mean)
    colnames(current_mean_df) <- colnames(df1[i])
    mean_df <- cbind(mean_df, current_mean_df)
  }
  
  return(mean_df)
  
}