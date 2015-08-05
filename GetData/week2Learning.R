##### Connect with MySQL #####
#ucscDb <- dbConnect(MySQL(), user="genome", host="genomre-mysql.cse.ucsc.edu")
# Connect to local host
db <- dbConnect(MySQL(), user="root", host="127.0.0.1", port=33060)
result <- dbGetQuery(db, "show databases")

backend <- dbConnect(MySQL(), user='root', host='127.0.0.1',db="backend", port=33060)
backendTables <- dbListTables(backend);
#print(length(backendTables))
dbListFields(backend, 'settings')

metrics <- dbConnect(MySQL(), user="root", host='127.0.0.1', port=33060)

# Disconnect the db
dbDisconnect(db)
dbDisconnect(backend)
dbDisconnect(metrics)

###### HDF5 #####
source("http://bioconductor.org/biocLite.R")


