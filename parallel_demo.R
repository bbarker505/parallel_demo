library(doParallel)
library(foreach)

# Register DoParallel
# This function creates a parallel socket cluster, which creates a set of 
# copies of R running in parallel and communicating over sockets. The value
# may be specified manually; however, here the value is estimated based on the
# number of available cores on the computer or server DDRP is being run on. 
# Specifying too many clusters will overload the computer.

# How much can your computer/server handle?
detectCores()

# For a Windows OS, t
if (grepl("Windows", Sys.info()[1])) {
  cl <<- makePSOCKcluster(ncores)
} else {
  cl <<- makeCluster(ncores)
}


stopCluster(cl) # Shut down the cluster


library(parallel)