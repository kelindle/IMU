#Function to fix the whack -180 to 180 range that Notch Outputs
fixNegatives <- function(signal) {
  
  for (i in 2:(length(signal))){
    if ((signal[i-1] - signal[i]) > 300) {
      signal[i] <- signal[i] + 360
      print('yee')
    }
    if ((signal[i-1] - signal[i]) < -300) {
      signal[i] <- signal[i] - 360
      print('eek')
    }
  }
  return(signal)
}
