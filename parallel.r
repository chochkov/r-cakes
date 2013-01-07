#!/usr/bin/Rscript

# example on basic parallelism in R and sinking IO streams

library(parallel)

log.file <- 'log_file.log'

sink(log.file, type='output')
sink(open(file(log.file)), type='message')

cluster <- makeCluster(8, type='FORK', outfile=log.file)

tryCatch (
  {
    a <- function(int)
    {
      s <- runif(1) * int

      # time-consuming processing
      Sys.sleep(s)
      s
    }
    print(parLapply(cluster, 1:10, a))
    # if needed run a shutdown-function on each node of the nodes
    # clusterEvalQ(cluster, runr.shutdown())
  }, finally=stopCluster(cluster)
)

sink()
sink(type='message')
