## Overall description

# The Below R program (built in 2 functions modules) returns the inverse of a matrix. 
# Checks will be done if the Inverse of a Matrix is already computed and cached if so it returns it
# Else the Inverse of Matrix is computed and returned. Also result is cached for any future calls.



## The below function creates an object and stores the Matrix passed as argument and the inverse of Matrix
# The function has 4 sub functions and data objects (x,m) to store the matrix and its inverse in parent environment

makeCacheMatrix <- function(x = matrix()) {
    m<- NULL
    
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get <- function() x
    set_inv_matrix <- function(inverse) m <<- inverse
    get_inv_matrix <- function() m
    list(set = set, get = get,
         set_inv_matrix = set_inv_matrix,
         get_inv_matrix = get_inv_matrix)
}


## This function computes the inverse of a matrix but it first checks if it's already been cached
# and if so returns it else computes and caches it

cacheSolve <- function(x, ...) {
 
     ## Return a matrix that is the inverse of 'x'
  
      m <- x$get_inv_matrix()
      if(!is.null(m)) {
        message("getting cached data")
        return(m)
      }
      data <- x$get()
      m <- solve(data)
      x$set_inv_matrix(m)
      m
}