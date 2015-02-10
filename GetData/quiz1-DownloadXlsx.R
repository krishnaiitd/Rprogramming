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