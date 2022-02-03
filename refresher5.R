library(dplyr)
library(readxl)
library(XML)
library(Hmisc)
library(caret)
library(fastDummies)
library(reshape2)
library(ggplot2)
library(plotly)

# Data Visualization ---------------

# Different type of charts: Business driven (flow chart, SWOT, fish bone etc.); Data driven ** priority  (create/modify/aggregate/manipulate)
# Data Driven Charts: Distribution, Trend, Composition, 
# Distribution: Bar chart (categories) vs. Histogram (continuous number ranges), Box-plot
# Trend: Line chart(ever increasing component on x-axis: price vs. time, score vs. no.of.overs, income vs. age etc) 
# Comparison: Continuous vs. Continuous / Continuous vs. Categorical /  Categorical vs. Categorical
            # Continuous vs. Continuous: Multiple Line chart, Scatter Plot***, 
            # Continuous vs. Categorical: Pie Chart, (Multivariate charts) Bar Chart e.g. location vs. sales, Dodge Bar Chart e.g. location vs. store type vs. sales, Facet Bar Chart
            # Categorical vs. Categorical: Cross-Freq table 
# Composition: They just tell you the categories present in the data. E.g.: Pie chart


# How to create charts? Using base R, ggplot2, plotly 

df = read.csv("D:/AI/Practise/R/project_RStudio/data/session7/Assignment - For Practise Only/stores.csv", header = T, stringsAsFactors = T)

usj = USJudgeRatings


# Distribution Charts 

# Box Plots ---------------

# Method 1: Base R - They mostly require vectors

boxplot(x = df$OperatingCost)
boxplot(x = usj$RTEN)

# Method 2: ggplot2 - 1. Canvas, 2. Axis(x,y), 3. Type of plot/chart 4. Beautification (colors, themes, titles etc)
# syntax ggplot2::ggplot(data=df) + aes (x= , y= ) + geom_typeOfChart(......+ Beautification) + additional arguments .........

# Step 1: 
ggplot2::ggplot(data=usj) +

# Step 2: 
aes(y=RTEN) +

# Step 3: 
geom_boxplot() + # step 4 optional 

# Step 5: 
ylab(label = "Retention")
  

# Histogram ---------------

# Method 1: Base R - They mostly require vectors

hist(df$OperatingCost, breaks = 7)

# Method 2: ggplot2

ggplot2::ggplot(data = df) + 
  aes(x=OperatingCost) + 
  geom_histogram(bins = 5, color="red", fill="sky blue")



# Trend charts 
  
# Line Chart  ---------------

# Method 1: Base R
plot(df$OperatingCost, type = "b") # "l" for line, "p" for scatter plot and "b" for both 


# Scatter Plot  --------------- 
# num - num

# Uni variate scatter plot 

# Method 1: base R
plot(df$OperatingCost)

# Method 2: ggplot2, similar base R function, however need to mention the index
index = 1:length(df$OperatingCost)
ggplot2::qplot(x = index, y = df$OperatingCost, geom = "point", xlab = "index", ylab = "OC", main = "univariate scatter plot")


# Bi variate scatter plot 

# Method 1: base R
plot(x = df$OperatingCost, y = df$TotalSales)

# Method 2: ggplot2
ggplot2::ggplot(data = df) + aes(x=OperatingCost, y=TotalSales) + geom_point()


# Bar Chart  --------------- 

# Uni variate 

df1 = df %>% dplyr::group_by(StoreType) %>% dplyr::summarise(Freq =n())

ggplot(data = df1) + 
  aes(x = StoreType, y = Freq) + 
  geom_bar(stat = "identity") #additional argument 

# Bi variate 

df2 = df %>% dplyr::group_by(Location) %>% dplyr::summarise(sumTS =sum(TotalSales))

ggplot(data = df2) + 
  aes(x = Location, y = sumTS) + 
  geom_bar(stat = "identity") #additional argument 

# Multi variate - Stacked / Dodge / Facet 
# Creating an aggregated dataset using 3 columns (2 cat + 1 num)

df3 = df %>% dplyr::group_by(Location, StoreType) %>% dplyr::summarise(sumTS =sum(TotalSales))

# Stacked
ggplot2::ggplot(data = df3) + aes(x=Location, y=sumTS, fill=StoreType) + geom_bar(stat = "identity")

# Dodge
ggplot2::ggplot(data = df3) + aes(x=Location, y=sumTS, fill=StoreType) + geom_bar(stat = "identity", position = "dodge")

# Facet 
ggplot2::ggplot(data = df3) + aes(x=Location, y=sumTS) + geom_bar(stat = "identity") + facet_grid(StoreType~.)
# Col1~. -> cutting the y-axis; .~Col1 -> cutting the x-axis



























