complete <- function(dir,id=1:332){
  files<-list.files(path=dir,pattern='\\.csv',full.names=TRUE)
  i = 1
  nobs = c()
  for(f in id){
    df<-read.csv(files[f])
    nobs[[i]] <- nrow(na.omit(df))
    i=i+1
  }
  
  ## Number of complete observations
  ## i.e. all rows are non-NA values
  df_new <- data.frame(id=id,nobs=nobs)
  df_new
}