## Assignment 2 i.e Quiz 2 of R class##
## Quiz 1##
cube <- function(x, n) {
        x^3
}
cube(3)

# Since no use of n in the function enviroments, so it is evaluated i.e function 
# does not depends on n, so there is no error at all.

## Quiz 2 ##

x<- 1:10
if(x >5) {
        x <- 0
}

# since the value of x is vector and it could evaluate for first value only
# Warning message:
#        In if (x > 5) { :
#                                the condition has length > 1 and only the first element will be used



#### Question 3 ####
f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}

z <- 10
f(3) # will call function g <- function(y) {y +z} in the function enviroment, 
# z <- 4; 3 + g(3), now function g called in function enviroment i.e 3 + 4 = 7
# so, g (3) will return 7  and hence 3 + 7  = 10


#### Question 4 ####

x <- 5
y <- if (x < 3) {
        NA
} else {
        10
}


### Programming Assignement 2###


makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, 
             get = get,
             setmean = setmean,
             getmean = getmean)
}

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}

makeCacheMatrix <- function(x = matrix()) {
        ## Initialise the matrix.
        inverseMatrix <- NULL
        # set the given matrix
        set <- function(matrix) {
                m <<- matrix
                inverseMatrix <<- NULL
        }
        
        # Get the given matrix
        get <- function()  {
                m
        }
        
        # find and set the inverse of the matrix
        setInverse <- function(solve) {
                inverseMatrix <<- solve
        }
        
        # Get the inverted matrix
        getInverse <- function() {
                inverseMatrix
        }
        
        # Return the list
        list(set = set,
             get = get,
             setInverse = setInverse,
             getInverse = getInverse
        )
}

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverseMatrix <- x$getInverse()
        if(!is.null(inverseMatrix)) {
                message("getting cached inverse matrix")
                return(inverseMatrix)
        }
        
        originalMatrix <- x$get()
        inverseMatrix <- solve(originalMatrix, ...)
        x$setInverse(inverseMatrix)
        inverseMatrix
}






}
