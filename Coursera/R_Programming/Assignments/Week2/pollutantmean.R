pollutantmean <- function(dir,pollutant,id=1:332){
  files<-list.files(path=dir,pattern='\\.csv',full.names=TRUE)
  file_names <-files[id] 
  df<-do.call(rbind,lapply(file_names,read.csv))
  my_mean <- mean(df[[pollutant]],na.rm=TRUE)
  my_mean
}
