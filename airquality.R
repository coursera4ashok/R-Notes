library(datasets)
head(airquality)
# checkout the values in air-quality
head(airquality)
# Group values by month
s<-split(airquality,airquality$Month)
# print the value mean of Ozone, Solar.R and Wind
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
# print the value mean of Ozone, Solar.R and Wind; Exclude NA values
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm = TRUE))
