#Below are two functions are used to cache the inverse of a matrix.
# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result. 
# If not, it computes the inverse.

cacheSolve <- function(x,...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cache data.")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data,...)
        x$setinverse(inv)
        inv
} 

## here we will try with out matrix (1,2,2,1)
## > x = rbind(c(1, 2), c(2, 1))
## > m = makeCacheMatrix(x)
## > m$get()
     [,1] [,2]
[1,]    1    2
[2,]    2    1
## >  cacheSolve(m)
           [,1]       [,2]
[1,] -0.3333333  0.6666667
[2,]  0.6666667 -0.3333333
 
