zero_dataframe <- function(df) {
  
  for (i in 3:ncol(df)) {
    
    df[,i] <- df[,i] - df[1,i]
    
  } 
  return(df)
}  
