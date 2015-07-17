library(datasets)
library(lattice)
## Convert 'Month' to a factor variable
airquality <- transform(airquality, Month = factor(Month)) 
plotView <- xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))
#print(plotView);

### Lattice Panel Functions ###
set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f*x + rnorm(100, sd = 0.5)
# divided in two group
f <- factor(f, labels = c("Group 1", "Group 2"))
plotView2 <- xyplot(y ~x | f, layout = c(2, 1)) ## plot with 2 panels
#print(plotView2)

## Let's make a custom panel functions
plotView3 <- xyplot(y ~ x | f, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...) ## This is default panel for 'xyplot'
  panel.abline(h = median(y), lty = 2) ## Add a horizontal line at the median
  panel.abline(h = mean(y), lty = 3) ## Add a horixontal line at the mean
  panel.abline(v = median(x), lty = 2)
  panel.abline(v = mean(x), lty = 3)
  ## Add a Regression line
  panel.lmline(x, y, col = 2) ## Overaly a siple linear regression line
})
print(plotView3)

