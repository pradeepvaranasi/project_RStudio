
library(dplyr)
library(readxl)
library(XML)
library(Hmisc)

#Loading data --------

df1 = read.csv("D:/AI/Practise/R/project_RStudio/data/session4/Datasets/stores.csv", sep = ",", header = T)
df2 = read_excel("D:/AI/Practise/R/project_RStudio/data/session4/Datasets/CarData.xlsx")
df3 = read_excel("D:/AI/Practise/R/project_RStudio/data/session4/Datasets/CarData.xlsx", sheet = 3)
df4 = XML::xmlToDataFrame("D:/AI/Practise/R/project_RStudio/data/session4/Datasets/menu.xml")
store = read.csv("D:/AI/Practise/R/project_RStudio/data/session4/Datasets/stores_special_file.csv", sep = ",", header = T, stringsAsFactors = T)

source("filepath/filename.ext") # source command is helpful in executing other .R codes in existing files.  

#Basic EDA --------

colnames(df1)
rownames(df1)
str(df1$StoreCode)
summary(df5)

Hmisc::describe(df1) # Much more helpful than summary
Hmisc::describe(df5)

summary(store)
colnames(store)
str(store)
View(store)

Hmisc::describe(store)  

#Renaming ---------

names(store) # Changing Basket__Size to Basket_Size
names(store)[names(store) == "Basket__Size"] = "Basket_Size" 
names(store)
# Advantage - Very fast
# Disadvantage - Can only perform one column at a time.

View(head(dplyr::rename(store, "City"="Location", "Staff_Count"="Staff_Cnt"))) # can rename multiple columns

#Appending & Removing---------

store$TaxRateA = 0.05
store$Profit = store$TotalSales - store$OperatingCost
head(store)
# Advantage - Very fast
# Disadvantage - Can only perform one column at a time.

View(head(dplyr::mutate(store, 
                        ProfitD = store$TotalSales-store$OperatingCost,
                        TaxPaid = TaxRateA * store$TotalSales))) # can create multiple columns

View(head(dplyr::mutate(store, ProfitD = NULL, TaxPaid = NULL))) # can remove multiple columns


View(head(store[,c(1,17,2:16)])) # rearraning the columns as per requirement










