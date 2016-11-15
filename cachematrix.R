## This pair of functions "caches" the inverse of a matrix by
## storing it in a special object that carries the inverse around
## with the matrix.

## makeCacheMatrix: take a matrix x and create a special "matrix"
## which is really a list containing four functions:
##      set: set the value of the matrix
##      get: get the value of the matrix
##      setinverse: set the inverse of a matrix
##      getinverse: get the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(i) inv <<- i
  getinverse <- function() inv
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve: given a square matrix x that is invertible, return
## the inverse of that matrix. If the inverse is already there, we
## simply return the cached version; if not, we calculate and store
## the inverse (and return it).

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cached inverse")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
