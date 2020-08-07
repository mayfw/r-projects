install.packages("readr")
install.packages("readxl")
library(readr)
library(readxl)

# csv file reading
file1 <- paste('/Users/maywong/Documents/bootcamp/datasets/csv', '/example.csv',sep="")
data0 <- read_csv(file1)
data1 <- read_csv2(file1)
print(data0)
print(data1)

# other example
file2 <- paste('/Users/maywong/Documents/bootcamp/datasets/csv', '/example.csv',sep="")
data2 <- read.table(file2, header=T, sep=",")
head(data2)
summary(data2)

# txt file reading
file3 <- paste('/Users/maywong/Documents/bootcamp/datasets/txt', '/fileTextRead.txt',sep="")
data3 <- read.delim(file3)
print(data3)

# choosing the file
data4 <- read.delim(file.choose(), encoding = 'utf-8')
print(data4)

# excel file reading
data5 <- read_xlsx(file.choose())
print(data5)

# internet file reading
ur1 <- "http://diretorios.ifb.edu.br/diretorios/908/arquivos/download/certificados.txt"
data6 <- read.delim(ur1)
print(data6)
head(data6)

# write content of the internet file in a local file
outfile <- "/Users/maywong/Documents/bootcamp/datasets/txt/internet.txt"
print(outfile)
write.table(data6, outfile, append = FALSE, sep = ',', row.names = FALSE, col.names = TRUE)
data7 <- read.delim(outfile)
head(data7)

# check if a file exists in the directory
nameFile <- 'internet.txt'
file.exists(nameFile)

nameFile <- '/Users/maywong/Documents/bootcamp/datasets/txt/internet.txt'
file.exists(nameFile)
