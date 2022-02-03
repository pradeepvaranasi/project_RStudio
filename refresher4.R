library(dplyr)
library(readxl)
library(XML)
library(Hmisc)
library(caret)
library(fastDummies)
library(reshape2)

# If-Else -----------------

x = 1

if (x > 0) {
  print("Positive")
} else {
  print("Negative")
  }

x = -1

if(x>0){
  print("Positive")
} else if (x<0){
  print("Negative")
} else {
  print("Zero")
}

v1 = c(1, -1, 0, 2, 3, -4)


if (v1>0){
  print("positive")
} else {
  print("negative")
} # error/warning: the condition has length > 1 and only the first element will be used
  # a way to achieve this can be by implementing loops


# if is a not vectorized function, hence ifelse function must be used 

ifelse(v1>0, "Pos", 
       ifelse(v1<0, "Neg", "Zero"))

# Loops -----------------

for (i in 1:10) {
  print(i)
}

# conditional loops

v2 = for (i in 1:length(v1)){
  if (v1[i]>0){
    print("positive")
  } else if (v1[i]<0){
    print("negative")
  } else {
    print("zero")
  }
}


# Functions -----------------

# Set of code/instructions that allows user to perform repetitive tasks. 

pow = function(x){
  res = x^2
  print(res)
}

pow(3)


# Apply -----------------

# They are better vectorized 

apply(X=m2, MARGIN = c(1,2), FUN = square)

# X - input data 
# FUN - function name
# MARGIN - apply the function to both rows(1) and columns(2)

# lapply/sapply are other variants 


# Connecting dots -----------------


df = read.csv("D:/AI/Practise/R/project_RStudio/data/session6/Datasets/stores.csv", header = T, stringsAsFactors = T)
class(df)
str(df)

# step1: Find the data type of all the columns. o/p will be a vector with datatypes
dt = sapply(X=df, FUN = class) # can also be done using function: is.numeric() etc.
View(dt)


# step2: Extract only the values that are numeric or integer
dt[dt == "numeric" | dt == "integer"]

# step3: Extract index names
dtn = names(dt[dt == "numeric" | dt == "integer"])
dtc = names(dt[dt == "factor" | dt == "character"])

# step4: Separate numeric and char data
numcol = df[,dtn]
charcol = df[,dtc]
















