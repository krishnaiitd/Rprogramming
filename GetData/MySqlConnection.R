### install.packages("MySql")##
library(RMySQL)
localDb <- dbConnect(MySQL(), user="root", password="12345", host="127.0.0.1");
result <- dbGetQuery(localDb, "show databases;");
print(result)
dbDisconnect(localDb)