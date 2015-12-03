makeVector <- function(x=numeric()){
  m<-NULL
  set<-function(y){
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  
  setmean <- function(mean) m<<-mean
  getmean <-function() m
  
  list(set=set,get=get,setmean=setmean,getmean=getmean)
}

cachemean <- function(x, ...) {
  m<-x$getmean()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-mean(data, ...)
  x$setmean(m)
  m
}

## To use, run something like
## > Y <- makeVector()
## > Y$set(1:50)
## > Y$get()
## > cachemean(Y)
## > Y$getmean()