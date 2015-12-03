corr <- function(directory,threshold=0){

  ## initialize numeric vector of length 1 and value=0
  vcor <- vector("numeric")
  df_nobs <- complete(directory)
  ## return subset with nobs>threshold
  df_nobs_subset <- subset(df_nobs,df_nobs$nobs>threshold)

  ## counter
  i=1
  ## iterate over ids with nobs>threshold
  for(id in df_nobs_subset$id){
    df<-read.csv(files[id])
    df <- na.omit(df)
    vcor[i] <- cor(df$sulfate,df$nitrate)
    i=i+1
  }
  ## return numeric vector of correlations
  vcor
}