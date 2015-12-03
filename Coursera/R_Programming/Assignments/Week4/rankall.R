rankall <- function(outcome,num="best"){
  ## Read outcome data
  df <- read.csv('outcome-of-care-measures.csv',colClasses = 'character')
  
  ## rank dataframe by outcome, then by hospital name.
  ## remove rows with NA values
  if(outcome=='heart attack'){
    df <- df[order(as.numeric(df[,11]),df$Hospital.Name,na.last=NA),]
  }
  else if(outcome=='heart failure'){
    df <- df[order(as.numeric(df[,17]),df$Hospital.Name,na.last=NA),]
  }
  else if(outcome=='pneumonia'){
    df <- df[order(as.numeric(df[,23]),df$Hospital.Name,na.last=NA),]
  }
  else stop('invalid outcome')

  ## create vector factored by state
  if(num=='best'){
    num = 1
    hospital <- tapply(df$Hospital.Name, df$State, function(x) x[num])
  }
  else if(num=='worst'){
      hospital <- tapply(df$Hospital.Name, df$State, function(x) x[length(x)])
  }
  else hospital <- tapply(df$Hospital.Name, df$State, function(x) x[num])
  ## create dataframe with hospital name
  ## and state for rank=num and outcome=outcome
  data.frame(hospital,state=names(hospital))

}
