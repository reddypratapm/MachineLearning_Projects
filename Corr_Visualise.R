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
#Plotting bitcoin price vs crude oil price after pre-processing
pdf("visualization.pdf")
plot( X
      ,Y
      , main = "Bitcoin vs Crude Oil (Between 2013 and 2016)"
      , xlab = "Crude oil in dollers per barrel"
      , ylab = "Bitcoin in dollers"
      , pch = 19
      , frame = T)
# We can see there is a slight correlation after few data points on X-axis

# Let us check the correlation and plotting a regression line on scatter plot.
model <- lm(Y ~ X, data =New_data)   # compute the linear model
abline(model, col = "black") 


#Now plot a histogram of our dependent variable ("Oil Price")
h <- hist(Y,
          col = "lightgrey", 
          ylab = "Frequency",
          xlab = "Price of Bitcoin in USD", 
          main = "Histogram of a Bitcoin between 2013 to 2016",
          )

#Lets plot a density curve over the histogram
xfit <- seq(min(Y), max(Y), length = 20) 
yfit <- dnorm(xfit, mean = mean(Y), sd = sd(Y)) 
yfit <- yfit * diff(h$mids[1:2]) * length(Y) 
lines(xfit, yfit, col = "black", lwd = 2)

dev.off()
