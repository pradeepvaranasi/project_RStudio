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
# If we move 1SD above or below the mean, we will cover 68.2% of the data, 2SD above or below the mean, 95.4% and 3SD - 99.7%

# We convert the normal distribution into a standard normal distribution (Z-score = (value-mean)/SD) ; mean=0 and SD=1



# Inferential Statistics
# We draw inferences from the samples regarding the population and relations with the population

# Hypothesis Testing --------------- 
# we have multiple tests to compare: 
# 1. population mean with the sample mean: Z-Test, t-Test
# Z-test: to check if the difference between population mean and sample mean is statistically significant or not. 

# Ho (Null hypothesis): x1 = x2 ; u = x 
# H1 (Alternate hypothesis): x1 != x2; x1 < x2; x1 > x2

# scenario 1: p-value < significance value = Reject null
# scenario 2: p-value > significance value = Accept null

# type1 error: Accepting null, when should have been rejected
# type2 error: Rejecting null, when should have been accepted

# We conduct Z-test when the sample size is more than 30 and SD of the population is known.  

# t-test: Almost same as z-test but here we come up with t-distribution to come up with probabilities. Sample size (15-30) and SD unknown 
# In programming languages R/Python no Z-tests are available cause t-tests will cover all the scenarios such as: 
# sample size >= 30 ; population SD known = Z-test 
# sample size >= 30 ; population SD not known = t-test
# sample size < 30 ; population SD known = t-test
# sample size < 30 ; population SD not known = t-test
# Hence, Z-test becomes part of the t-test in the programming world. 

# Dependent paired t-test (mean of sample1 = mean of sample2 or not) vs Independent t-test (mean of sample1 = mean of sample2 or not but the samples are independent and not paired)

# 2. Hypothesized value with the sample mean
# 3. Different sample means





