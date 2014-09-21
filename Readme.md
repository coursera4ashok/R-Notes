#My notes on R

* help.search(‘mean’) OR ?mean — to get help on mean
* Data types: int, decimal, number, vector et al

## Vector
  * A vector of like objects
  * is.atomic
  * is.vector == TRUE
  * is.list == FALSE

##List:
  * A bag of unlike objects
  * NOT is.atomic
  * is.vector == TRUE
  * is.list == TRUE

* All numeric datatypes are Number unless specified with nL (100L) for integer
* Creating a list/vector “x<-c(1, ‘abc', 55);”, element of 3 with different elements in the list/vector; Do NOT use double quotes
* Creating vector is “x <- vector("numeric", length = 10)"
* Create a list with a sequence “x<-1:20”'
* Casting is done by doing as.numeric(x) or as.logical(x) or as.character(x)
* '''m<-matrix(1:6, nrow=2, ncol=3); dim (m) OR attributes(m) — shows dimensions'''
  * matrix with column & row binding — cbind and rbind
  * x<-1:3; y<-10:12; cbind(x,y)
  * rbind(x,y) 

* x <- list(1,”a”, TRUE, 1 + 4i) — creates a list of objects (more like a bag)
* Factors are used for representing categorical data. x<- factor(c('yes','no','yes','no','no'),levels=c('yes','no'))
  * To obtain numerical data do unclass(x)

* is.na() vs is.nan()
* data frames are tables for data;  Elements of the column have the same length;

  * data frames have row.names
  * Data Frames are usually created by calling read.table() or read.csv()
  * Can be converted to a matrix by calling data.matrix()
  * x<-data.frame(foo=1:4, bar=c(T,T,F,F))
  * nrow(x) = 4 and ncol(x) = 2

* Vector can have names x<-1:2; names(x)<-c(‘one’,’two’,’three’);
* List can have names
* matrices can have names as well called dimnames.   dimnames(m)<-list(c(‘a’,’b’), c(‘c’,’d’))
* Find out function arguments str(split)

# Subsetting
* [ is for extracting from an object
  * x[1]; x[1:4]; x[x > ’a’]; u<- x > ‘a’, x[u] — get all the elements that have TRUE  in u
* [[ is used for a matrix
  * x[1,2], x[,1]
* $ is extracting with name
* Print first two rows x[1:2,]
* x$Ozone[is.na(x$Ozone)] — selecting column that is NA

* mean(x$Ozone[!is.na(x$Ozone)]) — mean exclude NA

* y<-subset(x,x$Ozone>31 & x$Temp>90) — Create a subset of a table with given conditions

* max(y$Ozone[!is.na(y$Ozone)]) — max of ozone


Reading data into R


* read.table, read.csv
* readLines
* source — reading R code files (inverse of dump)
* dget for getting R code files (inverse of dput)
* load for reading in saved workspaces
* unsearialize, for reading R objects in binary form
* write.table, writeLines, dump, dput, save, serialize
* read.table

  * file, the name of a file, or a connection
  * header, logical indicating if the file has a header line
  * sep, a string indicating how the columns are separated
  * colClasses, a character vector indicating the class of each column in the dataset · nrows, the number of rows in the dataset
  * comment.char, a character string indicating the comment character
  * skip, the number of lines to skip from the beginning
  * stringsAsFactors, should character variables be coded as factors?

* Efficient read.table

  * initial <- read.table("datatable.txt", nrows = 100) classes <- sapply(initial, class)
  * tabAll <- read.table("datatable.txt",colClasses = classes)




* dput(trees) or dput(trees, files=‘trees.R’) # efficient way for recreating
* dump is dput for multiple objects

  * dump(c(‘x’,’y’), file=‘x_y.R’)

* fiel opens a file
* gzfile opens a compressed gzip
* bzfile
* url opens a connection to a webpage
* con<-file(‘abc.txt’, ‘r’)
* data<-read.csv(con)
* close(con)
* simpler read.csv(‘abc.csv’,’r’)

for loop: for(i in 1:10) { … }
if: y<-if(…) { 55 } else { 93 }
vector is an associative array.   Index can be number or character.
seq_len(5) —> creates a sequence 
next — similar to continue

##Functions:
formals(function_name) — describes arguments of a function
args(function_name) — prints all the arguments;  a better method
Return value is the last expression in the function.
f<-function(a,b=1,c=TRUE){ … } — function name is ‘f’
ls(environment(fun1)) — This will tell the variables used inside function fun1


#Date:


* as.Date

* x<-Sys.time()

* p<-as.POSIXlt(x)

* unclass(p)


#apply, lapply, sapply


* lapply: Loop over a list and evaluate a function on each element · sapply: Same as lapply but try to simplify the result

* apply: Apply a function over the margins of an array

* tapply: Apply a function over subsets of a vector

* mapply: Multivariate version of lapply

* apply is used for doing the same operation to the margins of the matrix

  * m<-matrix(c(1:9),nrow=3,ncol=3) # create a 3x3 matrix
  * Apply takes three parameters, 

    * M — matrix
    * margin — 1 column wise & 2 row wise
    * function that needs to be applied

  * apply(m,1,mean)  # mean column wise
  * apply(m,2,function(x) x^2)  # square all the elements, row wise; 

* lapply & sapply is used for doing the same operation on every element of a list
```R
l <- c(1:9) # create a vector of 1 to 9
lapply(l, function(x) x^2) # squaring all the elements of the vector
# sapply behaves the same way as lapply but prints better
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x,mean) # prints the mean of a, b, c, d
sapply(x, mean) # prints it well
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(x,function(e) e[,1]) # Anonymous function for extracting the first column

# tapply is used to apply a function over subsets of a vector
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f<-gl(3,10)   # create 3 groups of 10, Level 1, 2 & 3
tapply(x, f, mean)  # calculate mean for each group
f2<-int.rep(1:3,10) # creates 3 groups of 1,2,3
tapply(x,f2,mean)   # calculate mean for each group
```
* split takes a vector or other objects and splits it into groups determined by a factor or list of factors


  * split(x,f,drop=FALSE,…)
  * x is a Vector
  * f is factor or list of factors
  * drop indicates whether empty factors levels should be dropped
  * x <- c(rnorm(10), runif(10), rnorm(10, 1))
  * f<-gl(3,10) # creates a vector with 10 of 1, 10 of 2 and 10 of 3
  * split(x,f)  # splits the list x into 3 parts with first 10 values in one, second 10 in another and so on
  * lapply(split(x,f), mean) # calculate means on those
  * combination of lapply and split can be used as “GROUP BY” in SQL
```R
library(datasets)
head(air quality)
# Group values by month
s<-split(airquality,airquality$Month)

# print the value mean of Ozone, Solar.R and Wind
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
# print the value mean of Ozone, Solar.R and Wind; Exclude NA values
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
  * To have more than one variable in group by
  * # For grouping by multiple columns you can use list
# eg: If there is a factor Male/Female & another factor Month
x<-rnorm(10)   # simulating readings
gender<-gl(2,5)
month<-gl(5,2)

str(split(x,list(gender,month)))   # has empty rows

# drop empty rows
str(split(x,list(gender,month),drop=TRUE))
# in the printed value, 1.1 means Male & Month ()
```

* mapply is a multivariate apply of sorts which applies to a function in parallel over a set of arguments

  * list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
  * # functionally same
  * mapply(rep, 1:4, 4:1)



#Debugging


* invisible(x) # do not print the value of x even if the function returns x
* traceback: prints out the function call stack after an error occurs; does nothing if there’s no error
* debug: flags a function for “debug” mode which allows you to step through execution of a function one line at a time
* browser: suspends the execution of a function wherever it is called and puts the function in debug mode
* trace: allows you to insert debugging code into a function a specific places
* recover: allows you to modify the error behavior so that you can browse the function call stack
* debug(lm) # stop when method lm is called
* lm(x - y) # this will stop in lm and show the code in the browser







https://github.com/edj-boston/coursera-r-programming/blob/master/week-02/quiz.md

