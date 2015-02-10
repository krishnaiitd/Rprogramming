## Quiz ##

# Download a file from American Community Survey distributes downloadable data about United States communities
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv ";
if(!file.exists("data")) {
        dir.create("data");
}
if(!file.exists("./data/Housing2006Data.csv")) {
        download.file(fileUrl,
                      destfile = "./data/Housing2006Data.csv",
                      method = "curl");
}

list.files("./data")
df <- read.table("./data/Housing2006Data.csv",
                 sep =",",
                 header = TRUE );
head(df)


### Read the xlsx file###
xlsxFileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx ";
fileName = "./data/NGAP.xlsx";
if(!file.exists(fileName)) {
        download.file(xlsxFileUrl,
                      destfile=fileName,
                      method = "curl");
}
dateDownloaded <- date()
list.files()
library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx(fileName,
                      sheetIndex = 1,
                      colIndex=colIndex,
                      rowIndex=rowIndex,
                      header=TRUE)








                