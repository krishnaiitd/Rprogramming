### Getting data off webpages- readLines() ###
#con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
#htmlCode = readLines(con)
#close(con)
#print(htmlCode)


library(XML)
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
html <- htmlTreeParse(url, useInternalNodes = T)
