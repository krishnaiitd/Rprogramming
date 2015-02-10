### downloading and reading xml file ###
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
dataXML <- xmlTreeParse(fileUrl,
                    useInternal=TRUE)
zipcode <- xpathSApply(dataXML,"//zipcode",xmlValue)

length(zipcode[zipcode == "21231"]);
