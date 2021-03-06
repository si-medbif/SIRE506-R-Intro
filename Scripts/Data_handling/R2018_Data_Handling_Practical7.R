library(rvest)
library(reshape2)

####For importing data from html source; Do not worry about this####
url <- 'https://en.wikipedia.org/wiki/List_of_countries_by_past_and_projected_GDP_(PPP)'
test <- read_html(url)
tbls <- html_nodes(test, "table") 
ttt <- html_table(tbls, fill = T)
tb <- ttt[[10]]
colnames(tb)[1] <- "country" #Change the name of the first column
for(i in 2:ncol(tb)){
  tb[,i] <- gsub(pattern = ",",replacement = "",x = tb[,i]) #Remove ',' from numbers
}
#####

#####Your tasks
#1) Melt table 'tb'
#2) Correct data type of each column
#3) Use 'aggregate()' to find mean PPP from 2000 to 2009 for each country