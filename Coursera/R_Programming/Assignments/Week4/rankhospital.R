rankhospital <- function(state,outcome,num="best"){
  
  ## Read outcome data
  df <- read.csv('outcome-of-care-measures.csv',colClasses = 'character')
  ## Check that state and outcome are valid
  if(!state %in% df$State){
    stop('invalid state')
  }
  
  if(outcome=='heart attack'){
    df.subset <- subset(df,df$State==state,select=c(2,7,11))
  }
  else if(outcome=='heart failure'){
    df.subset <- subset(df,df$State==state,select=c(2,7,17))
  }
  else if(outcome=='pneumonia'){
    df.subset <- subset(df,df$State==state,select=c(2,7,23))
  }
  else stop('invalid outcome')
  
  ## Return hospital name in that state with the given rank 30-day 
  ## mortality rate
  df.subset[,3] <- as.numeric(df.subset[,3])
  df.subset <- na.omit(df.subset)
  df.subset <- df.subset[order(df.subset[,3],df.subset[,1]),]

  ## Check if rank is outside number of rankings
  #print(head(df.subset))
  if(is.numeric(num)){

      if(as.numeric(num)>nrow(df.subset)){
          return(NA)
      }

      else {
          df.subset[as.numeric(num),1]
      }
  }
  else if(num=='best'){
    df.subset[1,1]
  }
  else if(num=='worst'){
      df.subset[nrow(df.subset),1]
  }
  else {
      stop('invalid ranking')
  }
}
