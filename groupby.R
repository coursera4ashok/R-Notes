# @seealso airquality.R

# Group values by month
s<-split(airquality,airquality$Month)

# print the value mean of Ozone, Solar.R and Wind
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
# print the value mean of Ozone, Solar.R and Wind; Exclude NA values
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))


# For grouping by multiple columns you can use list
# eg: If there is a factor Male/Female & another factor Month
x<-rnorm(10)   # simulating readings
gender<-gl(2,5)
month<-gl(5,2)

str(split(x,list(gender,month)))   # has empty rows

# drop empty rows
str(split(x,list(gender,month),drop=TRUE))
# in the printed value, 1.1 means Male & Month ()