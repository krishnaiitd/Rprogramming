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