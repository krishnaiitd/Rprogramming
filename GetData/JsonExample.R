## Quiz 2##
library(httr);
url = "https://api.github.com/users/jtleek/repos";
data = GET(url);
json1 = content(data);
json2 = jsonlite::fromJSON(toJSON(json1))
print(json2)


url = "http://biostat.jhsph.edu/~jleek/contact.html"

