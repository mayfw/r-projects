# import RMariaDB
install.packages("RMariaDB")
library(RMariaDB)

# connect to MYSQL
con <- dbConnect(MariaDB(), user = "root", password = "admin123", 
                 dbname = "igti", host = "localhost", serverTimezone = "UTC")

# check tables under determined schema
tables <- dbListTables(con)
print(tables)

# check data in a table
tableData <- dbReadTable(con, "genre")
print(tableData)

# execute a SQL command
query <- "INSERT INTO genre(description) VALUES('Drama');"
results <- dbSendQuery(con, query)
print(results)

# save data in xlsx to database
install.packages("xlsx")
library(xlsx)

datasetpath <- '/Users/maywong/Documents/bootcamp/datasets/excel'
filename <- paste(datasetpath, "/genre.xlsx", sep = '')
print(filename)

insertdata <- read.xlsx(filename, sheetIndex = 1, header = TRUE, encoding = "UTF-8")
print(insertdata)

dbWriteTable(con, "genre", insertdata, append = TRUE)

# check row was added to table
tableData <- dbReadTable(con, "genre")
print(tableData)

# another way to check table data
query <- "SELECT * FROM genre;"
result <- dbGetQuery(con, query)
print(result)

# save query results on a csv file
write.csv(result, '/Users/maywong/Documents/bootcamp/datasets/csv/result.csv', 
          row.names = FALSE, quote = FALSE)

# create a new table
query <- "CREATE TABLE movies (
            id int NOT NULL AUTO_INCREMENT,
            name varchar(250) NOT NULL,
            duration int NOT NULL,
            PRIMARY KEY (id));"

result <- dbSendQuery(con, query)
print(result)

tables <- dbListTables(con)
print(tables)

# disconnect from database
dbDisconnect(con)