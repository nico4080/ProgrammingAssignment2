## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#to run the function you will need to type makeCacheMatrix() with all the arguments of the matrix
#if you wish to proof the inverse of the matrix use the %*% operation to be able to multiply matrices
#inv will be the variable that holds the information of the inverse matrix, and like the example
#of the vector, we will use a setter and a getter.
#in the get, setsolve, getsolve functions we will be using global enviroment variables.

makeCacheMatrix <- function(x=matrix()) {
  inv <- NULL
  set <- function(y) {
    x <- y
    inv <- NULL
  }
  get <- function() x
  setsolve <- function(solve) inv <- solve
  getsolve <- function() inv
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
  
}

## Write a short comment describing this function
#as the vector example, I used the is.na function to tell wether the matrix was null or not 
#the function solve does the respective calculations to fetch the inverse matrix
cacheSolve <- function(x, ...) {
  inv<-x$getsolve()
  if(!is.na(x)){
    print("fetching cached inverse matrix")
    return(inv)
  }
  int_data<-x$get()
  inv<-solve(int_data)
  x$setsolve(inv)
  inv
  ## Return a matrix that is the inverse of 'x'
}
