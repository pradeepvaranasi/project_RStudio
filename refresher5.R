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
            # Continuous vs. Categorical: Pie Chart, (Multivariate charts) Bar Chart e.g. location vs. sales, Dodged Bar Chart e.g. location vs. store type vs. sales, Facet Bar Chart
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
















