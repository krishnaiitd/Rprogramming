add2 <- function(x, y) {
  x + y
}  

above10 <- function(x) {
  use <- x > 10
  x[use] # Return the sub set of x which is greater than 10
}

columnmean <- function(y, removedNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removedNA)
  }
  means
}

make.power <- function(n) {
        pow <- function(x) {
                x^n
        }
        pow
}
cube <- make.power(3)
square <- make.power(2)

ls(enviroment(cube))
        
get("n", environment(cube))

########## Dynamic scoping #####
y <- 10

f <- function(x) {
        y <- 2
        y^2 + g(x)
}

g <- function(x) {
        x*y
}

## what is the value of 

f(3) ## it should be 2^2 + g(3) = 2^10 (g is function and it will take global variable value of y) + (3*2) = 4+6 = 10 y local value

############# End of Dynamic scoping#######

#### Vectorized Operations#### 
x<-1:5
y<-1:10
x+y



x <- matrix(1:4, 2, 2);
y <- matrix(rep(10, 4), 2, 2)
x*y ## element-wise multiplication
x/y ## element-wise /

x %*% y ## true matrix multiplication


















