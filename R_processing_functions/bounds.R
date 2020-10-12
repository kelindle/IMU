

bounds <- function(signal, samplingRate) {
  startDone <- 0
  endDone <- 0
  syncStart <- 0
  syncEnd <- 0 
  for (i in 1:length(signal)){
    
    if (abs(signal[i] - signal[1]) > 22 && startDone == 0) {
    
      #Find peak of the first elbow curl in a tpose to use as starting point
      syncStart <- i+which(abs(signal[i:(i+samplingRate*2)]) == max(abs(signal[i:(i+samplingRate*2)])))[1]
      startDone <- 1
      i <- i + 2*samplingRate
      print(paste('Start set to', syncStart))
    } 
    
    if (abs(signal[i] - signal[1]) > 22 && startDone == 1 && i > length(signal)-samplingRate*4 && endDone == 0) {
      
      #Find peak of elbow curl in a tpose within the last 3 seconds of the record to use as ending point
      syncEnd <- i+which(abs(signal[i:length(signal)]) == max(abs(signal[i:length(signal)])))[1]
      print(paste('End set to', syncEnd))
      endDone <- 1
      i <- length(signal)
      
    }
    
    if(isempty(syncEnd) && i == length(signal)) {
      
      print('Never found end peak')
      
    }
    
  }
  
  result <- c(syncStart,syncEnd)
  return(result)
  
}

#Test Case 1

# x1 <- seq(-10,10,len = 400)
# y2 <- seq(0,0,len = 400)
# 
# x <- seq(1,1200,len = 1200)
# 
# y1 <- -x1^2+100
# 
# y <- append(append(y1,y2),y1)
# 
# plot(x,y)
# 
# bounds(y,100)

