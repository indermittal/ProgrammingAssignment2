## Put comments here that give an overall description of what your
## functions do

## This function returns a list containing four functions
## set --> This sets the value of matrix that will be passed to inverse function
## get --> This function gets the current value of matrix passed to function
## getsolve --> This function retrieves the inverse of matrix from cache
## setsolve --> This function calculates inverse of matrix and cahche the results in variable m

makeCacheMatrix <- function(x = numeric()) {
  m <- NULL
  set <- function(new_val) x <- new_val
  get <- function() x
  getsolve <- function() m 
  setsolve <- function(new_val) m <<- solve(new_val)
  list( set = set, get = get, getsolve = getsolve, setsolve = setsolve)
}


## This function returns a matrix that is inverse of input matrix x

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getsolve()
  if ( ! is.null(m) )
  {
    message("Getting cached value")
    return(m)
  }
  data <- x$get()
  m <- x$setsolve(data,...)
  m
}



