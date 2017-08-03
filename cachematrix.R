## Put comments here that give an overall description of what your
## functions do

## This function creates inverse matrix and save in the memory for given input Matrix argument.
## It returns a list of wrapper functions to SET and GET of both input argument and inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        m <<- solve(x)
        set <- function(y) {
                x <<- y
                m <<- solve(x)
        }
        get <- function() x
        setInverse <- function(inverse) m <<- inverse
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
        
        
}


## This function returns the Inverse Matrix. If Inverse Matrix is already created, then it returns it from memory

cacheSolve <- function(x, ...) {
        
        my_args <- list(...)
        
        
        if ( length(my_args) == 0){ 
                message("getting cached data")
                return(x$getInverse()) }
        
        ## Return a matrix cache)
        if(!is.null(x$getInverse()) & identical(x$get(),my_args[[1]])) {
                message("getting cached data")
                return(x$getInverse())
        }
        x$set(as.matrix(my_args[[1]]))
        
        x$getInverse()
        
        
}
