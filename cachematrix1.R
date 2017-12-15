## Matrix inversion functions via caching. In an effort to save processing power/time
## the functions will take a matrix (Assumed to have an inverse) as an argument
## and find the inverse, unless the matrix's inverse has already been cached, in which
## case iti will just pull the inverse directly from the cache. 



## Makes the speical matrix

makeCacheMatrix <- function(x = matrix()) {

  inver <- NULL
  set <- function(thematrix) {
  x <<- thematrix
  inver <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inver <<- inverse
  getinverse <- function() inver
  list(set = set, 
             get = get, 
             setinverse=setinverse, 
             getinverse=getinverse)
    }


## computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse 
## has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  inver <- x$getinverse()
  if(!is.null(inver)) {
    message("getting cached data.")
    return(inver)
  }
  data <- x$get()
  inver <- solve(data)
  x$setinverse(inver)
  inver
}

##Testing 
x = rbind(c(1, -1/4), c(-1/4, 1))
m = makeCacheMatrix(x)
m$get()
cacheSolve(m)
