## Create matrix of 5 X 10

m <- matrix(1:50, 5, 10)
dim(m)
nrow(m)
ncol(m)
class(m)
names(m) ## no header of this matrix

# Let's assigned name of each row
name <- c("A", "B", "C", "D", "E")

nm <- cbind(cc, m)

nm <- as.data.frame(nm)

names(nm) # gives the header of nm

names(nm) <- c("Names", "V2",  "V3",  "V4",  "V5",  "V6" , "V7",  "V8",  "V9",  "V10", "V11")

## Lets get the subset of mn
a <- nm[, 2:10]

# Let's find the mean of list
a <- list(a = 1:10, b=30:60)
lapply(a, mean)
sapply(a, mean)
