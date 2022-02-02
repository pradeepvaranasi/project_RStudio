library(dplyr)
library(readxl)
library(XML)
library(Hmisc)
library(caret)
library(fastDummies)
library(reshape2)

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

# Method1 : creating dummy variables using CARET package

dummyObj = caret::dummyVars(~Location+StoreType, data=df1, fullRank= TRUE)
dummyvars = data.frame(predict(dummyObj, df1))
class(dummyvars)

# Method2 : creating dummy variables using fastDummies package

fastDummiesVar = fastDummies::dummy_cols(df1, select_columns = c("Location","StoreType"), remove_most_frequent_dummy = TRUE)

# dim(dummyvars): 32*5 ; dim(fastDummiesVar): 32*20; The fastDummies function appends new dummy variables to the df.
# Choose caret of fastDummies based on the scenario


# Merging -----------

demo = read.csv("D:/AI/Practise/R/project_RStudio/data/session6/Datasets/Demographic_Data.csv", header = T, stringsAsFactors = T)
trans = read.csv("D:/AI/Practise/R/project_RStudio/data/session6/Datasets/Transaction_Summary.csv", header = T, stringsAsFactors = T)

View(merge(x=demo, y=trans, 
           by.x = "CustName", 
           by.y = "CustomerName", 
           all = F))

?dplyr::left_join()

library(dplyr)
library(readxl)
library(XML)
library(Hmisc)
library(caret)
library(fastDummies)

# Missing values ------------ 

# Multiple ways of dealing with missing values: 
# 1. Removing the missing values 
# 2. Mean/Median/Mode imputation 
# 3. Using predictive models


# Outlier Treatment  ------------ 

# Method 1 - IQR *******

# IQR - {Q3-Q1}; Upper Cut-off = Q3 + 1.5*IQR ; Lower Cut-off = Q1 - 1.5*IQR

V1 = c(1, 2, 3, 150, 180, 200, 250, 290, 320, 1000, 1100)
# quantile(V1, probs = c(0.25, 0.75))
# Q1 = 76.5
# Q3 = 305
# IQR = Q3 - Q1
#OR
IQR(V1)
UC = Q3 + (1.5*IQR) # 647.75
LC = Q1 - (1.5*IQR) # -266.25

V1[V1>UC] = UC # Replacing outliers with UC
V1[V1<LC] = LC # Replacing outliers with LC
V1
# As per above method, the IQR method is influenced towards the right side values of the vectors and hence LC is -ve
# Works best with data that is normally distributed 

# Method 2 - Mean & SD *******
#UC = mean + (2.5*SD); LC = mean - (2.5*SD); 2.5 value can be changed to 2 or 3

# Method 3 - Statistical formulas *******
# UC: 95th percentile and LC: 5th percentile OR 
# UC: 99th percentile and LC: 1st percentile

# Method 4 - Analyzing Percentiles *******
# We look for those percentiles after which the value become very high or very low with sudden jumps/drop resp.
# Hence, we capture percentiles at MIN, 2, 5, 10, 15, 20, 25, 50, 75, 80, 85, 90, 95, 97, 99, MAX
# However, the disadvantage is it is time consuming to apply this method to multiple columns 

# Method 5 - Density based estimation # Used ML concepts 



