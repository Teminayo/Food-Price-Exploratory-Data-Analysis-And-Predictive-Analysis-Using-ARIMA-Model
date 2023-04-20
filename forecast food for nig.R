 #IMPORT DATASET
library(readr)
food_prices_large_Nig <- read_csv("C:/Users/Elite/Downloads/food_prices/food_prices/food_prices_large Nig.csv")
View(food_prices_large_Nig)
attach(food_prices_large_Nig)

#Load library
library(tidyverse)
library(forecast)
library(TSA)
library(caret)
library(ggplot2)

#data preparation
Price <- ts (food_prices_large_Nig$Price,start = c(2002,1),
             end = c(2015,11),frequency = 12)

#data exploration
plot(Price)
#annual correlation
acf(Price)
#model evaluation for better forecast
model <- auto.arima(Price)
accuracy(model)

#forecating 60 MONTHS(5YEARS) 12*5 =60
forecast_price <- forecast(model, h = 60)
plot(forecast_price)


#VIEW FORCAST FOR MONTH
forecast_price$mean
lines(forecast_price$mean, col = "PINK")
