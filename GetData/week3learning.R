set.seed(13435)
X <- X[sample(1:5), ]
X$var2[c(1,3)] <- NA
X <- data.frame("var1"= sample(1:5), "var2"=sample(6:10), "var3"=sample(11:15))
print(X)

## Subsetting
print(X[, 1])
print(X[, "var1"])
print(X[1:2, "var2"])
# Subsetting: logicals 'and' and 'or'
print(X[(X$var1 <= 3 & X$var3 > 11), ])
# this is exclude missing value
print(X[which(X$var2 > 8), ])

# Order
print(X[order(X$var1, X$var3), ])
print(X[order(X$var2), ])
print(X[order(-X$var2), ])

# Ordering with plyr
library(plyr)
print(arrange(X, var1))

#### Summarizing Data #####
if(!file.exists("./data")) {dir.create("./data")}
if(!file.exists("./data/restaurants.csv")) {
  fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
  download.file(fileUrl, destfile = "./data/restaurants.csv", method = "curl")
}
restData <- read.csv("./data/restaurants.csv")
head(restData)
head(restData, n = 3)
tail(restData, n = 3)
str(restData)
quantile(restData$councilDistrict)
table(restData$zipCode, useNA = "ifany")
subset(restData, zipCode == -21226)
table(restData$zipCode)
table(restData$councilDistrict, restData$zipCode)
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)
colSums(is.na(restData))

# Values with specific characteristics ###
table(restData$zipCode %in% c(21212))
table(restData$zipCode %in% c("21212", "21213"))
restData[restData$zipCode %in% c("21212", "21213"), ]
t <- restData[restData$zipCode %in% c("21212", "21213"), ]
nrow(t)



#### Cross Tabs ####
data("UCBAdmissions")
DF <- as.data.frame(UCBAdmissions)
summary(DF)
# Very nice reporting purposes:
xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt <- xtabs(Freq ~ Admit + Dept, data = DF)
xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt <- xtabs(Freq ~ Gender + Dept, data = DF)


### Flat Tables ####
warpbreaks$replicate <- rep(1:9, len=54)
xt <- xtabs(breaks ~ ., data = warpbreaks)
print(xt)

ftable(xt)


#### Size of data set ####
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData), units = "Mb")
print(object.size(fakeData), units = "Gb")
