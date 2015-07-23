data <- read.csv("./getdata-wksst8110.for", header = TRUE)
file_name <- "./getdata-wksst8110.for"
df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
print(sum(df[, 4]))
