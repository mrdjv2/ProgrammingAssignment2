## These functions are ment to
## 1.) invert a given matrix, store the inverse in the cache and
## 2.) take the inverse from the cache if needed again
## functions do

## makeCacheMatrix stores the inverse of a given matrix in the cache

makeCacheMatrix <- function(x = matrix()){

  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve 
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
  
  
}



## cacheSolve gets the inverse of a given matrix from the cache if available or calcuates it if neccessary

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  m
}
