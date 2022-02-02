library(dplyr)
library(readxl)
library(XML)
library(Hmisc)

# Pipelining ------------ 
# %>% operator is used 
# Provide info of Delhi city and operating cost in asc

store %>% dplyr::filter(store$Location=="Delhi")  %>% dplyr::arrange(desc(OperatingCost)) #OR 
store %>% dplyr::filter(store$Location=="Delhi")  %>% arrange(OperatingCost)


# Aggregation ------------ 
# For every Location, StoreType, provide the count, total sales
  
View(store %>% dplyr::group_by(Location, StoreType)
     %>% summarise(count = n(), totSales = sum(TotalSales)) 
     %>% arrange(Location, totSales))

# Binning and Encoding ------------

# ID variable - High cardinality(high unique values); has no statistical importance
# Numerical features -  They have statistical importance
#                       They can be continuous(can have decimals, e.g: income) and discrete(cannot have decimals, e.g.: no.of.infants born)   
# Categorical features - They are important for grouping data 
#                       They can be ordinal and nominal

#Binning: 
ifelse(store$TotalSales < 150 , "Poor",
       ifelse(store$TotalSales>=150 && store$TotalSales <= 250, "Medium", "Good")) 

# Encoding - A process of converting categorical features to numeric features, which can be used in model building
# There are 2 types of Encoding: Label encoding and One-hot encoding a.k.a Dummy variables 

# Curse of Dimensionality(high no. of columns w.r.t no. of rows) : Algorithms doesn't work as expected
# How to treat it? If possible, create categories in the column (e.g. assigning cities to state) else, drop the column

# Problem of mutli-collinearity: 
# When there are features that provide same information then model is not statistically significant (e.g. weight in kg/gms)
# The aim is to bring features that provide unique information in the final dataset 
# e.g. E W N S are dummy variables/features with 1/0 mapping.One of the variable can be removed as 3 variables' information can be give away the value of the 4th. Having the 4th variable brings in multi-collinearity   

View(store %>% mutate( City = (ifelse(store$Location == "Delhi", 1,
            ifelse(store$Location == "Chennai", 2,
                   ifelse(store$Location == "Mumbai", 3, 4))))))

# Converting rules: 
# numeric: factor --> character --> numeric 
# date: character --> date
# date: factor --> character --> date
# date: numeric --> character --> date


