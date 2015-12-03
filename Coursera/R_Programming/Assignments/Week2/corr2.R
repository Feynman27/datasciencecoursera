corr <- function(directory,threshold=0){
  ## list of files in directory
  files<-list.files(path=directory,pattern='\\.csv',full.names=TRUE)
  ## initialize numeric vector of length 1 and value=0
  vcor <- vector("numeric",length=1)
  ## counter
  i=1
  for(f in files){
    df<-read.csv(files[f])
    df <- na.omit(df)
    nobs <- nrow(df)
    if(nobs>threshold){
      vcor[i] <- cor(df$sulfate,df$nitrate)
      i=i+1
    }
  }
  
  vcor
}