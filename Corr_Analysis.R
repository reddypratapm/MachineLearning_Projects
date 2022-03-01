#Load the data set
d<-read.csv("data.csv")
#Load top 5 rows of the data set
head(d)

# We can notice very lengthy column names. So, Lets cut short the column names.
colnames(d) <- c("Date", "Bitcoin_avg_price", "Oil_price") # Crude_oil_spot_price_dollars_per_barrel

#Now verify the column names
head(d)

#Check for any null values in the data frame
is.null(d) # There are no null values

#Lets take subset of data from original data
New_data <- d[1:30,]
library(tidyverse)
#Assigning X,Y variables
Y<-New_data$Bitcoin_avg_price
X<-New_data$Oil_price

cor.test(X,Y , method = "spearman")
