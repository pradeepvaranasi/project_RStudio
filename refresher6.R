library(dplyr)
library(readxl)
library(XML)
library(Hmisc)
library(caret)
library(fastDummies)
library(reshape2)
library(ggplot2)
library(plotly)
library(moments)


# Descriptive Statistics ---------------
# We describe the data based on the features    

# Measure of Frequency: Find count of different values in the data(histogram)
# Measure of Central Tendency: We try to find some central value(mean/median/mode)
# Measure of Central Variability/Dispersion: 1. Select Range(min, max; susceptible to outliers); 2. IQR(Q3-Q1; only two values) ; 3. Standard Deviation(using all values)
# Measure of Central Shape: Symmetrical(50%-50% distribution); Asymmetrical 
# Symmetrical: Rectangular, Gaussian(Normal) distribution - mean=mode=median 
# Asymmetrical: If we divide data from mean, we don't have equal(mirror) distribution on left/right


# Central Limit Theorem ---------------

# If we collect a good number of samples(30+) from population and find a distribution, then the distribution is normal even if the population is not a normal distribution
# The mean of all the sample means will be equal to the mean of the population.

# 3 sigma rule: We can get some information about area under the curve by using the stdev of a normal distribution
# If we move 1sd above or below the mean, we will cover 68.2% of the data, 2sd above or below the mean, 95.4% and 3sd - 99.7%















# Inferential Statistics ---------------
# We draw inferences from the samples regarding the population and relations with the population
