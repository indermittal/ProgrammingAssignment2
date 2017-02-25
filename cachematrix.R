## Put comments here that give an overall description of what your
## functions do

## This function returns a list containing four functions
## set --> This sets the value of matrix that will be passed to inverse function
## get --> This function gets the current value of matrix passed to function
## getsolve --> This function retrieves the inverse of matrix from cache
## setsolve --> This function calculates inverse of matrix and cahche the results in variable m

 makeCacheMatrix <- function(x = matrix()) {
     m <- NULL
     set <- function(new_val) {
	     x <<- new_val
		 m <<- NULL
	 }
     get <- function() x
     getsolve <- function() m 
     setsolve <- function(new_val) m <- new_val
     list( set = set, get = get, getsolve = getsolve, setsolve = setsolve)
 }

## This function returns a matrix that is inverse of input matrix x
 
 cacheSolve <- function(x, ...) {
    m <- x$getsolve() ## Calling function defined in makecachematrix to get the value 
    if ( ! is.null(m) ) ## Checking if the inverse already cached
    {
        message("Getting cached value")
        return(m)
    }
    data <- x$get()  ## Coming here only in case value is not cached, assiging the matrix to be inveserted to variable data
    m <- solve(data,...)  ## Caling solve function to calculate the inverse of matrix
	x$setsolve(m)  ## Setting the value in cache
    m
 }