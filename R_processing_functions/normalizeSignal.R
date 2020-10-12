normalizeSignal <- function(desiredTime,signal) {
  
  nodes <- length(desiredTime)
  indexToInterp <- length(signal)
  
  interpTime <- seq(1, indexToInterp-1,  len=nodes)
  notchInterpTime <- seq(1,indexToInterp,1)
  normalizedSignal <- interp1(notchInterpTime, signal, interpTime)
  
  return(normalizedSignal)
  
}