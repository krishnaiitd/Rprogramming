fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv";

if(!file.exists("./data/Housing2006Data-Idaho.csv")) {
        download.file(fileUrl,
                      destfile = "./data/Housing2006Data-Idaho.csv",
                      method = "curl");
}

list.files("./data")
df <- read.table("./data/Housing2006Data-Idaho.csv",
                 sep =",",
                 header = TRUE );
head(df)
