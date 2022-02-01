
library(dplyr)
library(readxl)
library(XML)

#Loading data --------

df1 = read.csv("D:/AI/Practise/R/project_RStudio/data/session4/Datasets/stores.csv", sep = ",", header = T)
df2 = read_excel("D:/AI/Practise/R/project_RStudio/data/session4/Datasets/CarData.xlsx")
df3 = read_excel("D:/AI/Practise/R/project_RStudio/data/session4/Datasets/CarData.xlsx", sheet = 3)
df4 = XML::xmlToDataFrame("D:/AI/Practise/R/project_RStudio/data/session4/Datasets/menu.xml")


#Basic EDA --------