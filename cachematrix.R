## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
      im<-NULL
	set<-function(y){
		x<<- y
		im<<- NULL
	}
	get<-function() x
	setinv<-function(inv) im<<-inv
	getinv<-function() im
	list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
      im<-x$getinv()
	if(!is.null(im)){
		message("getting cached data")
		return(im)
	}
	data<-x$get()
	im<-solve(data,...)
	x$setinv(im)
	im      
}
