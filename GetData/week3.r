set.seed(13435)
x <- data.frame("var1"=sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
x <- x[sample(1:5),];
x$var2[c(1,3)] = NA
#subset 
print(x[, 1]); # first column
print(x[, "var1"]) # first column
print(x[1:2, "var2"]) # first two row and second column

##Subset using logicals ands and ors
x[(x$var1 <= 3 & x$var3 > 11), ]

x[(x$var1 <= 3 | x$var3 > 11), ]

