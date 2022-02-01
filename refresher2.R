
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


View(head(store[,c(1,17,2:16)])) # rearranging the columns as per requirement


#Filtering -------------

# Choosing rows where Location is Delhi
store[store$Location == "Delhi", ] # method 1
subset(store, store$Location == "Delhi") # method 2
dplyr::filter(store, store$Location == "Delhi")# method 3

# Choosing rows where Location is Delhi or Kolkata
store[store$Location == "Delhi" | store$Location == "Kolkata", ] # method 1
subset(store, store$Location == "Delhi" | store$Location == "Kolkata") # method 2
# However, for method 1 and 2, the respective rownames for store df are retained in the subset. E.g. 1,2,3(Del)...24,25,26(Kol)
# To fix this issue, one must assign the rownames(store_subset) to NULL 
dplyr::filter(store, store$Location == "Delhi" | store$Location == "Kolkata")# method 3
#dplyr by default assigns sequential row numbers

# Choosing rows where Location is Delhi or Kolkata and Columns - StoreCode, Location, StoreName
View(store[(store$Location == "Delhi" | store$Location == "Kolkata"), c("StoreCode","Location","StoreName")]) # method 1
subset(store, store$Location == "Delhi" | store$Location == "Kolkata", select = c("StoreCode","Location","StoreName")) # method 2
dplyr::filter(store, store$Location == "Delhi" | store$Location == "Kolkata")[,c("StoreCode","Location","StoreName")]


#Sorting -------------

#By default the order is ascending. 

store[order(store$OperatingCost),]

View(dplyr::arrange(store, store$Location, desc(store$OperatingCost)))


#Remove Duplicates --------------
score = read.csv("D:/AI/Practise/R/project_RStudio/data/session4/Datasets/score.csv", sep = ",", header = T, stringsAsFactors = T)

score[duplicated(score),]

dplyr::distinct(score, Student, .keep_all = TRUE) # unique values based on Student column



















