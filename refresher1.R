x = 9
View(x)

# Different datatypes and class() function to check respective datatype

objA = 'abc'
objB = '123'
objC = 'TRUE'


obj1 = 1234
obj2 = 21312132
obj3 = 3123123321
obj4 = 321938123.3423
obj5 = 1323432443.34234
obj6 = 3123121L

objT = TRUE
objF = FALSE

# Functions - helps in re-usability - Systems function and User defined functions
# Package is a list of functions that can be written in C/C++/Java/R. R has more packages than Python
# 
# Objects: Every object has certain function that are dependent on the class of the object 
#
# ** Typecasting: It is dynamic problem which depends on the business problems/scenarios e.g: Income Vs. ZIP 
# 
# Hierarchical typecasting: "String is King" - 
### 1. Cannot convert character/string to numeric* or logical.
#   *except if the variable is stored in numeric format. E.g. if x1="123"; as.numeric(x1) = 123; x2="13,32"; error x2 

#e.g:1
x1 = "123"
as.numeric(x1) 

#e.g:2
x2 = "13,32"
as.numeric(x2) # ***Warning message: NAs introduced by coercion - Need to watch out while data manipulation***

### 2. Cannot convert any numeric to logical. It provides TRUE for any non-zero numbers and FALSE for zero

#e.g:1
x3 = 123
as.logical(x3) #TRUE

#e.g:2
x4 = 0
as.logical(x4) #FALSE

### 3. Can convert logical to String and Numeric* (*without information loss). For instance, 

#e.g:1
as.numeric(objT) #output - 1 

#e.g:2
as.numeric(objF) #output - 0 

# 
# 
# 
# 
# 
# 
# 
# 
# 
# 
